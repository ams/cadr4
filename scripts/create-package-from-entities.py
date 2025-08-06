#!/usr/bin/env python3
"""
Create a package file with component declarations from entity files.

This script reads VHDL entity files matching a wildcard pattern and generates
a package file containing component declarations for all the entities.
"""

import re
import sys
import argparse
import glob
from pathlib import Path
from typing import Dict, List, Tuple


def parse_entity_declaration(entity_file: Path) -> Tuple[str, List[Tuple[str, str]], List[Tuple[str, str, str]]]:
    """
    Parse a VHDL entity file and extract the entity name, generic and port declarations.
    
    Returns a tuple of (entity_name, list_of_generics, list_of_ports) where:
    - each generic is (generic_name, type_and_default)
    - each port is (port_name, direction, type).
    """
    with open(entity_file, 'r') as f:
        content = f.read()
    
    # Find entity declaration
    entity_pattern = r'entity\s+(\w+)\s+is\s*'
    entity_match = re.search(entity_pattern, content, re.IGNORECASE)
    
    if not entity_match:
        raise ValueError(f"No entity declaration found in {entity_file}")
    
    entity_name = entity_match.group(1)
    
    # Find generic declaration section (if exists)
    generic_pattern = r'generic\s*\((.*?)\)\s*;'
    generic_match = re.search(generic_pattern, content, re.DOTALL | re.IGNORECASE)
    
    generics = []
    if generic_match:
        generic_section = generic_match.group(1)
        generics = parse_generic_section(generic_section)
    
    # Find port declaration section
    port_pattern = r'port\s*\((.*?)\)\s*;'
    port_match = re.search(port_pattern, content, re.DOTALL | re.IGNORECASE)
    
    ports = []
    if port_match:
        port_section = port_match.group(1)
        ports = parse_port_section(port_section)
    
    return entity_name, generics, ports


def parse_generic_section(generic_section: str) -> List[Tuple[str, str]]:
    """
    Parse a generic section and return list of (generic_name, type_and_default) tuples.
    
    Examples:
    "fn : string := \"\"" -> [("fn", "string := \"\"")]
    "width : integer := 8; depth : integer := 16" -> [("width", "integer := 8"), ("depth", "integer := 16")]
    """
    generics = []
    
    # Split by semicolons but be careful with string literals
    lines = generic_section.split('\n')
    current_generic = ""
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        current_generic += " " + line
        
        # Check if this line ends a generic declaration (has semicolon not inside quotes)
        # or if it's the last line without semicolon
        if line.endswith(';') or (line == lines[-1].strip() and not line.endswith(';')):
            # Remove trailing semicolon
            current_generic = current_generic.strip()
            if current_generic.endswith(';'):
                current_generic = current_generic[:-1]
            
            # Parse generic declaration: name : type := default
            generic_info = parse_single_generic(current_generic)
            if generic_info:
                generics.extend(generic_info)
            
            current_generic = ""
    
    return generics


def parse_single_generic(generic_declaration: str) -> List[Tuple[str, str]]:
    """
    Parse a single generic declaration which might contain multiple generics.
    
    Examples:
    "fn : string := \"\"" -> [("fn", "string := \"\"")]
    "a, b : integer := 0" -> [("a", "integer := 0"), ("b", "integer := 0")]
    """
    generic_declaration = generic_declaration.strip()
    
    # Pattern to match generic declaration: names : type := default
    generic_pattern = r'([^:]+)\s*:\s*(.+)'
    match = re.search(generic_pattern, generic_declaration)
    
    if not match:
        return []
    
    names_part = match.group(1).strip()
    type_and_default = match.group(2).strip()
    
    # Parse generic names - handle escaped identifiers
    names = []
    if '\\' in names_part:
        # Contains escaped identifiers - use more careful parsing
        current_name = ""
        in_escape = False
        
        for char in names_part:
            if char == '\\':
                in_escape = not in_escape
                current_name += char
            elif char == ',' and not in_escape:
                if current_name.strip():
                    names.append(current_name.strip())
                current_name = ""
            else:
                current_name += char
        
        if current_name.strip():
            names.append(current_name.strip())
    else:
        # No escaped identifiers - simple split
        names = [s.strip() for s in names_part.split(',')]
    
    # Return list of (name, type_and_default) tuples
    return [(name, type_and_default) for name in names if name]


