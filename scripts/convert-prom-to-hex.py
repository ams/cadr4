#!/usr/bin/env python3

import sys

def convert_prom_to_hex(input_file):
    """Convert PROM data from octal address/octal value format to hex format"""
    
    # Initialize array with 512 entries (octal 777 + 1), all set to 0
    data = [0] * 512
    
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    # Skip the header line and process data lines
    for line in lines[2:]:  # Skip "PROM location 1E17" and empty line
        line = line.strip()
        if not line or line == "END":
            break
            
        parts = line.split()
        if len(parts) == 2:
            try:
                # Convert octal address to decimal
                octal_addr = parts[0]
                decimal_addr = int(octal_addr, 8)
                
                # Convert octal value to decimal
                octal_value = parts[1]
                decimal_value = int(octal_value, 8)
                
                # Store in array
                if decimal_addr < 512:
                    data[decimal_addr] = decimal_value
                    
            except ValueError:
                continue
    
    # Output hex values to stdout
    for value in data:
        # Convert to hex, remove '0x' prefix, pad to 2 digits, make lowercase
        hex_value = format(value, '02x')
        print(hex_value)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: convert_prom_to_hex.py <input_file>", file=sys.stderr)
        sys.exit(1)
    
    input_file = sys.argv[1]
    convert_prom_to_hex(input_file) 