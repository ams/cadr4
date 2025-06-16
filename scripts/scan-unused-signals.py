#!/usr/bin/env python3
"""
Script to check which signals declared in a VHDL file are actually used
in component instantiations.
"""

import re
import sys
import os

def extract_signals_from_file(filename):
    """Extract all signal declarations from the VHDL file."""
    signals = set()
    
    with open(filename, 'r') as f:
        content = f.read()
    
    # Find all signal declarations
    signal_pattern = r'signal\s+([^:]+)\s*:\s*std_logic'
    matches = re.findall(signal_pattern, content, re.IGNORECASE)
    
    for match in matches:
        # Clean up the signal name (remove whitespace)
        signal_name = match.strip()
        signals.add(signal_name)
    
    return signals

def extract_used_signals_from_file(filename):
    """Extract all signals used in component instantiations."""
    used_signals = set()
    
    with open(filename, 'r') as f:
        content = f.read()
    
    # Find the component instantiation section (after "begin")
    begin_match = re.search(r'\bbegin\b', content, re.IGNORECASE)
    if not begin_match:
        return used_signals
    
    # Get content after "begin"
    instantiation_content = content[begin_match.end():]
    
    # Find all port map assignments
    # Pattern to match signal names in port maps: signal_name => signal_name
    # Updated pattern to handle extended identifiers with spaces and special characters
    port_map_pattern = r'(\w+|\\[^\\]+\\)\s*=>\s*(\w+|\\[^\\]+\\)'
    matches = re.findall(port_map_pattern, instantiation_content)
    
    for port_name, signal_name in matches:
        # Add the signal name (right side of =>)
        used_signals.add(signal_name)
    
    return used_signals

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 check_signals.py <vhdl_file>")
        print("Example: python3 check_signals.py cadr_tb.vhd")
        sys.exit(1)
    
    filename = sys.argv[1]
    
    if not os.path.exists(filename):
        print(f"Error: File '{filename}' not found.")
        sys.exit(1)
    
    if not filename.lower().endswith('.vhd'):
        print(f"Warning: '{filename}' does not have a .vhd extension.")
    
    print("Analyzing VHDL signal usage...")
    print(f"File: {filename}")
    print()
    
    # Extract declared signals
    declared_signals = extract_signals_from_file(filename)
    print(f"Total declared signals: {len(declared_signals)}")
    
    # Extract used signals
    used_signals = extract_used_signals_from_file(filename)
    print(f"Total used signals in component instantiations: {len(used_signals)}")
    
    # Find unused signals
    unused_signals = declared_signals - used_signals
    print(f"Unused signals: {len(unused_signals)}")
    
    if unused_signals:
        print("\nUnused signals:")
        for signal in sorted(unused_signals):
            print(f"  {signal}")
    else:
        print("\nAll declared signals are used in component instantiations!")
    
    # Find signals used but not declared (shouldn't happen in a well-formed file)
    undeclared_used = used_signals - declared_signals
    if undeclared_used:
        print(f"\nSignals used but not declared: {len(undeclared_used)}")
        for signal in sorted(undeclared_used):
            print(f"  {signal}")

if __name__ == "__main__":
    main() 