def parse_port_section(port_section: str) -> List[Tuple[str, str, str]]:
    """
    Parse a port section and return list of (port_name, direction, type) tuples.
    """
    ports = []
    
    # Split by semicolons but be careful with escaped identifiers
    # Use a more sophisticated approach to handle escaped identifiers
    lines = port_section.split('\n')
    current_port = ""
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        current_port += " " + line
        
        # Check if this line ends a port declaration (has semicolon not inside quotes)
        # or if it's the last line without semicolon
        if line.endswith(';') or (line == lines[-1].strip() and not line.endswith(';')):
            # Remove trailing semicolon
            current_port = current_port.strip()
            if current_port.endswith(';'):
                current_port = current_port[:-1]
            
            # Parse port declaration
            port_info = parse_single_port(current_port)
            if port_info:
                ports.extend(port_info)
            
            current_port = ""
    
    return ports


def parse_single_port(port_declaration: str) -> List[Tuple[str, str, str]]:
    """
    Parse a single port declaration which might contain multiple signals.
    
    Examples:
    "bus0, bus1 : in std_logic"
    "\\-dbub master\\ : in std_logic"
    """
    port_declaration = port_declaration.strip()
    
    # Pattern to match port declaration: signals : direction type
    # Handle both regular identifiers and escaped identifiers
    port_pattern = r'([^:]+)\s*:\s*(in|out|inout)\s+(.+)'
    match = re.search(port_pattern, port_declaration, re.IGNORECASE)
    
    if not match:
        return []
    
    signals_part = match.group(1).strip()
    direction = match.group(2).lower()
    port_type = match.group(3).strip()
    
    # Parse signal names - handle escaped identifiers
    signals = []
    
    # Split by comma but be careful with escaped identifiers
    if '\\' in signals_part:
        # Contains escaped identifiers - use more careful parsing
        current_signal = ""
        in_escape = False
        
        for char in signals_part:
            if char == '\\':
                in_escape = not in_escape
                current_signal += char
            elif char == ',' and not in_escape:
                if current_signal.strip():
                    signals.append(current_signal.strip())
                current_signal = ""
            else:
                current_signal += char
        
        if current_signal.strip():
            signals.append(current_signal.strip())
    else:
        # No escaped identifiers - simple split
        signals = [s.strip() for s in signals_part.split(',')]
    
    # Return list of (signal_name, direction, type) tuples
    return [(signal, direction, port_type) for signal in signals if signal]


def generate_package_file(package_name: str, components: Dict[str, Tuple[List[Tuple[str, str]], List[Tuple[str, str, str]]]], output_file):
    """
    Generate a VHDL package file with component declarations.
    If output_file is None, write to stdout.
    
    components dict maps component_name to (generics, ports) where:
    - generics is list of (generic_name, type_and_default)
    - ports is list of (port_name, direction, type)
    """
    # Determine output stream
    if output_file:
        f = open(output_file, 'w')
    else:
        f = sys.stdout
    
    try:
        f.write("library ieee;\n")
        f.write("use ieee.std_logic_1164.all;\n")
        f.write("\n")
        f.write(f"package {package_name} is\n")
        f.write("\n")
        
        # Sort components by name
        for component_name in sorted(components.keys()):
            generics, ports = components[component_name]
            
            f.write(f"  component {component_name} is\n")
            
            # Write generics if any
            if generics:
                f.write("  generic (\n")
                
                # Find maximum generic name length for alignment
                max_generic_name_len = max(len(generic[0]) for generic in generics) if generics else 0
                max_generic_name_len = max(max_generic_name_len, 15)  # Minimum alignment
                
                for i, (generic_name, type_and_default) in enumerate(generics):
                    line = f"    {generic_name:<{max_generic_name_len}} : {type_and_default}"
                    
                    # Add semicolon for all but the last generic
                    if i < len(generics) - 1:
                        line += ";"
                    
                    f.write(line + "\n")
                
                f.write("  );\n")
            
            # Write ports if any
            if ports:
                f.write("  port (\n")
                
                # Find maximum signal name length for alignment
                max_name_len = max(len(port[0]) for port in ports) if ports else 0
                max_name_len = max(max_name_len, 15)  # Minimum alignment
                
                for i, (signal_name, direction, port_type) in enumerate(ports):
                    line = f"    {signal_name:<{max_name_len}} : {direction:<6} {port_type}"
                    
                    # Add semicolon for all but the last port
                    if i < len(ports) - 1:
                        line += ";"
                    
                    f.write(line + "\n")
                
                f.write("  );\n")
            
            f.write("  end component;\n")
            f.write("\n")
        
        f.write("end package;\n")
        
    finally:
        # Only close if it's a file (not stdout)
        if output_file and f != sys.stdout:
            f.close()


