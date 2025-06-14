#!/usr/bin/env python3
"""
Combine PROM hex files into a single combined hex file for comparison with reference.

The CADR PROM system consists of:
- PROM0 (addresses 0-511): Uses 6 hex files for different bit ranges
- PROM1 (addresses 512-1023): Uses 6 hex files for different bit ranges

Each PROM uses 74S472 chips that provide 8 bits each:
- prom0_1b17.hex / prom1_1b16.hex: bits 32-39 (i32-i39)
- prom0_1b19.hex / prom1_1b18.hex: bits 40-48 (i40-i45, i47-i48) - note i46 missing
- prom0_1c20.hex / prom1_1b20.hex: bits 24-31 (i24-i31)  
- prom0_1d16.hex / prom1_1d17.hex: bits 16-23 (i16-i23)
- prom0_1e17.hex / prom1_1e18.hex: bits 0-7 (i0-i7)
- prom0_1e19.hex / prom1_1e20.hex: bits 8-15 (i8-i15)

The combined output should be 48 bits (i46 is missing, handled by PCTL).

IMPORTANT: Address lines are inverted! pc0-pc8 are inverted before going to PROMs.
So PROM address 0 corresponds to pc0-pc8 = all 1s (inverted to all 0s).
"""

import os

def read_hex_file(filename):
    """Read a hex file and return list of byte values."""
    with open(filename, 'r') as f:
        lines = f.readlines()
    
    # Remove empty lines and strip whitespace
    values = []
    for line in lines:
        line = line.strip()
        if line:
            values.append(int(line, 16))
    
    return values

def invert_address_9bit(addr):
    """Invert a 9-bit address (for PROM addressing)."""
    return (~addr) & 0x1FF  # Invert and mask to 9 bits

def combine_prom_data():
    """Combine PROM0 and PROM1 hex files into a single combined file."""
    
    # PROM0 files (addresses 0-511)
    prom0_files = {
        'i32_39': 'prom0_1b17.hex',  # bits 32-39
        'i40_48': 'prom0_1b19.hex',  # bits 40-45, 47-48 (i46 missing)
        'i24_31': 'prom0_1c20.hex',  # bits 24-31
        'i16_23': 'prom0_1d16.hex',  # bits 16-23
        'i0_7':   'prom0_1e17.hex',  # bits 0-7
        'i8_15':  'prom0_1e19.hex',  # bits 8-15
    }
    
    # PROM1 files (addresses 512-1023)
    prom1_files = {
        'i32_39': 'prom1_1b18.hex',  # bits 32-39
        'i40_48': 'prom1_1b20.hex',  # bits 40-45, 47-48 (i46 missing)
        'i24_31': 'prom1_1b16.hex',  # bits 24-31
        'i16_23': 'prom1_1d17.hex',  # bits 16-23
        'i0_7':   'prom1_1e18.hex',  # bits 0-7
        'i8_15':  'prom1_1e20.hex',  # bits 8-15
    }
    
    # Read all PROM0 data
    prom0_data = {}
    for key, filename in prom0_files.items():
        if os.path.exists(filename):
            prom0_data[key] = read_hex_file(filename)
            print(f"Read {len(prom0_data[key])} entries from {filename}")
        else:
            print(f"Warning: {filename} not found")
            prom0_data[key] = [0] * 512  # Default to zeros
    
    # Read all PROM1 data
    prom1_data = {}
    for key, filename in prom1_files.items():
        if os.path.exists(filename):
            prom1_data[key] = read_hex_file(filename)
            print(f"Read {len(prom1_data[key])} entries from {filename}")
        else:
            print(f"Warning: {filename} not found")
            prom1_data[key] = [0] * 512  # Default to zeros
    
    # Combine data into 48-bit words
    combined_data = [0] * 1024  # Initialize array for 1024 entries
    
    # Process all 1024 addresses (0-1023)
    for pc_val in range(1024):
        # pc_val is the logical address (what the testbench uses)
        # We need to determine which PROM and what address within that PROM
        
        if pc_val < 512:
            # PROM0: pc9=0, pc0-pc8 = pc_val
            # Address lines are inverted, so PROM sees inverted address
            prom_addr = invert_address_9bit(pc_val)
            
            # Get data from PROM0
            if prom_addr < len(prom0_data['i0_7']):
                i0_7 = prom0_data['i0_7'][prom_addr]
                i8_15 = prom0_data['i8_15'][prom_addr]
                i16_23 = prom0_data['i16_23'][prom_addr]
                i24_31 = prom0_data['i24_31'][prom_addr]
                i32_39 = prom0_data['i32_39'][prom_addr]
                i40_48 = prom0_data['i40_48'][prom_addr]
            else:
                i0_7 = i8_15 = i16_23 = i24_31 = i32_39 = i40_48 = 0
        else:
            # PROM1: pc9=1, pc0-pc8 = pc_val - 512
            # Address lines are inverted, so PROM sees inverted address
            prom_addr = invert_address_9bit(pc_val - 512)
            
            # Get data from PROM1
            if prom_addr < len(prom1_data['i0_7']):
                i0_7 = prom1_data['i0_7'][prom_addr]
                i8_15 = prom1_data['i8_15'][prom_addr]
                i16_23 = prom1_data['i16_23'][prom_addr]
                i24_31 = prom1_data['i24_31'][prom_addr]
                i32_39 = prom1_data['i32_39'][prom_addr]
                i40_48 = prom1_data['i40_48'][prom_addr]
            else:
                i0_7 = i8_15 = i16_23 = i24_31 = i32_39 = i40_48 = 0
        
        # Extract individual bits from i40_48 byte
        # The 74S472 outputs are: p6=i40, p7=i41, p8=i42, p9=i43, p11=i44, p12=i45, p13=i47, p14=i48
        # So the byte contains: bit7=i48, bit6=i47, bit5=i45, bit4=i44, bit3=i43, bit2=i42, bit1=i41, bit0=i40
        i40 = (i40_48 >> 0) & 1
        i41 = (i40_48 >> 1) & 1
        i42 = (i40_48 >> 2) & 1
        i43 = (i40_48 >> 3) & 1
        i44 = (i40_48 >> 4) & 1
        i45 = (i40_48 >> 5) & 1
        i47 = (i40_48 >> 6) & 1
        i48 = (i40_48 >> 7) & 1
        
        # Build 48-bit word (MSB first)
        word = (i48 << 47) | (i47 << 46) | (i45 << 45) | (i44 << 44) | (i43 << 43) | (i42 << 42) | (i41 << 41) | (i40 << 40)
        word |= (i32_39 << 32) | (i24_31 << 24) | (i16_23 << 16) | (i8_15 << 8) | i0_7
        
        combined_data[pc_val] = word
    
    # Write combined data as hex file (6 bytes per 48-bit word, LSB first to match reference)
    with open('combined_prom.hex', 'w') as f:
        for word in combined_data:
            # Write as 6 bytes (48 bits), LSB first to match reference format
            for byte_idx in range(6):
                byte_val = (word >> (byte_idx * 8)) & 0xFF
                f.write(f"{byte_val:02x}\n")
    
    print(f"Created combined_prom.hex with {len(combined_data)} 48-bit words ({len(combined_data) * 6} bytes)")
    print("Address lines are inverted: pc_val=0 uses PROM address 0x1FF, pc_val=511 uses PROM address 0x000")
    return len(combined_data)

if __name__ == "__main__":
    combine_prom_data() 