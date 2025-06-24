#!/usr/bin/env python3
"""
Script to find buses in CADR book files by analyzing signal names with numeric suffixes.
"""

import re
import os
from collections import defaultdict

def extract_signals_from_file(filename):
    """Extract all signal names from a VHDL component file."""
    signals = []
    
    if not os.path.exists(filename):
        print(f"Warning: File {filename} not found")
        return signals
    
    with open(filename, 'r') as f:
        content = f.read()
    
    # Pattern to match signal declarations in port statements
    # Matches: signal_name : in/out std_logic;
    pattern = r'(\w+|\\\-[^\\]+\\)\s*:\s*(?:in|out)\s+std_logic\s*;'
    
    matches = re.findall(pattern, content)
    
    for match in matches:
        # Clean up the signal name - remove backslashes and dashes for processing
        clean_name = match.strip('\\').strip('-')
        signals.append((match, clean_name))
    
    return signals

def identify_buses(signals):
    """Identify buses from signal names with numeric suffixes."""
    buses = defaultdict(lambda: {'signals': [], 'max_bit': -1, 'min_bit': float('inf')})
    standalone_signals = []
    
    for original_name, clean_name in signals:
        # Pattern to match signals with numeric suffixes
        # Examples: ir32, a15, wadr9, amem23, etc.
        match = re.match(r'^([a-zA-Z][a-zA-Z0-9_]*?)(\d+)([a-zA-Z]*)$', clean_name)
        
        if match:
            base_name = match.group(1)
            bit_number = int(match.group(2))
            suffix = match.group(3)
            
            # Create a bus identifier that includes the suffix if present
            bus_name = base_name + suffix if suffix else base_name
            
            buses[bus_name]['signals'].append((original_name, bit_number))
            buses[bus_name]['max_bit'] = max(buses[bus_name]['max_bit'], bit_number)
            buses[bus_name]['min_bit'] = min(buses[bus_name]['min_bit'], bit_number)
        else:
            standalone_signals.append(original_name)
    
    return buses, standalone_signals

def is_real_bus(bus_info, min_signals=2, max_gap_ratio=0.3):
    """
    Determine if a group of signals represents a real bus.
    
    Args:
        bus_info: Dictionary with 'signals', 'min_bit', 'max_bit'
        min_signals: Minimum number of signals to be considered a bus
        max_gap_ratio: Maximum ratio of gaps to total range to be considered a bus
    
    Returns:
        bool: True if this is likely a real bus
    """
    signals = bus_info['signals']
    
    # Must have at least min_signals signals
    if len(signals) < min_signals:
        return False
    
    # Get all bit numbers and sort them
    bit_numbers = sorted([bit_num for _, bit_num in signals])
    
    # Calculate the total range and actual signals
    total_range = bit_numbers[-1] - bit_numbers[0] + 1
    actual_signals = len(bit_numbers)
    
    # If we have very few signals spread over a large range, probably not a bus
    # For example, TPR has signals at 0, 5, 10, 15, etc. - clearly timing signals
    gap_ratio = (total_range - actual_signals) / total_range
    
    if gap_ratio > max_gap_ratio:
        return False
    
    # Check for reasonable consecutive coverage
    # Allow some gaps but not too many
    consecutive_groups = []
    current_group = [bit_numbers[0]]
    
    for i in range(1, len(bit_numbers)):
        if bit_numbers[i] <= bit_numbers[i-1] + 2:  # Allow gap of 1
            current_group.append(bit_numbers[i])
        else:
            consecutive_groups.append(current_group)
            current_group = [bit_numbers[i]]
    consecutive_groups.append(current_group)
    
    # If we have too many separate groups, probably not a real bus
    if len(consecutive_groups) > 3:  # Allow up to 3 separate consecutive ranges
        return False
    
    # Check if the largest group covers most of the signals
    largest_group_size = max(len(group) for group in consecutive_groups)
    if largest_group_size < actual_signals * 0.6:  # At least 60% should be in largest group
        return False
    
    return True