def main():
    parser = argparse.ArgumentParser(
        description="Create a package file with component declarations from entity files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s -e "cadr1/cadr1_*.vhd" -p cadr1/busint_book.vhd
  %(prog)s -e "ttl/sn74*.vhd" -p ttl/ttl_components.vhd
  %(prog)s -e "cadr/*.vhd" > components.vhd
        """
    )
    
    parser.add_argument('-e', '--entities', nargs='+', required=True, 
                       help='Entity files or wildcard pattern (e.g., "cadr1/*.vhd" or cadr1/file1.vhd cadr1/file2.vhd)')
    parser.add_argument('-p', '--package', type=Path, 
                       help='Output package file (default: print to stdout)')
    
    args = parser.parse_args()
    
    # Handle both single pattern and multiple files
    entity_files = []
    
    if len(args.entities) == 1:
        # Single argument - treat as pattern and try globbing
        pattern = args.entities[0]
        globbed_files = glob.glob(pattern)
        
        if globbed_files:
            # Pattern matched files
            entity_files = globbed_files
        elif Path(pattern).exists():
            # Single file exists
            entity_files = [pattern]
        else:
            print(f"Error: No files found matching pattern: {pattern}", file=sys.stderr)
            sys.exit(1)
    else:
        # Multiple arguments - treat as individual files (shell-expanded)
        entity_files = args.entities
        
        # Validate that all files exist
        for file_path in entity_files:
            if not Path(file_path).exists():
                print(f"Error: File does not exist: {file_path}", file=sys.stderr)
                sys.exit(1)
    
    entity_files = [Path(f) for f in entity_files]
    
    # Determine package name
    if args.package:
        package_name = args.package.stem
        if package_name.endswith('_book'):
            package_name = package_name[:-5]  # Remove '_book'
        package_name += "_book"
    else:
        package_name = "components_book"
    
    print(f"Processing {len(entity_files)} entity files...", file=sys.stderr)
    if args.package:
        print(f"Output package file: {args.package}", file=sys.stderr)
    else:
        print("Output: stdout", file=sys.stderr)
    print(f"Package name: {package_name}", file=sys.stderr)
    
    # Parse all entity files
    components = {}
    
    for entity_file in sorted(entity_files):
        print(f"Processing: {entity_file}", file=sys.stderr)
        
        try:
            entity_name, generics, ports = parse_entity_declaration(entity_file)
            components[entity_name] = (generics, ports)
            
            generic_count = len(generics)
            port_count = len(ports)
            if generic_count > 0:
                print(f"  Found entity: {entity_name} with {generic_count} generics and {port_count} ports", file=sys.stderr)
            else:
                print(f"  Found entity: {entity_name} with {port_count} ports", file=sys.stderr)
            
        except Exception as e:
            print(f"  Warning: Failed to parse {entity_file}: {e}", file=sys.stderr)
            continue
    
    if not components:
        print("Error: No valid entities found", file=sys.stderr)
        sys.exit(1)
    
    # Generate package file
    print(f"Generating package with {len(components)} components...", file=sys.stderr)
    
    try:
        generate_package_file(package_name, components, args.package)
        
        if args.package:
            print(f"Successfully generated package file: {args.package}", file=sys.stderr)
        else:
            print("Successfully generated package to stdout", file=sys.stderr)
        
        # Print summary
        total_generics = sum(len(generics) for generics, ports in components.values())
        total_ports = sum(len(ports) for generics, ports in components.values())
        if total_generics > 0:
            print(f"Package contains {len(components)} components with {total_generics} total generics and {total_ports} total ports", file=sys.stderr)
        else:
            print(f"Package contains {len(components)} components with {total_ports} total ports", file=sys.stderr)
        
    except Exception as e:
        print(f"Error generating package: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()