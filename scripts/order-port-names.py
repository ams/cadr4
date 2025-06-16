#!/usr/bin/env python3
"""
VHDL Port Name Ordering Script

This script alphabetically orders port names in VHDL component port lists.
It handles special cases:
- Ignores inversion prefix (-) and escape symbols (\\) when sorting
- Groups input ports first, then output ports
- Preserves original formatting and special characters
"""

import re
import sys
import argparse
from pathlib import Path


def extract_sort_key(port_name):
    """
    Extract the sorting key from a port name by removing special characters.
    
    Examples:
    - \\-ir2\\ -> ir2
    - -reset -> reset  
    - clk3e -> clk3e
    """
    # Remove leading/trailing whitespace
    name = port_name.strip()
    
    # Remove escape characters (\)
    name = name.replace('\\', '')
    
    # Remove leading minus sign (inversion)
    if name.startswith('-'):
        name = name[1:]
    
    return name.lower()


def parse_port_line(line):
    """
    Parse a port line to extract port name, direction, and type.
    Returns (port_name, direction, type, full_line) or None if not a port line.
    """
    # Match port declarations like: port_name : in/out std_logic;
    # Handle escaped names with backslashes and spaces
    # More flexible pattern to handle complex VHDL port names
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


def format_port_line(port_name, direction, port_type, original_line):
    """
    Format a port line maintaining the original indentation and style.
    """
    # Extract original indentation
    indent_match = re.match(r'^(\s*)', original_line)
    indent = indent_match.group(1) if indent_match else '      '
    
    # Calculate appropriate spacing for alignment
    # Find the longest port name to determine spacing
    max_name_len = max(15, len(port_name))
    
    # Format the line with proper spacing
    return f"{indent}{port_name:<{max_name_len}} : {direction:<3} {port_type}"


def process_component(lines, start_idx):
    """
    Process a single component, ordering its ports.
    Returns (new_lines, end_idx).
    """
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
    non_port_lines = []
    
    while i < len(lines):
        line = lines[i]
        
        # Check if we've reached the end of the port list
        if ');' in line or line.strip() == ');':
            break
            
        # Skip empty lines and comments
        if line.strip() == '' or line.strip().startswith('--'):
            non_port_lines.append((i, line))
            i += 1
            continue
            
        port_info = parse_port_line(line)
        if port_info:
            ports.append(port_info)
        else:
            # Keep non-port lines (comments, etc.)
            non_port_lines.append((i, line))
        
        i += 1
    
    # Sort ports: inputs first, then outputs, both alphabetically
    def sort_key(port_info):
        port_name, direction, _, _ = port_info
        sort_name = extract_sort_key(port_name)
        # Use 0 for 'in', 1 for 'out' to sort inputs first
        dir_priority = 0 if direction == 'in' else 1
        return (dir_priority, sort_name)
    
    ports.sort(key=sort_key)
    
    # Calculate the maximum port name length for consistent formatting
    max_port_name_len = max(len(port[0]) for port in ports) if ports else 15
    max_port_name_len = max(max_port_name_len, 15)
    
    # Add sorted ports to result
    for j, (port_name, direction, port_type, original_line) in enumerate(ports):
        # Determine if this is the last port
        is_last = (j == len(ports) - 1)
        
        # Extract original indentation
        indent_match = re.match(r'^(\s*)', original_line)
        indent = indent_match.group(1) if indent_match else '      '
        
        # Format the line with consistent spacing
        formatted_line = f"{indent}{port_name:<{max_port_name_len}} : {direction:<3} {port_type}"
        
        # Add semicolon or nothing based on whether it's the last port
        if not is_last:
            formatted_line += ";"
        
        result_lines.append(formatted_line)
    
    # Add the closing line
    if i < len(lines):
        result_lines.append(lines[i])
        i += 1
    
    return result_lines, i


def process_vhdl_file(file_path):
    """
    Process a VHDL file and order all component port lists.
    """
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
        if re.match(r'^\s*component\s+\w+\s+is\s*$', line.strip()):
            # Process this component
            component_lines, next_i = process_component(lines, i)
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
        description="Order port names in VHDL component declarations alphabetically"
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