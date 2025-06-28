#!/usr/bin/env python3

import sys
import re
import os
from collections import defaultdict

def parse_component_definitions(dip_file_path):
    """Parse component definitions from dip/dip.vhd to get port directions and generics."""
    components = {}
    aliases = {}
    
    try:
        with open(dip_file_path, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: Could not find {dip_file_path}")
        sys.exit(1)
    
    # Find component definitions - updated to handle generics
    component_pattern = r'component\s+(\w+)\s+is\s*(?:generic\s*\(.*?\);\s*)?port\s*\((.*?)\s*\);\s*end\s+component;'
    port_pattern = r'p(\d+)\s*:\s*(in|out|inout)\s+std_logic'
    
    for match in re.finditer(component_pattern, content, re.DOTALL | re.IGNORECASE):
        component_name = match.group(1)
        ports_section = match.group(2)
        
        # Check for duplicates
        if component_name in components:
            print(f"Error: Multiple definitions found for component {component_name}")
            sys.exit(1)
        
        ports = {}
        for port_match in re.finditer(port_pattern, ports_section):
            pin_num = int(port_match.group(1))
            direction = port_match.group(2).lower()
            ports[pin_num] = direction
        
        # Check if component has generics by looking for generic keyword before port
        has_generics = bool(re.search(r'component\s+' + re.escape(component_name) + r'\s+is\s*generic\s*\(', content, re.IGNORECASE))
        
        components[component_name] = {
            'ports': ports,
            'has_generics': has_generics
        }
    
    # Find alias definitions
    alias_pattern = r'alias\s+(\w+)\s+is\s+(\w+)\s*;'
    for match in re.finditer(alias_pattern, content, re.IGNORECASE):
        alias_name = match.group(1)
        actual_name = match.group(2)
        aliases[alias_name] = actual_name
    
    return components, aliases

def resolve_component_name(component_name, components, aliases):
    """Resolve component name through aliases if necessary."""
    if component_name in components:
        return component_name, components[component_name]
    elif component_name in aliases:
        actual_name = aliases[component_name]
        if actual_name in components:
            return actual_name, components[actual_name]
        else:
            return None, None
    else:
        return None, None

def parse_vhd_file(file_path, verbose=False):
    """Parse VHDL file and extract component instantiations."""
    try:
        with open(file_path, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Could not find {file_path}")
        sys.exit(1)
    
    # Find architecture begin/end
    begin_line = -1
    end_line = -1
    
    for i, line in enumerate(lines):
        if re.match(r'\s*begin\s*$', line, re.IGNORECASE):
            begin_line = i
        elif re.match(r'\s*end\s+architecture\s*;?\s*$', line, re.IGNORECASE):
            end_line = i
            break
    
    if begin_line == -1 or end_line == -1:
        if len(lines) == 0 or (len(lines) == 1 and lines[0].strip() == ""):
            # Empty file - skip processing
            if verbose:
                print(f"Skipping empty file: {file_path}")
            return None
        else:
            print(f"Error: Could not find architecture begin/end in {file_path}")
            if len(lines) < 5:
                print("File contents:")
                for i, line in enumerate(lines, 1):
                    print(f"  {i}: {repr(line)}")
            sys.exit(1)
    
    return lines, begin_line, end_line

def split_port_assignments(ports_str):
    """Split port assignments by commas, respecting VHDL escape sequences."""
    assignments = []
    current = ""
    i = 0
    
    while i < len(ports_str):
        char = ports_str[i]
        
        if char == '\\':
            # Start of escaped identifier, find the closing backslash
            start = i
            i += 1  # Skip opening backslash
            while i < len(ports_str) and ports_str[i] != '\\':
                i += 1
            if i < len(ports_str):
                i += 1  # Include closing backslash
            current += ports_str[start:i]
        elif char == ',':
            # Found a comma outside of an escaped identifier
            if current.strip():
                assignments.append(current.strip())
            current = ""
            i += 1
        else:
            current += char
            i += 1
    
    if current.strip():
        assignments.append(current.strip())
    
    return assignments

def parse_component_instantiation(line):
    """Parse a component instantiation line that may include generic map."""
    # Pattern: label : component [generic map (...)] port map (ports);
    # First try with generic map
    pattern_with_generic = r'(\w+)\s*:\s*(\w+)\s+generic\s+map\s*\((.*?)\)\s+port\s+map\s*\((.*?)\)\s*;'
    match = re.match(pattern_with_generic, line.strip(), re.IGNORECASE)
    
    if match:
        label = match.group(1)
        component = match.group(2)
        generics_str = match.group(3)
        ports_str = match.group(4)
        
        # Parse generic mappings
        generics = {}
        generic_assignments = split_port_assignments(generics_str)
        for assignment in generic_assignments:
            # Handle generic assignments like fn => "rom/file.hex"
            gen_match = re.match(r'(\w+)\s*=>\s*(.*)', assignment.strip())
            if gen_match:
                gen_name = gen_match.group(1)
                gen_value = gen_match.group(2).strip()
                generics[gen_name] = gen_value
    else:
        # Try without generic map (original pattern)
        pattern = r'(\w+)\s*:\s*(\w+)\s+port\s+map\s*\((.*?)\)\s*;'
        match = re.match(pattern, line.strip(), re.IGNORECASE)
        
        if not match:
            return None
        
        label = match.group(1)
        component = match.group(2)
        ports_str = match.group(3)
        generics = {}
    
    # Parse port mappings
    ports = {}
    port_assignments = split_port_assignments(ports_str)
    
    # Parse each port assignment
    for assignment in port_assignments:
        match = re.match(r'p(\d+)\s*=>\s*(.*)', assignment.strip())
        if match:
            pin_num = int(match.group(1))
            signal = match.group(2).strip()
            ports[pin_num] = signal
    
    return {
        'label': label,
        'component': component,
        'ports': ports,
        'generics': generics,
        'original_line': line
    }

def find_at_signals(instantiations):
    """Find all @designator,pin signals used in instantiations."""
    at_signals = set()
    pattern = r'\\@(\w+),p(\d+)\\'
    
    for inst in instantiations:
        for signal in inst['ports'].values():
            match = re.search(pattern, signal)
            if match:
                designator = match.group(1)
                pin_num = int(match.group(2))
                at_signals.add((designator, pin_num))
    
    return at_signals

def fix_suds_file(file_path, verbose=False):
    """Fix the SUDS VHDL file according to the three issues."""
    
    # Parse component definitions
    dip_file_path = 'dip/dip.vhd'
    components, aliases = parse_component_definitions(dip_file_path)
    
    # Parse VHDL file
    result = parse_vhd_file(file_path, verbose)
    if result is None:
        # Empty file - skip processing
        return
    lines, begin_line, end_line = result
    
    # Get page name from architecture line
    page_name = None
    for line in lines:
        # Look for architecture line: architecture suds of <PAGE> is
        match = re.match(r'\s*architecture\s+suds\s+of\s+(\w+)\s+is', line, re.IGNORECASE)
        if match:
            entity_name = match.group(1)
            # Check if entity name is in cadr_<PAGE> format or just <PAGE> format
            if entity_name.startswith('cadr_'):
                page_name = entity_name[5:]  # Remove 'cadr_' prefix
            else:
                page_name = entity_name
            break
    
    if page_name is None:
        print(f"Error: Could not find architecture line with suds pattern in {file_path}")
        sys.exit(1)
    
    # Extract existing signal declarations
    existing_signals = set()
    for i in range(begin_line):
        line = lines[i].strip()
        if line.startswith('signal'):
            match = re.search(r'signal\s+\\(@[^\\]+)\\\s*:', line)
            if match:
                existing_signals.add(match.group(1))
    
    # Extract and parse component instantiations
    instantiations = []
    instantiation_lines = []
    
    for i in range(begin_line + 1, end_line):
        line = lines[i]
        if line.strip() and not line.strip().startswith('--'):
            inst = parse_component_instantiation(line)
            if inst:
                instantiations.append(inst)
                instantiation_lines.append(i)
    
    # Issue 1: Merge repeated designators
    merged_instantiations = {}
    
    for inst in instantiations:
        label = inst['label']
        component = inst['component']
        
        if label in merged_instantiations:
            # Check if component names match (resolve through aliases)
            existing_component = merged_instantiations[label]['component']
            existing_resolved, existing_def = resolve_component_name(existing_component, components, aliases)
            current_resolved, current_def = resolve_component_name(component, components, aliases)
            
            if existing_resolved != current_resolved:
                print(f"Error: Component mismatch for label {label}: {existing_component} (resolves to {existing_resolved}) vs {component} (resolves to {current_resolved})")
                sys.exit(1)
            
            # Check for duplicate pins
            for pin, signal in inst['ports'].items():
                if pin in merged_instantiations[label]['ports']:
                    print(f"Error: Duplicate pin p{pin} for label {label}")
                    sys.exit(1)
                merged_instantiations[label]['ports'][pin] = signal
            
            # Merge generics (should be the same for same component)
            for gen_name, gen_value in inst['generics'].items():
                if gen_name in merged_instantiations[label]['generics']:
                    if merged_instantiations[label]['generics'][gen_name] != gen_value:
                        print(f"Error: Generic mismatch for {label}.{gen_name}: {merged_instantiations[label]['generics'][gen_name]} vs {gen_value}")
                        sys.exit(1)
                else:
                    merged_instantiations[label]['generics'][gen_name] = gen_value
        else:
            merged_instantiations[label] = {
                'component': component,
                'ports': inst['ports'].copy(),
                'generics': inst['generics'].copy()
            }
    
    # Issue 2: Find @designator,pin signals and create nets
    at_signals = find_at_signals(instantiations)
    
    # Collect all @signals used in instantiations
    all_at_signals = set()
    at_pattern = r'\\@(\w+),p(\d+)\\'
    for inst in instantiations:
        for port_signal in inst['ports'].values():
            match = re.search(at_pattern, port_signal)
            if match:
                designator = match.group(1)
                pin_num = int(match.group(2))
                at_signal = f"\\@{designator},p{pin_num}\\"
                all_at_signals.add(at_signal)
    
    # Group interconnected @signals into nets using Union-Find
    signal_to_net = {}
    nets = []
    
    def find_root(signal):
        if signal not in signal_to_net:
            return None
        root = signal_to_net[signal]
        # Path compression
        if isinstance(root, str) and root != signal:
            signal_to_net[signal] = find_root(root)
            return signal_to_net[signal]
        return root
    
    def union_signals(sig1, sig2):
        root1 = find_root(sig1)
        root2 = find_root(sig2)
        
        if root1 is None and root2 is None:
            # Both signals are new, create a new net
            net_idx = len(nets)
            nets.append(set())
            signal_to_net[sig1] = net_idx
            signal_to_net[sig2] = net_idx
            nets[net_idx].add(sig1)
            nets[net_idx].add(sig2)
        elif root1 is None:
            # sig1 is new, add to sig2's net
            signal_to_net[sig1] = root2
            nets[root2].add(sig1)
        elif root2 is None:
            # sig2 is new, add to sig1's net
            signal_to_net[sig2] = root1
            nets[root1].add(sig2)
        elif root1 != root2:
            # Merge two different nets
            # Move all signals from net root2 to net root1
            for sig in nets[root2]:
                signal_to_net[sig] = root1
                nets[root1].add(sig)
            nets[root2] = set()  # Clear the merged net
    
    # Find connections between @signals
    for inst in instantiations:
        label = inst['label']
        for port_pin, port_signal in inst['ports'].items():
            match = re.search(at_pattern, port_signal)
            if match:
                designator = match.group(1)
                pin_num = int(match.group(2))
                current_signal = f"\\@{designator},p{pin_num}\\"
                
                # This @signal should connect to pin {pin_num} of component {page}_{designator}
                target_label = f"{page_name}_{designator}"
                
                # Find what's connected to pin {pin_num} of target component
                for target_inst in instantiations:
                    if target_inst['label'] == target_label and pin_num in target_inst['ports']:
                        target_port_signal = target_inst['ports'][pin_num]
                        target_match = re.search(at_pattern, target_port_signal)
                        if target_match:
                            target_designator = target_match.group(1)
                            target_pin = int(target_match.group(2))
                            target_signal = f"\\@{target_designator},p{target_pin}\\"
                            
                            # Union these two signals
                            union_signals(current_signal, target_signal)
                        break
    
    # Add any isolated @signals to their own nets
    for at_signal in all_at_signals:
        if find_root(at_signal) is None:
            net_idx = len(nets)
            nets.append({at_signal})
            signal_to_net[at_signal] = net_idx
    
    # Create new signal names for each net and replace @signals
    net_signal_names = {}
    for net_idx, net in enumerate(nets):
        if net:  # Skip empty nets
            # Generate a unique signal name
            net_signal_name = f"net_{len(net_signal_names)}"
            net_signal_names[net_idx] = net_signal_name
            
            # Replace all @signals in this net with the new signal name
            for inst in merged_instantiations.values():
                for port_pin in inst['ports']:
                    if inst['ports'][port_pin] in net:
                        inst['ports'][port_pin] = net_signal_name
    
    # Issue 3: Add missing port terminations
    for label, inst in merged_instantiations.items():
        component = inst['component']
        
        # Resolve component name through aliases if necessary for port lookup
        resolved_name, component_def = resolve_component_name(component, components, aliases)
        
        if component_def is None:
            print(f"Error: Component definition for {component} not found")
            sys.exit(1)
        
        component_ports = component_def['ports']
        
        for pin_num, direction in component_ports.items():
            if pin_num not in inst['ports']:
                if direction == 'in':
                    inst['ports'][pin_num] = "'Z'"
                elif direction == 'out':
                    inst['ports'][pin_num] = "open"
                elif direction == 'inout':
                    inst['ports'][pin_num] = "open"
    
    # Generate new instantiation lines
    new_lines = []
    
    # Add signal declarations for net signals
    signal_declarations = []
    for net_idx, signal_name in sorted(net_signal_names.items()):
        signal_declarations.append(f"signal {signal_name} : std_logic;\n")
    
    # No signal assignments needed anymore since we replaced @signals directly with net signals
    signal_assignments = []
    
    # Build new file content
    result_lines = lines[:begin_line]
    
    # Add signal declarations if any
    if signal_declarations:
        result_lines.extend(signal_declarations)
    
    # Add the begin line
    result_lines.append(lines[begin_line])
    
    # Add signal assignments
    if signal_assignments:
        result_lines.extend(signal_assignments)
    
    # Add component instantiations
    for label in sorted(merged_instantiations.keys()):
        inst = merged_instantiations[label]
        component = inst['component']
        ports = inst['ports']
        generics = inst['generics']
        
        # Sort ports by pin number
        sorted_ports = sorted(ports.items())
        
        # Build port map string
        port_map_parts = []
        for pin_num, signal in sorted_ports:
            port_map_parts.append(f"p{pin_num} => {signal}")
        
        port_map_str = ", ".join(port_map_parts)
        
        # Build instantiation line with or without generic map
        # Resolve component name to check for generics (but keep original component name in output)
        resolved_name, component_def = resolve_component_name(component, components, aliases)
        has_generics = component_def['has_generics'] if component_def else False
        
        if generics and has_generics:
            # Sort generics for consistent output
            sorted_generics = sorted(generics.items())
            generic_map_parts = []
            for gen_name, gen_value in sorted_generics:
                generic_map_parts.append(f"{gen_name} => {gen_value}")
            generic_map_str = ", ".join(generic_map_parts)
            new_line = f"{label} : {component} generic map ({generic_map_str}) port map ({port_map_str});\n"
        else:
            new_line = f"{label} : {component} port map ({port_map_str});\n"
        
        result_lines.append(new_line)
    
    result_lines.extend(lines[end_line:])
    
    # Write back to file
    try:
        with open(file_path, 'w') as f:
            f.writelines(result_lines)
    except Exception as e:
        print(f"Error writing to {file_path}: {e}")
        sys.exit(1)

def main():
    verbose = False
    if len(sys.argv) == 3 and sys.argv[1] == "-v":
        verbose = True
        file_path = sys.argv[2]
    elif len(sys.argv) == 2:
        file_path = sys.argv[1]
    else:
        print("Usage: fix-suds.py [-v] <suds_file.vhd>")
        sys.exit(1)
    
    fix_suds_file(file_path, verbose)

if __name__ == "__main__":
    main() 