#!/usr/bin/env python3
"""
Split a hex file into multiple interleaved hex files based on bit width conversion.

This utility takes a hex file containing data for RAM of a certain bit width and splits
it into multiple hex files for RAMs of a smaller bit width using interleaving.
Optionally calculates odd parity for each word and outputs it to a separate file.

The tool supports two types of splitting:
1. Word splitting: Wide words are split into narrower parts (interleaved)
2. Stack splitting: When total capacity exceeds target RAM size, multiple stacks are created

Examples:
  python split-hex.py --from-hex data.hex --from-width 16 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output
    Split a 16-bit hex file into two 8-bit files with 256 words each
  
  python split-hex.py --from-hex promh.mcr.9.hex --from-width 48 --to-width 8 --to-prefix promh9 --to-words 512 --out-dir ./rom --reverse
    Split a 48-bit hex file into six 8-bit files with 512 words each, reversed
    
  python split-hex.py --from-hex data.hex --from-width 16 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output --add-parity
    Split a 16-bit hex file into two 8-bit files plus a parity file with odd parity bits
    
  python split-hex.py --from-hex data.hex --from-width 18 --from-hex-width 32 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output
    Split an 18-bit value stored in 32-bit hex format, using only the 18 LSBs
    
  python split-hex.py --from-hex data.hex --from-width 16 --from-size 1024 --to-width 8 --to-size 256 --to-prefix output --out-dir ./output
    Split with stacking: 1024 words of 16-bit data automatically creates 4 stacks of 256-word 8-bit RAMs
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



def split_hex(hex_file, from_width, to_width, prefix, out_dir, reverse=False, add_parity=False, from_hex_width=None, from_size=None, to_size=None, includes_parity=False):
    """Split hex file based on bit width conversion and interleaving, with optional stacking."""
    
    # Validate inputs
    if from_width <= 0 or to_width <= 0 or from_hex_width <= 0:
        print("Error: Bit widths must be positive integers.")
        sys.exit(1)
    
    if to_width not in [1, 2, 8]:
        print(f"Error: to_width must be 1, 2, or 8, got {to_width}")
        sys.exit(1)
    
    if from_hex_width % 8 != 0:
        print(f"Error: from_hex_width ({from_hex_width}) must be a multiple of 8.")
        sys.exit(1)
    
    if from_hex_width < from_width:
        print(f"Error: from_hex_width ({from_hex_width}) must be >= from_width ({from_width}).")
        sys.exit(1)
    
    if add_parity and includes_parity:
        print("Error: Cannot use both --add-parity and --includes-parity simultaneously.")
        sys.exit(1)
    
    # Determine stacking configuration
    if from_size <= 0 or to_size <= 0:
        print("Error: Sizes must be positive integers.")
        sys.exit(1)
    
    if from_size > to_size:
        # Stacking needed
        if from_size % to_size != 0:
            print(f"Error: from_size ({from_size}) must be a multiple of to_size ({to_size}) for stacking.")
            sys.exit(1)
        
        num_stacks = from_size // to_size
        print(f"Stacking: {num_stacks} stacks, {to_size} words per output file")
    elif from_size < to_size:
        if not (includes_parity or add_parity):
            print(f"Error: from_size ({from_size}) cannot be smaller than to_size ({to_size}) unless --includes-parity or --add-parity is used.")
            sys.exit(1)
        else:
            # Padding (with or without parity calculation)
            num_stacks = 1
            if includes_parity:
                print(f"Padding with parity: from {from_size} to {to_size} words per output file")
            else:
                print(f"Padding: from {from_size} to {to_size} words per output file")
    else:
        # from_size == to_size, no stacking needed
        num_stacks = 1
        print(f"No stacking: from_size equals to_size ({from_size} words per output file)")
    
    # Calculate effective word width after parity handling
    if add_parity:
        effective_width = from_width + 1  # Add new parity bit
        print(f"Adding parity: expanding from {from_width} to {effective_width} bits per word")
    else:
        effective_width = from_width  # Keep original width
        if includes_parity:
            print(f"Input includes parity: using {effective_width} bits per word, will calculate parity for padding")
    
    # Calculate final width after left-padding to make divisible by to_width
    if effective_width % to_width != 0:
        final_width = ((effective_width + to_width - 1) // to_width) * to_width
        left_pad_bits = final_width - effective_width
        print(f"Left-padding: from {effective_width} to {final_width} bits per word (adding {left_pad_bits} zero bits)")
    else:
        final_width = effective_width
        left_pad_bits = 0
    
    # Calculate how many output files we need
    num_output_files = final_width // to_width
    
    from_hex_bytes = from_hex_width // 8
    
    print(f"Input hex format: {from_hex_width}-bit for {from_width}-bit data")
    print(f"Converting from {from_width}-bit to {to_width}-bit")
    print(f"Final word width: {final_width}-bit, {num_output_files} files per stack")
    print(f"Stack splitting: {num_stacks} stacks, {to_size} words per stack")
    
    # Read input hex file
    hex_values = read_hex_file(hex_file)
    
    if not hex_values:
        print("Error: No hex values found in input file.")
        sys.exit(1)
    
    # Initialize output files: [word_file][stack]
    output_files = [[[] for _ in range(num_stacks)] for _ in range(num_output_files)]
    
    # Read hex file data into memory, respecting from_hex_width
    hex_word_bytes = from_hex_bytes
    hex_words_available = len(hex_values) // hex_word_bytes
    
    print(f"Hex file has {len(hex_values)} bytes, which gives {hex_words_available} words of {from_hex_width} bits")
    
    # Create an array of word values (integers)
    words = []
    
    # Load available hex data into words
    words_to_read = min(hex_words_available, to_size)
    
    # Read from hex into words
    for word_idx in range(words_to_read):
        word_start = word_idx * hex_word_bytes
        word_hex_bytes = hex_values[word_start:word_start + hex_word_bytes]
        
        # Convert bytes to a single hex string and then to integer (little-endian: reverse byte order)
        # If hex file has AB CD EF, we want to interpret it as EFCDAB
        full_hex_value = ''.join(reversed(word_hex_bytes))
        full_value = int(full_hex_value, 16)
        
        # Extract only the valid bits (from_width bits from the from_hex_width bits)
        if from_width <= from_hex_width:
            # Take LSB from_width bits
            mask = (1 << from_width) - 1
            word_value = full_value & mask
        else:
            # from_width > from_hex_width, use all available bits
            word_value = full_value

        # if adding parity, it should be added to the existing words also
        if add_parity:
            # Calculate odd parity for the original word (before any padding)
            bit_count = bin(word_value).count('1')
            parity_bit = 1 if bit_count % 2 == 0 else 0
            # Add parity bit right after the original data (at bit from_width)
            if parity_bit:
                word_value |= (1 << from_width);
                
        words.append(word_value)
    
    print(f"Loaded {words_to_read} words from hex file")
    
    # add padding if needed with parity
    if words_to_read < to_size:
        padding_words = to_size - words_to_read
        print(f"Adding {padding_words} padding words")
        if includes_parity:
            # For each padding word, create word with parity
            for pad_word_idx in range(padding_words):
                # Zero data with odd parity = set parity bit to 1
                # Parity bit is at position from_width (same as used for actual data)
                word_value = 0  # Start with zero data
                
                # zero data has parity bit set at MSB (from_width - 1)
                word_value |= (1 << (from_width - 1))
                
                words.append(word_value)

            print(f"Added {padding_words} padding words (included parity)")

        else:
            # Add simple zero padding words with parity
            for pad_word_idx in range(padding_words):
                words.append(1 << from_width)
            
            print(f"Added {padding_words} padding words (added parity)")
    
    print(f"Total words: {len(words)}")
    
    # Now process the words and distribute to output files
    for word_idx, word_value in enumerate(words):
        # Determine which stack this word belongs to
        stack_idx = word_idx // to_size if num_stacks > 1 else 0
        if stack_idx >= num_stacks:
            break  # Skip excess words
        
        # Extract to_width-sized chunks directly from the word (LSB first to match file naming)
        for chunk_idx in range(num_output_files):
            # Calculate bit position from LSB (to match file naming scheme)
            bit_position = chunk_idx * to_width
            
            # Extract to_width bits starting at bit_position
            mask = (1 << to_width) - 1
            bits = (word_value >> bit_position) & mask
            
            # Convert to hex format
            hex_value = f"{bits:02x}"
            
            # Store in the file corresponding to this bit position
            output_files[chunk_idx][stack_idx].append(hex_value)
    
    # Write output files (naming: prefix.bitpos.stack.hex where bitpos indicates bit range)
    for i in range(num_output_files):
        for j in range(num_stacks):
            # Apply reversing if requested (at the very end, just before output)
            final_output = output_files[i][j][:]  # Make a copy
            if reverse:
                final_output.reverse()
            
            # Calculate bit position for this file (starting bit of the range)
            bit_pos = i * to_width
            output_filename = os.path.join(out_dir, f"{prefix}.{bit_pos}.{j}.hex")
            write_hex_file(output_filename, final_output)
            reverse_text = " (reversed)" if reverse else ""
            bit_range = f"bits {bit_pos}-{bit_pos + to_width - 1}" if to_width > 1 else f"bit {bit_pos}"
            print(f"Written {len(final_output)} values to {output_filename}{reverse_text} ({bit_range})")


def main():
    parser = argparse.ArgumentParser(
        description='Split a hex file into multiple interleaved hex files based on bit width conversion with optional stacking.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --from-hex data.hex --from-width 16 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output
    Word splitting: Split a 16-bit hex file into two 8-bit hex files with 256 words each
    Creates files: output.0.0.hex, output.1.0.hex

  %(prog)s --from-hex promh.mcr.9.hex --from-width 48 --to-width 8 --to-prefix promh9 --to-words 512 --out-dir ./rom --reverse
    Word splitting: Split a 48-bit hex file into six 8-bit hex files with 512 words each, reversed
    Creates files: promh9.0.0.hex, promh9.1.0.hex, promh9.2.0.hex, promh9.3.0.hex, promh9.4.0.hex, promh9.5.0.hex

  %(prog)s --from-hex data.hex --from-width 16 --from-size 1024 --to-width 8 --to-size 256 --to-prefix output --out-dir ./output
    Stack splitting: 1024 words of 16-bit data automatically creates 4 stacks of 256-word 8-bit RAMs
    Creates files: output.0.0.hex, output.1.0.hex, output.0.1.hex, output.1.1.hex, output.0.2.hex, output.1.2.hex, output.0.3.hex

  %(prog)s --from-hex data.hex --from-width 8 --to-width 1 --to-prefix bits --to-words 64 --out-dir ./bits
    Word splitting: Split an 8-bit hex file into eight 1-bit files with 64 values each
    Creates files: bits.0.0.hex, bits.1.0.hex, bits.2.0.hex, bits.3.0.hex, bits.4.0.hex, bits.5.0.hex, bits.6.0.hex, bits.7.0.hex

  %(prog)s --from-hex data.hex --from-width 16 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output --add-parity
    Word splitting with parity: Split a 16-bit hex file with added parity into three 8-bit hex files (17 bits padded to 24 bits)
    Creates files: output.0.0.hex, output.1.0.hex, output.2.0.hex

  %(prog)s --from-hex data.hex --from-width 18 --from-hex-width 32 --to-width 8 --to-prefix output --to-words 256 --out-dir ./output
    Word splitting: Split an 18-bit value stored in 32-bit hex format, using only the 18 LSBs
    Creates files: output.0.0.hex, output.1.0.hex, output.2.0.hex

  %(prog)s --from-hex promh.mcr.9.hex --from-width 48 --from-hex-width 48 --from-size 454 --to-size 512 --to-width 8 --to-prefix promh9 --out-dir ./rom --reverse --includes-parity
    Word splitting with parity padding: Split a 48-bit microcode file (454 words) with existing parity into six 8-bit files (512 words each), with parity-corrected padding
    Creates files: promh9.0.0.hex, promh9.1.0.hex, promh9.2.0.hex, promh9.3.0.hex, promh9.4.0.hex, promh9.5.0.hex

Output format:
- All files use consistent naming: prefix.N.S.hex (where N is word part, S is stack index starting from 0)
- Even with no stacking, stack index .0 is used for consistency
- All output files are .hex format with one hex byte (two hex digits) per line
- For 2-bit width: each 2-bit value is written as 00, 01, 02, or 03
- For 1-bit width: each 1-bit value is written as 00 or 01
- Parity is integrated into regular output files when --add-parity or --includes-parity is used
        """
    )
    
    parser.add_argument('--from-hex', 
                       required=True,
                       help='Input hex file path')
    parser.add_argument('--from-width', 
                       type=int,
                       required=True,
                       help='Original bit width')
    parser.add_argument('--from-hex-width', 
                       type=int,
                       required=True,
                       help='Bit width of hex data in input file (must be multiple of 8)')
    parser.add_argument('--to-width', 
                       type=int,
                       required=True,
                       choices=[1, 2, 8],
                       help='Target bit width: 1, 2, or 8')
    parser.add_argument('--to-prefix', 
                       required=True,
                       help='Prefix for output files')
    parser.add_argument('--out-dir', 
                       required=True,
                       help='Output directory for generated hex files')
    parser.add_argument('--reverse', 
                       action='store_true',
                       help='Reverse the order of entries in each output file')
    parser.add_argument('--add-parity', 
                       action='store_true',
                       help='Calculate odd parity for each word and output it to a separate file')
    parser.add_argument('--includes-parity', 
                       action='store_true',
                       help='Input data includes parity bits - calculate parity for padding areas')
    parser.add_argument('--from-size', 
                       type=int,
                       required=True,
                       help='Total capacity of input data in words')
    parser.add_argument('--to-size', 
                       type=int,
                       required=True,
                       help='Total capacity of each output hex file in words')
    
    args = parser.parse_args()
    

    
    split_hex(getattr(args, 'from_hex'), getattr(args, 'from_width'), getattr(args, 'to_width'), 
              getattr(args, 'to_prefix'), args.out_dir, args.reverse, args.add_parity, 
              getattr(args, 'from_hex_width'), getattr(args, 'from_size'), getattr(args, 'to_size'), args.includes_parity)


if __name__ == "__main__":
    main() 