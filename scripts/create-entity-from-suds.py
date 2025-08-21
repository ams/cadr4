#!/usr/bin/env python3
"""
Create an entity file from a SUDS file.

This script reads a SUDS file (which contains only the architecture),
extracts all signals used in the port maps, determines their directions
from dip.vhd, and generates a complete entity file.
"""

import re
import sys
import argparse
from pathlib import Path
from typing import Dict, Set, Tuple, List


def parse_dip_components(dip_file: Path) -> Dict[str, Dict[str, str]]:
    """
    Parse dip.vhd to extract component definitions and signal directions.
    Also handles alias statements.
    
    Returns a dictionary mapping component names to dictionaries of pin->direction.
    """
    components = {}
    current_component = None
    current_pins = {}
    
    with open(dip_file, 'r') as f:
        content = f.read()
    
    # Pattern to match component declarations (with or without port on same line)
    component_pattern = r'component\s+(dip_\w+)\s+is\s*'
    port_pattern = r'port\s*\('
    pin_pattern = r'p(\d+)\s*:\s*(in|out|inout)\s+std_logic'
    # Pattern to match alias statements
    alias_pattern = r'alias\s+(dip_\w+)\s+is\s+(dip_\w+)\s*;'
    
    lines = content.split('\n')
    in_component = False
    in_port_section = False
    
    for line in lines:
        line = line.strip()
        
        # Check for alias statements
        alias_match = re.search(alias_pattern, line)
        if alias_match:
            alias_name = alias_match.group(1)
            target_name = alias_match.group(2)
            # We'll resolve aliases after parsing all components
            continue
        
        # Check for component start
        component_match = re.search(component_pattern, line)
        if component_match:
            if current_component and current_pins:
                components[current_component] = current_pins
            current_component = component_match.group(1)
            current_pins = {}
            in_component = True
            in_port_section = False
            # Check if port is on the same line
            if re.search(port_pattern, line):
                in_port_section = True
            continue
        
        # Check for port section start within a component
        if in_component and not in_port_section and re.search(port_pattern, line):
            in_port_section = True
            continue
        
        # Check for component end
        if in_component and 'end component' in line:
            if current_component and current_pins:
                components[current_component] = current_pins
            current_component = None
            current_pins = {}
            in_component = False
            in_port_section = False
            continue
        
        # Parse pin definitions (only when in port section)
        if in_component and in_port_section:
            pin_match = re.search(pin_pattern, line)
            if pin_match:
                pin_num = f"p{pin_match.group(1)}"
                direction = pin_match.group(2)
                current_pins[pin_num] = direction
    
    # Handle last component if file doesn't end with 'end component'
    if current_component and current_pins:
        components[current_component] = current_pins
    
    # Now handle aliases - second pass through the content
    for line in content.split('\n'):
        line = line.strip()
        alias_match = re.search(alias_pattern, line)
        if alias_match:
            alias_name = alias_match.group(1)
            target_name = alias_match.group(2)
            if target_name in components:
                # Copy the target component's pin definitions to the alias
                components[alias_name] = components[target_name].copy()
    
    return components


def extract_alias_signals(suds_file: Path) -> Set[str]:
    """
    Extract alias signal names from a SUDS file.
    
    Returns a set of alias signal names that should be excluded from ports.
    """
    aliases = set()
    
    with open(suds_file, 'r') as f:
        content = f.read()
    
    # Pattern to match alias statements: alias signal_name : type is target_signal;
    alias_pattern = r'alias\s+([^\s:]+)\s*:\s*[^;]+;'
    
    alias_matches = re.findall(alias_pattern, content)
    for alias_name in alias_matches:
        aliases.add(alias_name.strip())
    
    return aliases


