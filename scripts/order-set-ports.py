#!/usr/bin/env python3
"""
VHDL Set Component Port Ordering Script

This script orders port names in VHDL set component declarations according to specific rules:
1. Bus signals (IR, M, MF, A, AA, etc.) are grouped together
2. Within each group (individual signals, bus signals), ports are ordered alphabetically
3. Input ports come before output ports
4. Proper semicolon handling
"""

import re
import sys
import argparse
from pathlib import Path


# Bus signals that should be grouped together
BUS_SIGNALS = {
    'IR', 'M', 'MF', 'A', 'AA', 'AMEM', 'AADR', 'L', 'LC', 'WPC', 'LPC', 'ALU', 'I', 'SPY', 
    'DADR', 'DPC', 'MDS', 'MD', 'OB', 'IOB', 'IWR', 'MEM', 'MMEM', 'MSK', 'NPC', 'PC', 'IPC', 
    'SPC', 'SPCO', 'SPCW', 'SPCPTR', 'DC', 'OPC', 'PDL', 'PDLIDX', 'PDLPTR', 'Q', 'SA', 'R', 
    'RETA', 'ST', 'VMA', 'VMAS', 'MAPI', 'VMAP', 'VMO', 'PMA', 'WADR', 'EADR'
}


def extract_sort_key(port_name):
    """Extract the sorting key from a port name by removing special characters."""
    name = port_name.strip()
    
    # Handle escaped names: remove outer backslashes but keep internal content
    if name.startswith('\\') and name.endswith('\\'):
        name = name[1:-1]
    
    # Remove leading minus sign (inversion prefix)
    if name.startswith('-'):
        name = name[1:]
    
    return name.lower()


def is_bus_signal(port_name):
    """Check if a port name is a bus signal."""
    clean_name = extract_sort_key(port_name).upper()
    return clean_name in BUS_SIGNALS


def parse_port_line(line):
    """Parse a port line to extract port name, direction, and type."""
    # Match port declarations like: port_name : in/out type;
    port_pattern = r'^\s*([^:]+?)\s*:\s*(in|out)\s+([^;]+?)(?:;.*)?$'
    match = re.match(port_pattern, line.strip())
    
    if match:
        port_name = match.group(1).strip()
        direction = match.group(2).strip()
        port_type = match.group(3).strip()
        
        # Skip lines that don't look like port declarations
        if not port_name or ':' in port_name:
            return None
            
        return (port_name, direction, port_type, line)
    
    return None


def process_set_component(lines, start_idx):
    """Process a single set component, ordering its ports according to set rules."""
    result_lines = []
    i = start_idx
    
    # Copy lines until we reach the port declaration
    while i < len(lines) and 'port (' not in lines[i].lower():
        result_lines.append(lines[i])
        i += 1
    
    if i >= len(lines):
        return result_lines, i
    
    # Add the 'port (' line
    result_lines.append(lines[i])
    i += 1
    
    # Collect all port lines
    ports = []
    
    while i < len(lines):
        line = lines[i]
        
        # Check if we've reached the end of the port list
        if ');' in line or line.strip() == ');':
            break
            
        # Skip empty lines and comments
        if line.strip() == '' or line.strip().startswith('--'):
            i += 1
            continue
            
        port_info = parse_port_line(line)
        if port_info:
            ports.append(port_info)
        
        i += 1
    
    # Separate bus signals from individual signals
    individual_signals = []
    bus_signals = []
    
    for port_info in ports:
        port_name, direction, port_type, original_line = port_info
        if is_bus_signal(port_name):
            bus_signals.append(port_info)
        else:
            individual_signals.append(port_info)
    
    # Sort function for ports
    def sort_key(port_info):
        port_name, direction, port_type, _ = port_info
        sort_name = extract_sort_key(port_name)
        
        # Group by direction: inputs first, outputs second
        dir_priority = 0 if direction.lower() == 'in' else 1
        
        return (dir_priority, sort_name)
    
    # Sort both groups
    individual_signals.sort(key=sort_key)
    bus_signals.sort(key=sort_key)
    
    # Combine: individual signals first, then bus signals
    all_ports = individual_signals + bus_signals
    
    # Calculate maximum port name length for formatting
    max_port_name_len = max(len(port[0]) for port in all_ports) if all_ports else 15
    max_port_name_len = max(max_port_name_len, 15)
    
    # Add formatted ports to result
    for j, (port_name, direction, port_type, original_line) in enumerate(all_ports):
        # Determine if this is the last port
        is_last = (j == len(all_ports) - 1)
        
        # Extract original indentation
        indent_match = re.match(r'^(\s*)', original_line)
        indent = indent_match.group(1) if indent_match else '      '
        
        # Format the line with consistent spacing
        formatted_line = f"{indent}{port_name:<{max_port_name_len}} : {direction:<3} {port_type}"
        
        # Add semicolon for all but the last port
        if not is_last:
            formatted_line += ";"
        
        result_lines.append(formatted_line)
    
    # Add the closing line
    if i < len(lines):
        result_lines.append(lines[i])
        i += 1
    
    return result_lines, i


def process_vhdl_file(file_path):
    """Process a VHDL file and order all set component port lists."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return False
    
    # Remove trailing newlines for processing
    lines = [line.rstrip('\n\r') for line in lines]
    
    result_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        
        # Check if this line starts a component declaration
        if re.match(r'^\s*component\s+\w+_set\s+is\s*$', line.strip()):
            # Process this set component
            component_lines, next_i = process_set_component(lines, i)
            result_lines.extend(component_lines)
            i = next_i
        else:
            # Regular line, just copy it
            result_lines.append(line)
            i += 1
    
    # Write the result back to the file
    try:
        with open(file_path, 'w', encoding='utf-8') as f:
            for line in result_lines:
                f.write(line + '\n')
        print(f"Successfully processed {file_path}")
        return True
    except Exception as e:
        print(f"Error writing file {file_path}: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(
        description="Order port names in VHDL set component declarations according to set component rules"
    )
    parser.add_argument(
        'files', 
        nargs='+', 
        help='VHDL files to process'
    )
    parser.add_argument(
        '--dry-run', 
        action='store_true',
        help='Show what would be changed without modifying files'
    )
    
    args = parser.parse_args()
    
    success_count = 0
    total_count = len(args.files)
    
    for file_path in args.files:
        path = Path(file_path)
        if not path.exists():
            print(f"File not found: {file_path}")
            continue
            
        if not path.suffix.lower() == '.vhd':
            print(f"Skipping non-VHDL file: {file_path}")
            continue
        
        if args.dry_run:
            print(f"Would process: {file_path}")
            success_count += 1
        else:
            if process_vhdl_file(file_path):
                success_count += 1
    
    print(f"\nProcessed {success_count}/{total_count} files successfully")


if __name__ == "__main__":
    main() 