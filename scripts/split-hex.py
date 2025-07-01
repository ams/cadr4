#!/usr/bin/env python3
"""
Split a hex file into multiple interleaved hex files based on bit width conversion.

This utility takes a hex file containing data for RAM of a certain bit width and splits
it into multiple hex files for RAMs of a smaller bit width using interleaving.

Examples:
  python split-hex.py data.hex 16 8 output 256
    Split a 16-bit hex file into two 8-bit files with 256 words each
  
  python split-hex.py promh.mcr.9.hex 48 8 promh9 512 --reverse
    Split a 48-bit hex file into six 8-bit files with 512 words each, reversed
"""

import sys
import os
import argparse


def read_hex_file(filename):
    """Read hex file and return list of hex values (without 0x prefix)."""
    hex_values = []
    try:
        with open(filename, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):  # Skip empty lines and comments
                    # Remove 0x prefix if present
                    if line.startswith('0x'):
                        line = line[2:]
                    hex_values.append(line.upper())
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file '{filename}': {e}")
        sys.exit(1)
    
    return hex_values


def write_hex_file(filename, hex_values):
    """Write hex values to file."""
    try:
        with open(filename, 'w') as f:
            for value in hex_values:
                f.write(f"{value}\n")
    except Exception as e:
        print(f"Error writing file '{filename}': {e}")
        sys.exit(1)


def convert_to_format(hex_byte, to_width):
    """Convert a hex byte to the specified format and width."""
    # Convert hex byte to integer
    byte_val = int(hex_byte, 16)
    
    results = []
    
    if to_width == 8:
        # 8-bit: return as-is in hex format
        results.append(hex_byte.upper())
    elif to_width == 2:
        # 2-bit: split byte into 4 parts (2 bits each)
        for i in range(4):
            bits = (byte_val >> (6 - i * 2)) & 0x3
            results.append(f"{bits:02X}")
    elif to_width == 1:
        # 1-bit: split byte into 8 parts (1 bit each)
        for i in range(8):
            bit = (byte_val >> (7 - i)) & 0x1
            results.append(f"{bit:02X}")
    
    return results


def split_hex(hex_file, from_width, to_width, prefix, out_dir, to_words=None, reverse=False):
    """Split hex file based on bit width conversion and interleaving."""
    
    # Validate inputs
    if from_width <= 0 or to_width <= 0:
        print("Error: Bit widths must be positive integers.")
        sys.exit(1)
    
    if to_width not in [1, 2, 8]:
        print(f"Error: to_width must be 1, 2, or 8, got {to_width}")
        sys.exit(1)
    
    if from_width % to_width != 0:
        print(f"Error: from_width ({from_width}) must be divisible by to_width ({to_width}).")
        sys.exit(1)
    
    # Validate that to_width * to_words is a multiple of 8
    if to_words is not None and (to_width * to_words) % 8 != 0:
        print(f"Error: to_width ({to_width}) * to_words ({to_words}) = {to_width * to_words} must be a multiple of 8.")
        sys.exit(1)
    
    # Create output directory if it doesn't exist
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
        print(f"Created output directory: {out_dir}")
    
    # Calculate how many output files we need
    num_files = from_width // to_width
    from_bytes = from_width // 8
    
    if from_width % 8 != 0:
        print("Error: from_width must be a multiple of 8.")
        sys.exit(1)
    
    print(f"Converting from {from_width}-bit to {to_width}-bit")
    print(f"Input: {from_bytes} bytes per word")
    print(f"Output: {to_width}-bit hex, {num_files} files")
    
    # Read input hex file
    hex_values = read_hex_file(hex_file)
    
    if not hex_values:
        print("Error: No hex values found in input file.")
        sys.exit(1)
    
    # Check if input is individual bytes (2 hex digits each) or complete words
    if len(hex_values[0]) == 2:
        # Input file contains individual bytes, one per line
        print("Input format: Individual bytes (one per line)")
        
        # Validate that total number of bytes is divisible by from_bytes
        if len(hex_values) % from_bytes != 0:
            print(f"Error: Total bytes ({len(hex_values)}) must be divisible by from_width bytes ({from_bytes}).")
            sys.exit(1)
        
        # Group bytes into words and then split
        output_files = [[] for _ in range(num_files)]
        
        # Process bytes in groups of from_bytes
        for word_start in range(0, len(hex_values), from_bytes):
            # Extract one word (from_bytes consecutive bytes)
            word_bytes = hex_values[word_start:word_start + from_bytes]
            
            # Distribute bytes to output files using interleaving
            byte_idx = 0
            for hex_byte in word_bytes:
                # Convert each byte to the target format
                converted_values = convert_to_format(hex_byte, to_width)
                
                # Distribute the converted values to output files
                for val in converted_values:
                    file_idx = byte_idx % num_files
                    output_files[file_idx].append(val)
                    byte_idx += 1
        
    else:
        # Input file contains complete words
        print("Input format: Complete words")
        
        # Validate that each hex value has the correct number of hex digits
        expected_hex_digits = from_bytes * 2
        for i, value in enumerate(hex_values):
            if len(value) != expected_hex_digits:
                print(f"Error: Line {i+1} has {len(value)} hex digits, expected {expected_hex_digits} for {from_width}-bit width.")
                sys.exit(1)
        
        # Initialize output arrays
        output_files = [[] for _ in range(num_files)]
        
        # Process each input hex value
        for hex_value in hex_values:
            # Split hex value into individual bytes
            hex_bytes = []
            for i in range(0, len(hex_value), 2):
                hex_bytes.append(hex_value[i:i+2])
            
            # Process each byte and distribute to output files
            byte_idx = 0
            for hex_byte in hex_bytes:
                # Convert each byte to the target format
                converted_values = convert_to_format(hex_byte, to_width)
                
                # Distribute the converted values to output files
                for val in converted_values:
                    file_idx = byte_idx % num_files
                    output_files[file_idx].append(val)
                    byte_idx += 1
    
    # Apply padding and/or reversing if requested
    for i in range(num_files):
        # Pad with zeros if to_words is specified
        if to_words is not None:
            current_words = len(output_files[i])
            if current_words > to_words:
                print(f"Warning: File {i} has {current_words} words, truncating to {to_words}")
                output_files[i] = output_files[i][:to_words]
            elif current_words < to_words:
                padding_needed = to_words - current_words
                zero_value = "00"
                output_files[i].extend([zero_value] * padding_needed)
                print(f"Padded file {i} with {padding_needed} zero words")
        
        # Reverse if requested
        if reverse:
            output_files[i].reverse()
            print(f"Reversed file {i}")
    
    # Write output files
    for i in range(num_files):
        output_filename = os.path.join(out_dir, f"{prefix}.{i}.hex")
        write_hex_file(output_filename, output_files[i])
        print(f"Written {len(output_files[i])} values to {output_filename}")