def extract_signals_from_suds(suds_file: Path) -> Set[str]:
    """
    Extract all signal names used in port maps from a SUDS file.
    
    Returns a set of signal names (preserving original form).
    """
    signals = set()
    aliases = extract_alias_signals(suds_file)
    
    with open(suds_file, 'r') as f:
        content = f.read()
    
    # Pattern to match port map statements
    # Matches: component_name : dip_component [generic map (...)] port map (pin => signal, ...)
    # Need to handle nested parentheses in signal names like \signal (name)\
    # Updated to handle optional generic map clause before port map
    port_map_pattern = r':\s*dip_\w+\s+(?:generic\s+map\s*\([^)]*\)\s+)?port\s+map\s*\((.+)\);'
    
    port_maps = re.findall(port_map_pattern, content)
    
    for port_map in port_maps:
        # Parse individual pin mappings: pin => signal
        # Split by commas, but be careful with escaped identifiers that contain commas
        # Use a state machine approach to properly parse the mappings
        pin_mappings = []
        
        # First, find all pin => signal mappings using a more robust approach
        # Handle the case where signal names can contain parentheses and other characters
        current_pos = 0
        while current_pos < len(port_map):
            # Find the next pin assignment
            pin_match = re.search(r'(p\d+)\s*=>\s*', port_map[current_pos:])
            if not pin_match:
                break
            
            pin_name = pin_match.group(1)
            signal_start = current_pos + pin_match.end()
            
            # Find the end of this signal assignment
            # Look for the next pin assignment or end of port map
            next_pin_match = re.search(r',\s*p\d+\s*=>', port_map[signal_start:])
            if next_pin_match:
                signal_end = signal_start + next_pin_match.start()
            else:
                # This is the last assignment, look for the closing parenthesis
                signal_end = len(port_map)
                # Remove any trailing closing parenthesis and whitespace
                while signal_end > signal_start and port_map[signal_end-1] in ') \t\n':
                    signal_end -= 1
            
            signal = port_map[signal_start:signal_end].strip()
            if signal.endswith(','):
                signal = signal[:-1].strip()
            
            pin_mappings.append((pin_name, signal))
            if next_pin_match:
                # Move to the start of the next pin (skip the comma and whitespace)
                current_pos = signal_start + next_pin_match.start() + 1  # +1 to skip the comma
            else:
                # No more pins, we're done
                break
        
        # Extract just the signal names for processing
        signal_names = [signal for _, signal in pin_mappings]
        
        for signal in signal_names:
            signal = signal.strip()
            # Filter out non-signal values, internal signals, and aliases
            if signal not in ['open', 'gnd', "'Z'", "'0'", "'1'"]:
                # Don't modify signal names, preserve them as-is
                # Skip internal signals (net_xx), power/ground signals, and aliases
                if (signal and not signal.startswith('gnd') and not signal.startswith('vcc') 
                    and not signal.startswith('net_') and signal not in aliases):
                    signals.add(signal)
    
    return signals


