#!/usr/bin/env python3
"""
Script to order entity port names alphabetically in VHDL entity files.
Orders letters alphabetically but numbers numerically (ir10 after ir9).
Handles escaped port names (prefixed with \\).
"""

import re
import sys
from typing import List, Tuple
import argparse


def natural_sort_key(text: str) -> List:
    """
    Create a sort key that handles both alphabetic and numeric parts naturally.
    This ensures that 'ir10' comes after 'ir9' instead of after 'ir1'.
    Also handles escaped names by ignoring the leading backslash.
    """
    # Remove leading backslash for escaped names when sorting
    clean_text = text.lstrip('\\')
    
    # Split into alternating text and number parts
    parts = re.split(r'(\d+)', clean_text.lower())
    
    # Convert numeric parts to integers for proper sorting
    result = []
    for part in parts:
        if part.isdigit():
            result.append(int(part))
        else:
            result.append(part)
    
    return result


def parse_entity_ports(entity_text: str) -> Tuple[str, List[str], List[str]]:
    """
    Parse an entity declaration and extract port information.
    Returns (entity_name, port_lines, non_port_lines).
    """
    lines = entity_text.strip().split('\n')
    
    # Find entity name
    entity_match = re.search(r'entity\s+(\w+)', lines[0], re.IGNORECASE)
    entity_name = entity_match.group(1) if entity_match else "unknown"
    
    # Find port section
    port_start = -1
    port_end = -1
    
    for i, line in enumerate(lines):
        if re.search(r'\bport\s*\(', line, re.IGNORECASE):
            port_start = i
        elif port_start != -1 and re.search(r'\)\s*;', line):
            port_end = i
            break
    
    if port_start == -1:
        # No ports found
        return entity_name, [], lines
    
    # Extract non-port lines (before port and after port)
    non_port_lines = lines[:port_start] + lines[port_end+1:]
    
    # Extract port lines
    port_lines = []
    if port_end != -1:
        for i in range(port_start, port_end + 1):
            port_lines.append(lines[i])
    
    return entity_name, port_lines, non_port_lines


def extract_port_declarations(port_lines: List[str]) -> List[Tuple[str, str]]:
    """
    Extract individual port declarations from port lines.
    Returns list of (port_name, full_declaration) tuples.
    """
    # Join all port lines and remove the port( and ); parts
    port_text = ' '.join(line.strip() for line in port_lines)
    
    # Remove 'port (' from the beginning and ');' from the end
    port_text = re.sub(r'^\s*port\s*\(\s*', '', port_text, flags=re.IGNORECASE)
    port_text = re.sub(r'\s*\)\s*;\s*$', '', port_text)
    
    # Split by semicolon to get individual port declarations
    # But be careful about semicolons inside escaped names
    declarations = []
    current_decl = ""
    paren_count = 0
    
    for char in port_text:
        if char == '(':
            paren_count += 1
        elif char == ')':
            paren_count -= 1
        elif char == ';' and paren_count == 0:
            if current_decl.strip():
                declarations.append(current_decl.strip())
            current_decl = ""
            continue
        current_decl += char
    
    # Add the last declaration if there's no trailing semicolon
    if current_decl.strip():
        declarations.append(current_decl.strip())
    
    ports = []
    for decl in declarations:
        # Extract port name (first identifier, possibly escaped)
        # Handle escaped names like \-srcopc\ 
        match = re.match(r'^\s*(\\[^\\]*\\|\w+)', decl)
        if match:
            port_name = match.group(1)
            ports.append((port_name, decl))
    
    return ports


def format_entity(entity_name: str, port_lines: List[str], non_port_lines: List[str]) -> str:
    """
    Format an entity with sorted ports.
    """
    if not port_lines:
        # No ports, just return the original
        return '\n'.join(non_port_lines)
    
    # Extract and sort port declarations
    ports = extract_port_declarations(port_lines)
    
    if not ports:
        # No valid ports found, return original
        return '\n'.join(non_port_lines + port_lines)
    
    # Sort ports by name using natural sort
    sorted_ports = sorted(ports, key=lambda x: natural_sort_key(x[0]))
    
    # Reconstruct the entity
    result_lines = []
    
    # Add lines before port declaration (entity declaration)
    for line in non_port_lines:
        if 'end' in line.lower() and (entity_name.lower() in line.lower() or line.strip().lower() == 'end;'):
            break
        result_lines.append(line.rstrip())
    
    # Add port declaration start
    result_lines.append('  port (')
    
    # Add sorted port declarations
    for i, (port_name, decl) in enumerate(sorted_ports):
        if i == len(sorted_ports) - 1:
            # Last port, no semicolon
            result_lines.append(f'    {decl}')
        else:
            # Not last port, add semicolon if not present
            if decl.rstrip().endswith(';'):
                result_lines.append(f'    {decl}')
            else:
                result_lines.append(f'    {decl};')
    
    result_lines.append('  );')
    
    # Add end entity line
    for line in non_port_lines:
        if 'end' in line.lower() and (entity_name.lower() in line.lower() or line.strip().lower() == 'end;'):
            result_lines.append(line.rstrip())
            break
    
    return '\n'.join(result_lines)


def process_vhdl_file(content: str) -> str:
    """
    Process a VHDL file and sort entity port names.
    """
    # Find all entity declarations more carefully
    entity_pattern = r'(\n\s*entity\s+\w+.*?end\s*(?:\w+\s*)?;)'
    
    def replace_entity(match):
        entity_text = match.group(1)
        entity_name, port_lines, non_port_lines = parse_entity_ports(entity_text)
        formatted = format_entity(entity_name, port_lines, non_port_lines)
        
        # Preserve the leading newline and original indentation
        lines = entity_text.split('\n')
        first_content_line = next((line for line in lines if line.strip().startswith('entity')), '')
        original_indent = len(first_content_line) - len(first_content_line.lstrip())
        
        if original_indent > 0:
            indent = ' ' * original_indent
            formatted_lines = formatted.split('\n')
            # Add indentation to all non-empty lines
            for i in range(len(formatted_lines)):
                if formatted_lines[i].strip():  # Don't indent empty lines
                    if not formatted_lines[i].startswith(' '):
                        formatted_lines[i] = indent + formatted_lines[i]
            formatted = '\n'.join(formatted_lines)
        
        # Add back the leading newline
        return '\n' + formatted
    
    # Replace each entity with sorted version
    result = re.sub(entity_pattern, replace_entity, content, flags=re.DOTALL | re.IGNORECASE)
    
    return result


def main():
    parser = argparse.ArgumentParser(description='Order entity port names alphabetically in VHDL entity files')
    parser.add_argument('file', help='VHDL entity file to process')
    
    args = parser.parse_args()
    
    try:
        with open(args.file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        result = process_vhdl_file(content)
        print(result, end='')
        
    except FileNotFoundError:
        print(f"Error: File '{args.file}' not found", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error processing file: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main() 