def main():
    parser = argparse.ArgumentParser(
        description='Split a hex file into multiple interleaved hex files based on bit width conversion.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --from-hex data.hex --from-width 16 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output
    Split a 16-bit hex file into two 8-bit hex files with 256 words each in ./output directory

  %(prog)s --from-hex promh.mcr.9.hex --from-width 48 --to-width 8 --to-prefix promh9 --to-words 512 --out-dir ./rom --reverse
    Split a 48-bit hex file into six 8-bit hex files with 512 words each in ./rom directory, reversed

  %(prog)s --from-hex data.hex --from-width 8 --to-width 1 --to-prefix bits --to-words 64 --out-dir ./bits
    Split an 8-bit hex file into eight 1-bit files with 64 values each in ./bits directory

Output format:
- All output files are .hex format with one hex byte (two hex digits) per line
- For 2-bit width: each 2-bit value is written as 00, 01, 02, or 03
- For 1-bit width: each 1-bit value is written as 00 or 01
        """
    )
    
    parser.add_argument('--from-hex', 
                       required=True,
                       help='Input hex file path')
    parser.add_argument('--from-width', 
                       type=int,
                       required=True,
                       help='Original bit width (must be multiple of 8)')
    parser.add_argument('--to-width', 
                       type=int,
                       required=True,
                       choices=[1, 2, 8],
                       help='Target bit width: 1, 2, or 8')
    parser.add_argument('--to-prefix', 
                       required=True,
                       help='Prefix for output files')
    parser.add_argument('--to-words', 
                       type=int,
                       required=True,
                       help='Number of words in each output file (pad with zeros if needed)')
    parser.add_argument('--out-dir', 
                       required=True,
                       help='Output directory for generated hex files')
    parser.add_argument('--reverse', 
                       action='store_true',
                       help='Reverse the order of entries in each output file')
    
    args = parser.parse_args()
    
    split_hex(getattr(args, 'from_hex'), getattr(args, 'from_width'), getattr(args, 'to_width'), 
              getattr(args, 'to_prefix'), args.out_dir, getattr(args, 'to_words'), args.reverse)


if __name__ == "__main__":
    main() 