def determine_signal_directions(suds_file: Path, dip_components: Dict[str, Dict[str, str]]) -> Dict[str, str]:
    """
    Determine signal directions by analyzing how they're connected to component pins.
    
    Returns a dictionary mapping signal names to their directions.
    """
    signal_directions = {}
    aliases = extract_alias_signals(suds_file)
    
    with open(suds_file, 'r') as f:
        content = f.read()
    
    # Pattern to match complete port map statements
    # Need to handle nested parentheses in signal names like \signal (name)\
    # Updated to handle optional generic map clause before port map
    instance_pattern = r'(\w+)\s*:\s*(dip_\w+)\s+(?:generic\s+map\s*\([^)]*\)\s+)?port\s+map\s*\((.+)\);'
    
    instances = re.findall(instance_pattern, content)
    
    for instance_name, component_type, port_map in instances:
        if component_type not in dip_components:
            print(f"Error: Component {component_type} not found in dip.vhd", file=sys.stderr)
            sys.exit(1)
        
        component_pins = dip_components[component_type]
        
        # Parse pin mappings
        # Split by commas, but be careful with escaped identifiers that contain commas
        # Use a state machine approach to properly parse the mappings
        pin_mappings = []
        
        # First, find all pin => signal mappings using a more robust approach
        # Handle the case where signal names can contain parentheses and other characters
        current_pos = 0
        while current_pos < len(port_map):
            # Find the next pin assignment
            pin_match = re.search(r'(p\d+)\s*=>\s*', port_map[current_pos:])
            if not pin_match:
                break
            
            pin_name = pin_match.group(1)
            signal_start = current_pos + pin_match.end()
            
            # Find the end of this signal assignment
            # Look for the next pin assignment or end of port map
            next_pin_match = re.search(r',\s*p\d+\s*=>', port_map[signal_start:])
            if next_pin_match:
                signal_end = signal_start + next_pin_match.start()
            else:
                # This is the last assignment, look for the closing parenthesis
                signal_end = len(port_map)
                # Remove any trailing closing parenthesis and whitespace
                while signal_end > signal_start and port_map[signal_end-1] in ') \t\n':
                    signal_end -= 1
            
            signal = port_map[signal_start:signal_end].strip()
            if signal.endswith(','):
                signal = signal[:-1].strip()
            
            pin_mappings.append((pin_name, signal))
            if next_pin_match:
                # Move to the start of the next pin (skip the comma and whitespace)
                current_pos = signal_start + next_pin_match.start() + 1  # +1 to skip the comma
            else:
                # No more pins, we're done
                break
        
        for pin, signal in pin_mappings:
            signal = signal.strip()
            
            # Skip non-signal values
            if signal in ['open', 'gnd', "'Z'", "'0'", "'1'"]:
                continue
            
            # Keep original signal name but check if it's a valid signal
            # Skip internal signals (net_xx), power/ground signals, and aliases
            if (signal and not signal.startswith('gnd') and not signal.startswith('vcc') 
                and not signal.startswith('net_') and signal not in aliases):
                if pin in component_pins:
                    pin_direction = component_pins[pin]
                    
                    # If component pin is input, then signal is output from our entity perspective
                    # If component pin is output, then signal is input to our entity perspective
                    if pin_direction == 'in':
                        entity_direction = 'in'
                    elif pin_direction == 'out':
                        entity_direction = 'out'
                    else:  # inout
                        entity_direction = 'inout'
                    
                    # Handle conflicting directions (signal used as both input and output)
                    if signal in signal_directions:
                        if signal_directions[signal] != entity_direction:
                            # Only use inout if one of the directions is actually inout
                            if signal_directions[signal] == 'inout' or entity_direction == 'inout':
                                signal_directions[signal] = 'inout'
                            # For in/out conflicts, prefer out (signal is generated internally)
                            elif entity_direction == 'out' or signal_directions[signal] == 'out':
                                signal_directions[signal] = 'out'
                            else:
                                signal_directions[signal] = 'in'
                    else:
                        signal_directions[signal] = entity_direction
    
    return signal_directions


def generate_entity_file(entity_name: str, signals: Dict[str, str], output_file):
    """
    Generate a complete VHDL entity file.
    If output_file is None, write to stdout.
    """
    
    # Sort signals by direction and then alphabetically
    sorted_signals = sorted(signals.items(), key=lambda x: (x[1], x[0]))
    
    # Group by direction
    in_signals = [(name, direction) for name, direction in sorted_signals if direction == 'in']
    out_signals = [(name, direction) for name, direction in sorted_signals if direction == 'out']
    inout_signals = [(name, direction) for name, direction in sorted_signals if direction == 'inout']
    
    # Determine output stream
    if output_file:
        f = open(output_file, 'w')
    else:
        f = sys.stdout
    
    try:
        f.write("library ieee;\n")
        f.write("use ieee.std_logic_1164.all;\n")
        f.write("\n")
        f.write(f"entity {entity_name} is\n")
        f.write("  port (\n")
        
        # Write all signals
        all_signals = in_signals + inout_signals + out_signals
        
        for i, (signal_name, direction) in enumerate(all_signals):
            # Use the signal name as-is (already has backslashes if needed)
            display_name = signal_name
            
            line = f"    {display_name:<15} : {direction:<6} std_logic"
            
            # Add semicolon for all but the last signal
            if i < len(all_signals) - 1:
                line += ";"
            
            f.write(line + "\n")
        
        f.write("  );\n")
        f.write("end entity;\n")
    finally:
        # Only close if it's a file (not stdout)
        if output_file and f != sys.stdout:
            f.close()