def filter_real_buses(buses):
    """Filter out buses that only have one signal or don't represent real buses."""
    real_buses = {}
    
    for bus_name, bus_info in buses.items():
        if is_real_bus(bus_info):
            real_buses[bus_name] = bus_info
    
    return real_buses

def print_buses_vhdl_format(buses):
    """Print buses in VHDL port interface format, ordered by name."""
    if not buses:
        print("-- No buses found")
        return
    
    # Sort buses by name (case-insensitive)
    for bus_name in sorted(buses.keys(), key=str.upper):
        bus_info = buses[bus_name]
        max_bit = bus_info['max_bit']
        min_bit = bus_info['min_bit']
        
        # Use uppercase for bus name in VHDL format
        vhdl_name = bus_name.upper()
        
        print(f"{vhdl_name} : std_logic_vector({max_bit} downto {min_bit});")

def print_buses(buses, title):
    """Print buses in a formatted way."""
    if not buses:
        print(f"\n{title}: No buses found")
        return
        
    print(f"\n{title}:")
    print("=" * len(title))
    
    # Sort buses by name
    for bus_name in sorted(buses.keys()):
        bus_info = buses[bus_name]
        width = bus_info['max_bit'] - bus_info['min_bit'] + 1
        
        print(f"\n{bus_name.upper()}: {width} bits ({bus_info['min_bit']} to {bus_info['max_bit']})")
        
        # Sort signals by bit number
        sorted_signals = sorted(bus_info['signals'], key=lambda x: x[1])
        
        # Group signals for display (show ranges when consecutive)
        signal_groups = []
        current_group = [sorted_signals[0]]
        
        for i in range(1, len(sorted_signals)):
            if sorted_signals[i][1] == sorted_signals[i-1][1] + 1:
                current_group.append(sorted_signals[i])
            else:
                signal_groups.append(current_group)
                current_group = [sorted_signals[i]]
        signal_groups.append(current_group)
        
        # Print signal groups
        for group in signal_groups:
            if len(group) == 1:
                print(f"  {group[0][0]} ({group[0][1]})")
            else:
                print(f"  {group[0][0]}..{group[-1][0]} ({group[0][1]}..{group[-1][1]})")

def print_rejected_buses(buses, real_buses, title):
    """Print buses that were filtered out for analysis."""
    rejected = {name: info for name, info in buses.items() if name not in real_buses}
    
    if not rejected:
        return
        
    print(f"\n{title}:")
    print("=" * len(title))
    
    # Sort by number of signals, then by name
    for bus_name in sorted(rejected.keys(), key=lambda x: (len(rejected[x]['signals']), x)):
        bus_info = rejected[bus_name]
        signals = sorted(bus_info['signals'], key=lambda x: x[1])
        bit_numbers = [bit_num for _, bit_num in signals]
        
        print(f"{bus_name.upper()}: {len(signals)} signals, bits {bit_numbers}")

def main():
    """Main function to process both CADR book files."""
    files_to_process = [
        'cadr/cadr_book.vhd',
        'cadr/icmem_book.vhd'
    ]
    
    all_signals = []
    
    for filename in files_to_process:
        print(f"Processing {filename}...")
        signals = extract_signals_from_file(filename)
        all_signals.extend(signals)
        print(f"Found {len(signals)} signals in {filename}")
    
    print(f"\nTotal signals found: {len(all_signals)}")
    
    # Identify buses
    buses, standalone_signals = identify_buses(all_signals)
    real_buses = filter_real_buses(buses)
    
    # Print results in VHDL format
    print("\n-- CADR Bus Signals in VHDL Port Interface Format:")
    print("-- (sorted alphabetically by bus name)")
    print_buses_vhdl_format(real_buses)
    
    # Summary statistics
    print(f"\n-- SUMMARY:")
    print(f"-- Total signals: {len(all_signals)}")
    print(f"-- Real buses identified: {len(real_buses)}")
    print(f"-- Signals in real buses: {sum(len(bus['signals']) for bus in real_buses.values())}")
    print(f"-- Rejected signal groups: {len(buses) - len(real_buses)}")
    print(f"-- Standalone signals: {len(standalone_signals)}")

if __name__ == '__main__':
    main() 