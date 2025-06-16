#!/usr/bin/env python3
"""
Script to fix port syntax errors in set/set.vhd after removing unused ports.
The last port in each component should not have a comma or semicolon.
"""

import re
import sys
import argparse
from pathlib import Path

def fix_port_syntax(file_content):
    """Fix port syntax by ensuring the last port doesn't have a comma or semicolon"""
    
    # Find all component declarations
    component_pattern = r'(component\s+\w+\s+is\s*port\s*\()(.*?)(\);\s*end\s+component;)'
    
    def fix_component_ports(match):
        component_start = match.group(1)
        port_section = match.group(2)
        component_end = match.group(3)
        
        # Split into lines
        lines = port_section.split('\n')
        
        # Find the last port line (not comment or empty)
        last_port_idx = -1
        for i in range(len(lines) - 1, -1, -1):
            line = lines[i].strip()
            if line and not line.startswith('--') and ':' in line:
                last_port_idx = i
                break
        
        if last_port_idx >= 0:
            # Remove trailing comma or semicolon from the last port line
            last_line = lines[last_port_idx]
            # Remove trailing comma or semicolon but preserve whitespace and comments
            lines[last_port_idx] = re.sub(r'[,;]\s*(--.*)?$', r'\1', last_line)
        
        # Reconstruct the port section
        new_port_section = '\n'.join(lines)
        return component_start + new_port_section + component_end
    
    # Apply the fix to all component declarations
    fixed_content = re.sub(component_pattern, fix_component_ports, file_content, flags=re.DOTALL | re.IGNORECASE)
    
    return fixed_content

def main():
    parser = argparse.ArgumentParser(description='Fix port syntax errors in VHDL set package after removing unused ports')
    parser.add_argument('file_path', help='Path to the set.vhd file to fix')
    
    args = parser.parse_args()
    
    # Read the set.vhd file
    set_file = Path(args.file_path)
    if not set_file.exists():
        print(f"Error: File {args.file_path} does not exist")
        sys.exit(1)
    
    with open(set_file, 'r') as f:
        file_content = f.read()
    
    # Fix port syntax
    fixed_content = fix_port_syntax(file_content)
    
    # Write back to file
    with open(set_file, 'w') as f:
        f.write(fixed_content)
    
    print(f"Fixed port syntax in {args.file_path}")

if __name__ == "__main__":
    main() 