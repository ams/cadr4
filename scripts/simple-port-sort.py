#!/usr/bin/env python3
"""
Simple VHDL Port Sorting Script

This script sorts port names alphabetically within their existing groups,
preserving the original structure and semicolons.
"""

import re
import sys
import argparse
from pathlib import Path


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


def parse_port_line(line):
    """Parse a port line to extract port name, direction, type, and original formatting."""
    # Match port declarations like: port_name : in/out type;
    port_pattern = r'^(\s*)([^:]+?)\s*:\s*(in|out)\s+([^;]+)(;?)(.*)$'
    match = re.match(port_pattern, line)
    
    if match:
        indent = match.group(1)
        port_name = match.group(2).strip()
        direction = match.group(3).strip()
        port_type = match.group(4).strip()
        semicolon = match.group(5)
        trailing = match.group(6)
        
        return (port_name, direction, port_type, indent, semicolon, trailing)
    
    return None


def process_component_ports(lines, start_idx):
    """Process a single component, sorting its ports within existing groups."""
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
    
    # Collect port groups (separated by blank lines or comments)
    current_group = []
    groups = []
    
    while i < len(lines):
        line = lines[i]
        
        # Check if we've reached the end of the port list
        if ');' in line or line.strip() == ');':
            if current_group:
                groups.append(current_group)
            break
        
        # If it's a blank line or comment, it separates groups
        if line.strip() == '' or line.strip().startswith('--'):
            if current_group:
                groups.append(current_group)
                current_group = []
            # Add the separator line to results
            result_lines.append(line)
        else:
            port_info = parse_port_line(line)
            if port_info:
                current_group.append((port_info, line))
            else:
                # Non-port line, add to current group as-is
                current_group.append((None, line))
        
        i += 1
    
    # Add remaining group if any
    if current_group:
        groups.append(current_group)
    
    # Process each group
    for group in groups:
        # Separate port lines from non-port lines
        port_lines = []
        non_port_lines = []
        
        for item in group:
            port_info, original_line = item
            if port_info:
                port_lines.append((port_info, original_line))
            else:
                non_port_lines.append(original_line)
        
        # Sort port lines by port name
        port_lines.sort(key=lambda x: extract_sort_key(x[0][0]))
        
        # Add sorted port lines
        for port_info, original_line in port_lines:
            port_name, direction, port_type, indent, semicolon, trailing = port_info
            
            # Calculate spacing for alignment
            max_name_len = max(15, len(port_name))
            formatted_line = f"{indent}{port_name:<{max_name_len}} : {direction:<3} {port_type}{semicolon}{trailing}"
            result_lines.append(formatted_line)
        
        # Add non-port lines
        for line in non_port_lines:
            result_lines.append(line)
    
    # Add the closing line
    if i < len(lines):
        result_lines.append(lines[i])
        i += 1
    
    return result_lines, i


def process_vhdl_file(file_path):
    """Process a VHDL file and sort port names within components."""
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
        if re.match(r'^\s*component\s+\w+.*is\s*$', line.strip()):
            # Process this component
            component_lines, next_i = process_component_ports(lines, i)
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
        description="Sort port names in VHDL component declarations alphabetically within existing groups"
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