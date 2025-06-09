#!/usr/bin/env python3

import sys
import re
import os
from collections import defaultdict

def parse_component_definitions(dip_file_path):
    """Parse component definitions from dip/dip.vhd to get port directions."""
    components = {}
    
    try:
        with open(dip_file_path, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: Could not find {dip_file_path}")
        sys.exit(1)
    
    # Find component definitions
    component_pattern = r'component\s+(\w+)\s+is\s+port\s*\((.*?)\s*\);\s*end\s+component;'
    port_pattern = r'p(\d+)\s*:\s*(in|out)\s+std_logic'
    
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
        
        components[component_name] = ports
    
    return components

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
    """Parse a component instantiation line."""
    # Pattern: label : component port map (ports);
    pattern = r'(\w+)\s*:\s*(\w+)\s+port\s+map\s*\((.*?)\)\s*;'
    match = re.match(pattern, line.strip(), re.IGNORECASE)
    
    if not match:
        return None
    
    label = match.group(1)
    component = match.group(2)
    ports_str = match.group(3)
    
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
    
    # Get page name from filename
    basename = os.path.basename(file_path)
    if not basename.endswith('_suds.vhd'):
        print(f"Error: File {file_path} is not a SUDS file")
        sys.exit(1)
    
    page_name = basename[:-9]  # Remove '_suds.vhd'
    
    # Parse component definitions
    dip_file_path = 'dip/dip.vhd'
    components = parse_component_definitions(dip_file_path)
    
    # Parse VHDL file
    result = parse_vhd_file(file_path, verbose)
    if result is None:
        # Empty file - skip processing
        return
    lines, begin_line, end_line = result
    
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
            # Check if component names match
            if merged_instantiations[label]['component'] != component:
                print(f"Error: Component mismatch for label {label}: {merged_instantiations[label]['component']} vs {component}")
                sys.exit(1)
            
            # Check for duplicate pins
            for pin, signal in inst['ports'].items():
                if pin in merged_instantiations[label]['ports']:
                    print(f"Error: Duplicate pin p{pin} for label {label}")
                    sys.exit(1)
                merged_instantiations[label]['ports'][pin] = signal
        else:
            merged_instantiations[label] = {
                'component': component,
                'ports': inst['ports'].copy()
            }
    
    # Issue 2: Find @designator,pin signals
    at_signals = find_at_signals(instantiations)
    
    # Find signal pairs that need to be connected
    signal_connections = []
    for designator, pin_num in at_signals:
        target_label = f"{page_name}_{designator}"
        signal_name = f"\\@{designator},p{pin_num}\\"
        
        # Look for the reverse signal (if A connects to B, B should connect to A)
        for inst in instantiations:
            if inst['label'] == target_label:
                for port_pin, port_signal in inst['ports'].items():
                    if port_pin == pin_num:
                        # Found the matching component pin
                        # Check if it's connected to a @signal that points back
                        reverse_pattern = r'\\@(\w+),p(\d+)\\'
                        match = re.search(reverse_pattern, port_signal)
                        if match:
                            reverse_designator = match.group(1)
                            reverse_pin = int(match.group(2))
                            reverse_signal = f"\\@{reverse_designator},p{reverse_pin}\\"
                            
                            # Create connection: reverse_signal <= signal_name
                            connection = (reverse_signal, signal_name)
                            if connection not in signal_connections:
                                signal_connections.append(connection)
    
    # Issue 3: Add missing port terminations
    for label, inst in merged_instantiations.items():
        component = inst['component']
        
        if component not in components:
            print(f"Error: Component definition for {component} not found")
            sys.exit(1)
        
        component_ports = components[component]
        
        for pin_num, direction in component_ports.items():
            if pin_num not in inst['ports']:
                if direction == 'in':
                    inst['ports'][pin_num] = "'0'"
                elif direction == 'out':
                    inst['ports'][pin_num] = "open"
    
    # Generate new instantiation lines
    new_lines = []
    
    # Add signal declarations for @designator,pin signals
    signal_declarations = []
    for designator, pin_num in sorted(at_signals):
        signal_name = f"@{designator},p{pin_num}"
        if signal_name not in existing_signals:
            signal_declarations.append(f"signal \\{signal_name}\\ : std_logic;\n")
    
    # Add signal assignment statements for connections
    signal_assignments = []
    processed_pairs = set()
    
    for target_signal, source_signal in signal_connections:
        # Skip self-assignments (signal <= signal)
        if target_signal == source_signal:
            continue
            
        # Create a canonical pair to avoid duplicate assignments in both directions
        pair = tuple(sorted([target_signal, source_signal]))
        if pair not in processed_pairs:
            processed_pairs.add(pair)
            # Always assign in a consistent direction (alphabetically first <= second)
            if target_signal < source_signal:
                signal_assignments.append(f"{target_signal} <= {source_signal};\n")
            else:
                signal_assignments.append(f"{source_signal} <= {target_signal};\n")
    
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
        
        # Sort ports by pin number
        sorted_ports = sorted(ports.items())
        
        # Build port map string
        port_map_parts = []
        for pin_num, signal in sorted_ports:
            port_map_parts.append(f"p{pin_num} => {signal}")
        
        port_map_str = ", ".join(port_map_parts)
        
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