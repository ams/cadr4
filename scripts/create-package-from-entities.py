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





def parse_entity_declaration(entity_file: Path) -> Tuple[str, str]:
    """
    Parse a VHDL entity file and extract the entity name and full entity body.
    
    Returns a tuple of (entity_name, entity_body) where entity_body contains
    everything between "entity name is" and "end entity/name".
    """
    with open(entity_file, 'r') as f:
        content = f.read()
    
    # Find entity declaration with body
    # Handle "end entity", "end entity_name", "end entity entity_name", and just "end" patterns
    entity_pattern = r'entity\s+(\w+)\s+is\s*(.*?)\s*end\s*(?:entity\s+\1|\1|entity)?\s*;'
    entity_match = re.search(entity_pattern, content, re.DOTALL | re.IGNORECASE)
    
    if not entity_match:
        raise ValueError(f"No entity declaration found in {entity_file}")
    
    entity_name = entity_match.group(1)
    entity_body = entity_match.group(2).strip()
    
    return entity_name, entity_body





def generate_package_file(package_name: str, components: Dict[str, str], output_file, append_file=None):
    """
    Generate a VHDL package file with component declarations.
    If output_file is None, write to stdout.
    If append_file is specified, append its content before 'end package' statement.
    
    components dict maps component_name to entity_body (raw text between entity...is and end entity)
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
            entity_body = components[component_name]
            
            f.write(f"  component {component_name} is\n")
            
            # Write the entity body with proper indentation
            for line in entity_body.split('\n'):
                if line.strip():  # Skip empty lines
                    f.write(f"  {line}\n")
                else:
                    f.write("\n")
            
            f.write("  end component;\n")
            f.write("\n")
        
        # Append content from file if specified
        if append_file:
            try:
                with open(append_file, 'r') as append_f:
                    append_content = append_f.read()
                    if append_content.strip():  # Only append if file has content
                        f.write(append_content)
                        if not append_content.endswith('\n'):
                            f.write('\n')
                        f.write('\n')
            except Exception as e:
                print(f"Warning: Failed to read append file {append_file}: {e}", file=sys.stderr)
        
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
  %(prog)s -i "cadr1/cadr1_*.vhd" -p cadr1/busint.vhd
  %(prog)s -i "ttl/sn74*.vhd" -p ttl/sn74.vhd
  %(prog)s -i "cadr/*.vhd" > components.vhd
  %(prog)s -i "dip/dip_*.vhd" -p dip/dip.vhd -a dip/aliases.txt
  %(prog)s -i "ttl/sn74*.vhd" "dip/dip_74s*.vhd" specific_file.vhd -p mixed_components.vhd
  %(prog)s -i "ttl/am*.vhd" -e "*_tb.vhd" "amd.vhd" -p ttl/amd.vhd
        """
    )
    
    parser.add_argument('-i', '--include', nargs='+', required=True, 
                       help='Entity files and/or wildcard patterns to include (e.g., "cadr1/*.vhd" or cadr1/file1.vhd "dip/dip_74*.vhd")')
    parser.add_argument('-e', '--exclude', nargs='*', default=[], 
                       help='Entity files and/or wildcard patterns to exclude (e.g., "*_tb.vhd" "amd.vhd")')
    parser.add_argument('-p', '--package', type=Path, 
                       help='Output package file (default: print to stdout)')
    parser.add_argument('-a', '--append', type=Path,
                       help='Text file to append to the package before "end package" statement')
    
    args = parser.parse_args()
    
    # Handle multiple include arguments that can be files or wildcard patterns
    entity_files = []
    
    for arg in args.include:
        # Try globbing first
        globbed_files = glob.glob(arg)
        
        if globbed_files:
            # Pattern matched files - add all matches
            entity_files.extend(globbed_files)
        elif Path(arg).exists():
            # Single file exists
            entity_files.append(arg)
        else:
            print(f"Error: No files found matching include pattern or file: {arg}", file=sys.stderr)
            sys.exit(1)
    
    # Remove duplicates while preserving order
    seen = set()
    unique_entity_files = []
    for f in entity_files:
        if f not in seen:
            seen.add(f)
            unique_entity_files.append(f)
    entity_files = unique_entity_files
    
    # Handle exclude patterns
    if args.exclude:
        exclude_files = set()
        
        for exclude_arg in args.exclude:
            # Try globbing first
            globbed_files = glob.glob(exclude_arg)
            
            if globbed_files:
                # Pattern matched files - add all matches to exclude set
                exclude_files.update(globbed_files)
            elif Path(exclude_arg).exists():
                # Single file exists
                exclude_files.add(exclude_arg)
            # Note: Don't error if exclude pattern doesn't match anything
        
        # Filter out excluded files
        original_count = len(entity_files)
        entity_files = [f for f in entity_files if f not in exclude_files]
        
        if len(entity_files) < original_count:
            excluded_count = original_count - len(entity_files)
            print(f"Note: Excluded {excluded_count} files matching exclude patterns", file=sys.stderr)
    
    entity_files = [Path(f) for f in entity_files]
    
    # Filter out the package file from entity files if it matches
    if args.package:
        original_count = len(entity_files)
        # Convert to absolute paths for comparison
        package_abs_path = args.package.resolve()
        entity_files = [f for f in entity_files if f.resolve() != package_abs_path]
        
        if len(entity_files) < original_count:
            print(f"Note: Excluded package file {args.package} from entity files", file=sys.stderr)
    
    # Determine package name
    if args.package:
        package_name = args.package.stem
    else:
        package_name = "components"
    
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
            entity_name, entity_body = parse_entity_declaration(entity_file)
            components[entity_name] = entity_body
            
            print(f"  Found entity: {entity_name}", file=sys.stderr)
            
        except Exception as e:
            print(f"  Warning: Failed to parse {entity_file}: {e}", file=sys.stderr)
            continue
    
    if not components:
        print("Error: No valid entities found", file=sys.stderr)
        sys.exit(1)
    
    # Generate package file
    print(f"Generating package with {len(components)} components...", file=sys.stderr)
    
    try:
        generate_package_file(package_name, components, args.package, args.append)
        
        if args.package:
            print(f"Successfully generated package file: {args.package}", file=sys.stderr)
        else:
            print("Successfully generated package to stdout", file=sys.stderr)
        
        # Print summary
        print(f"Package contains {len(components)} components", file=sys.stderr)
        
    except Exception as e:
        print(f"Error generating package: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()