def main():
    parser = argparse.ArgumentParser(
        description="Create an entity file from a SUDS file",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s cadr/suds/cadr_actl_suds.vhd -d dip/dip.vhd > output.vhd
  %(prog)s cadr/suds/cadr_alu0_suds.vhd -d dip/dip.vhd -o custom_alu0.vhd
        """
    )
    
    parser.add_argument('suds_file', type=Path, help='Path to the SUDS file')
    parser.add_argument('-o', '--output', type=Path, help='Output entity file (default: print to stdout)')
    parser.add_argument('-d', '--dip-file', type=Path, required=True, help='Path to dip.vhd file')
    
    args = parser.parse_args()
    
    # Validate input file
    if not args.suds_file.exists():
        print(f"Error: SUDS file {args.suds_file} does not exist", file=sys.stderr)
        sys.exit(1)
    
    if not args.dip_file.exists():
        print(f"Error: DIP file {args.dip_file} does not exist", file=sys.stderr)
        sys.exit(1)
    
    # Determine output and entity name
    if args.output:
        output_file = args.output
        # Extract entity name from output file name
        entity_name = output_file.stem
    else:
        output_file = None  # stdout
        # Extract entity name from SUDS file name
        suds_name = args.suds_file.stem
        if suds_name.endswith('_suds'):
            entity_name = suds_name[:-5]  # Remove '_suds'
        else:
            entity_name = suds_name
    
    print(f"Processing SUDS file: {args.suds_file}", file=sys.stderr)
    print(f"Using DIP definitions from: {args.dip_file}", file=sys.stderr)
    if output_file:
        print(f"Output entity file: {output_file}", file=sys.stderr)
    else:
        print(f"Output: stdout", file=sys.stderr)
    print(f"Entity name: {entity_name}", file=sys.stderr)
    
    try:
        # Parse DIP components
        print("Parsing DIP components...", file=sys.stderr)
        dip_components = parse_dip_components(args.dip_file)
        print(f"Found {len(dip_components)} DIP components", file=sys.stderr)
        
        # Extract signals from SUDS
        print("Extracting signals from SUDS file...", file=sys.stderr)
        signals = extract_signals_from_suds(args.suds_file)
        print(f"Found {len(signals)} unique signals", file=sys.stderr)
        
        # Determine signal directions
        print("Determining signal directions...", file=sys.stderr)
        signal_directions = determine_signal_directions(args.suds_file, dip_components)
        print(f"Determined directions for {len(signal_directions)} signals", file=sys.stderr)
        
        # Filter signals that have determined directions
        filtered_signals = {name: direction for name, direction in signal_directions.items() if direction}
        
        if not filtered_signals:
            print("Warning: No signals with determined directions found", file=sys.stderr)
            sys.exit(1)
        
        # Generate entity file
        if output_file:
            print("Generating entity file...", file=sys.stderr)
        else:
            print("Generating entity...", file=sys.stderr)
        
        generate_entity_file(entity_name, filtered_signals, output_file)
        
        if output_file:
            print(f"Successfully generated entity file: {output_file}", file=sys.stderr)
        else:
            print("Successfully generated entity to stdout", file=sys.stderr)
        
        print(f"Entity contains {len(filtered_signals)} signals:", file=sys.stderr)
        
        # Print summary
        directions = {}
        for direction in filtered_signals.values():
            directions[direction] = directions.get(direction, 0) + 1
        
        for direction, count in sorted(directions.items()):
            print(f"  {direction}: {count} signals", file=sys.stderr)
        
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()