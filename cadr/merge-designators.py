#!/usr/bin/env python3

import sys
import re
from collections import defaultdict

def merge_designators(filepath):
    try:
        with open(filepath, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: File not found at {filepath}", file=sys.stderr)
        sys.exit(1)

    instantiation_pattern = re.compile(r"^(\s*)(\w+)\s*:\s*(\w+)\s+port\s+map\s*\((.*?)\);", re.IGNORECASE)
    
    instantiations = defaultdict(list)
    line_info = {}
    
    for i, line in enumerate(lines):
        match = instantiation_pattern.match(line)
        if match:
            indent, label, component, port_map_str = match.groups()
            
            ports = {}
            port_map_str = port_map_str.strip()
            if not port_map_str: # handle empty port map
                continue

            assignments = re.split(r',\s*(?=\w+\s*=>)', port_map_str)
            for assignment in assignments:
                if '=>' not in assignment:
                    print(f"Error: Malformed port map in line {i+1}: {line.strip()}", file=sys.stderr)
                    sys.exit(1)
                pin, signal = [x.strip() for x in assignment.split('=>', 1)]
                ports[pin] = signal

            instantiations[label].append({
                'component': component,
                'ports': ports
            })
            if label not in line_info:
                line_info[label] = {'indent': indent, 'line_index': i}

    lines_to_remove = set()
    modified_lines = {}

    for label, group in instantiations.items():
        if len(group) > 1:
            first_inst = group[0]
            component_name = first_inst['component']
            merged_ports = {}
            
            for inst_data in group:
                if inst_data['component'].lower() != component_name.lower():
                    print(f"Error: Mismatched component names for label '{label}'. Found '{component_name}' and '{inst_data['component']}'.", file=sys.stderr)
                    sys.exit(1)
                
                for pin, signal in inst_data['ports'].items():
                    if pin in merged_ports:
                        print(f"Error: Duplicate pin '{pin}' assignment for label '{label}'.", file=sys.stderr)
                        sys.exit(1)
                    merged_ports[pin] = signal

            # find all lines for this label
            for i, line in enumerate(lines):
                match = instantiation_pattern.match(line)
                if match and match.group(2) == label:
                    lines_to_remove.add(i)

            sorted_pins = sorted(merged_ports.keys())
            
            new_port_map_str = ", ".join([f"{pin} => {merged_ports[pin]}" for pin in sorted_pins])
            
            info = line_info[label]
            new_line = f"{info['indent']}{label} : {component_name} port map ({new_port_map_str});\n"
            modified_lines[info['line_index']] = new_line
            lines_to_remove.remove(info['line_index'])
            
    # Reconstruct file content
    new_lines = []
    for i, line in enumerate(lines):
        if i in lines_to_remove:
            continue
        if i in modified_lines:
            new_lines.append(modified_lines[i])
        else:
            new_lines.append(line)

    try:
        with open(filepath, 'w') as f:
            f.writelines(new_lines)
    except IOError as e:
        print(f"Error writing to file {filepath}: {e}", file=sys.stderr)
        sys.exit(1)

    sys.exit(0)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python task-merge-designators.py <path_to_vhdl_file>", file=sys.stderr)
        sys.exit(1)
    
    filepath = sys.argv[1]
    merge_designators(filepath) 
