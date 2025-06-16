#!/usr/bin/env python3
"""
Script to find unused output ports in set/set.vhd
An output port is considered unused if it's never used as an input port in any component within the set package.
This script ignores testbench usage and only analyzes within the set package itself.
"""

import re
import sys
import argparse
from pathlib import Path

def parse_component_ports(file_content):
    """Parse all component declarations and extract input/output ports"""
    components = {}
    
    # Find all component declarations
    component_pattern = r'component\s+(\w+)\s+is\s*port\s*\((.*?)\);\s*end\s+component;'
    
    for match in re.finditer(component_pattern, file_content, re.DOTALL | re.IGNORECASE):
        component_name = match.group(1)
        port_section = match.group(2)
        
        # Parse individual ports
        inputs = set()
        outputs = set()
        
        # Split by semicolons and process each port declaration
        port_lines = port_section.split('\n')
        
        for line in port_lines:
            line = line.strip()
            if not line or line.startswith('--'):
                continue
                
            # Match port declarations: signal_name : direction type
            # Handle both regular signals and escaped signals (like \-signal\)
            port_match = re.match(r'(\\[^\\]+\\|[\w.-]+(?:\([^)]*\))?)\s*:\s*(in|out)\s+std_logic', line, re.IGNORECASE)
            if port_match:
                signal_name = port_match.group(1).strip()
                direction = port_match.group(2).lower()
                
                if direction == 'in':
                    inputs.add(signal_name)
                elif direction == 'out':
                    outputs.add(signal_name)
        
        components[component_name] = {
            'inputs': inputs,
            'outputs': outputs
        }
    
    return components

def find_unused_outputs(components):
    """Find output signals that are never used as input signals"""
    # Collect all input signals across all components
    all_inputs = set()
    for comp_data in components.values():
        all_inputs.update(comp_data['inputs'])
    
    # Find unused outputs for each component
    unused_outputs = {}
    for comp_name, comp_data in components.items():
        unused = comp_data['outputs'] - all_inputs
        if unused:
            unused_outputs[comp_name] = unused
    
    return unused_outputs

def remove_unused_ports(file_content, unused_outputs):
    """Remove unused output ports from the VHDL file content"""
    
    for comp_name, unused_signals in unused_outputs.items():
        # Find the component declaration
        component_pattern = r'(component\s+' + re.escape(comp_name) + r'\s+is\s*port\s*\()(.*?)(\);\s*end\s+component;)'
        
        match = re.search(component_pattern, file_content, re.DOTALL | re.IGNORECASE)
        if not match:
            print(f"Warning: Could not find component {comp_name}")
            continue
            
        component_start = match.group(1)
        port_section = match.group(2)
        component_end = match.group(3)
        
        # Split into lines and process each port declaration
        lines = port_section.split('\n')
        new_lines = []
        
        for line in lines:
            line_stripped = line.strip()
            
            # Skip empty lines and comments
            if not line_stripped or line_stripped.startswith('--'):
                new_lines.append(line)
                continue
            
            # Check if this line contains an unused output signal
            should_remove = False
            for unused_signal in unused_signals:
                # Match the signal name at the beginning of the line
                if re.match(rf'\s*{re.escape(unused_signal)}\s*:', line_stripped):
                    should_remove = True
                    break
            
            if not should_remove:
                new_lines.append(line)
        
        # Reconstruct the component
        new_port_section = '\n'.join(new_lines)
        new_component = component_start + new_port_section + component_end
        
        # Replace in the file content
        file_content = file_content[:match.start()] + new_component + file_content[match.end():]
    
    return file_content

def main():
    parser = argparse.ArgumentParser(description='Find and optionally remove unused output ports from VHDL set package')
    parser.add_argument('file_path', help='Path to the set.vhd file to analyze')
    parser.add_argument('--remove', action='store_true', help='Remove unused output ports from the file')
    
    args = parser.parse_args()
    
    # Read the set.vhd file
    set_file = Path(args.file_path)
    if not set_file.exists():
        print(f"Error: File {args.file_path} does not exist")
        sys.exit(1)
    
    with open(set_file, 'r') as f:
        file_content = f.read()
    
    # Parse components and find unused outputs
    components = parse_component_ports(file_content)
    unused_outputs = find_unused_outputs(components)
    
    # Display results
    total_unused = sum(len(signals) for signals in unused_outputs.values())
    print(f"Found {total_unused} unused output ports:")
    
    for comp_name, unused_signals in unused_outputs.items():
        print(f"\nComponent {comp_name}:")
        for signal in sorted(unused_signals):
            print(f"  - {signal}")
    
    # Remove unused ports if requested
    if args.remove:
        if total_unused > 0:
            new_content = remove_unused_ports(file_content, unused_outputs)
            
            # Write back to file
            with open(set_file, 'w') as f:
                f.write(new_content)
            
            print(f"\nRemoved {total_unused} unused output ports from {args.file_path}")
        else:
            print("\nNo unused output ports to remove")

if __name__ == "__main__":
    main() 