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



def parse_generic_map_file(generic_map_file_path):
    """Parse a text file containing generic map assignments in format: <page>.<label> <fn_value>"""
    generic_mappings = {}
    
    if not generic_map_file_path or not os.path.exists(generic_map_file_path):
        return generic_mappings
    
    try:
        with open(generic_map_file_path, 'r') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                # Skip empty lines and comments
                if not line or line.startswith('#') or line.startswith('--'):
                    continue
                
                # Parse format: <page>.<label> <fn_value>
                parts = line.split(None, 1)  # Split on whitespace, max 2 parts
                if len(parts) != 2:
                    print(f"Warning: Invalid format in {generic_map_file_path} line {line_num}: {line}")
                    continue
                
                page_label, fn_value = parts
                if '.' not in page_label:
                    print(f"Warning: Invalid page.label format in {generic_map_file_path} line {line_num}: {page_label}")
                    continue
                
                page, label = page_label.split('.', 1)
                
                if page not in generic_mappings:
                    generic_mappings[page] = {}
                
                generic_mappings[page][label] = fn_value
                
    except Exception as e:
        print(f"Error reading generic map file {generic_map_file_path}: {e}")
        sys.exit(1)
    
    return generic_mappings

def fix_suds_file(file_path, verbose=False, generic_mappings=None):
    """Fix the SUDS VHDL file according to the three issues."""
    
    if generic_mappings is None:
        generic_mappings = {}
    
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
    
    # Apply generic mappings from file
    if page_name in generic_mappings:
        page_mappings = generic_mappings[page_name]
        for label, fn_value in page_mappings.items():
            # Construct full label name by combining page name with label
            full_label = f"{page_name}_{label}"
            
            # Find the instantiation with matching label
            target_inst = None
            for inst in instantiations:
                if inst['label'] == full_label:
                    target_inst = inst
                    break
            
            if target_inst:
                # Check if the component supports generics
                component = target_inst['component']
                resolved_name, component_def = resolve_component_name(component, components, aliases)
                has_generics = component_def['has_generics'] if component_def else False
                
                if has_generics:
                    # Add fn generic mapping
                    target_inst['generics']['fn'] = f'"{fn_value}"'
                    if verbose:
                        print(f"Applied generic mapping: {page_name}.{label} fn => \"{fn_value}\"")
                else:
                    print(f"Error: Component '{component}' for label '{label}' does not support generics")
                    print(f"Cannot apply generic mapping: {page_name}.{label} fn => \"{fn_value}\"")
                    sys.exit(1)
            else:
                available_labels = [inst['label'] for inst in instantiations]
                print(f"Error: Label '{label}' not found in page '{page_name}' for generic mapping")
                print(f"Full label '{full_label}' not found. Available labels in page '{page_name}': {', '.join(sorted(available_labels))}")
                sys.exit(1)
    elif generic_mappings and verbose:
        available_pages = ', '.join(sorted(generic_mappings.keys()))
        print(f"Note: No mappings found for page '{page_name}'. Available pages in mapping file: {available_pages}")
    
    # Add missing port terminations
    for inst in instantiations:
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
    
    # No signal declarations or assignments needed
    signal_declarations = []
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
    for inst in sorted(instantiations, key=lambda x: x['label']):
        label = inst['label']
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
    generic_map_file = None
    file_path = None
    
    # Parse command line arguments
    i = 1
    while i < len(sys.argv):
        arg = sys.argv[i]
        if arg == "-v":
            verbose = True
        elif arg == "-g" or arg == "--generic-map":
            if i + 1 >= len(sys.argv):
                print("Error: -g/--generic-map option requires a filename")
                sys.exit(1)
            generic_map_file = sys.argv[i + 1]
            i += 1  # Skip the filename argument
        elif not arg.startswith("-"):
            if file_path is None:
                file_path = arg
            else:
                print("Error: Multiple input files specified")
                sys.exit(1)
        else:
            print(f"Error: Unknown option {arg}")
            sys.exit(1)
        i += 1
    
    if file_path is None:
        print("Usage: fix-suds.py [-v] [-g|--generic-map <generic_file.txt>] <suds_file.vhd>")
        print("  -v                     : Verbose output")
        print("  -g, --generic-map FILE : Read generic mappings from FILE")
        print("                          Format: <page>.<label> <fn_value>")
        sys.exit(1)
    
    # Parse generic mappings if file provided
    generic_mappings = {}
    if generic_map_file:
        generic_mappings = parse_generic_map_file(generic_map_file)
        if verbose:
            print(f"Loaded {sum(len(page_mappings) for page_mappings in generic_mappings.values())} generic mappings from {generic_map_file}")
    
    fix_suds_file(file_path, verbose, generic_mappings)

if __name__ == "__main__":
    main() 