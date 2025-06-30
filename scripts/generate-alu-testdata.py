#!/usr/bin/env python3

"""
This script generates test vectors for the CADR ALU or SN74181.
"""

import argparse
import sys


def generate_inputs(width):
    """Generate input test patterns for the given width."""
    if width == 4:
        values = [0x0, 0xF, 0xA, 0x5]
    elif width == 8:
        values = [0x00, 0xFF, 0xA5, 0x5A]
    elif width == 16:
        values = [0x0000, 0xFFFF, 0xA5A5, 0x5A5A]
    elif width == 32:
        values = [0x00000000, 0xFFFFFFFF, 0xA5A5A5A5, 0x5A5A5A5A]
    else:
        raise ValueError(f"Unsupported width: {width}")
    
    return values

def get_logical_ops(mask):
    """
    Logical operations for different ALU widths.
    
    Note: We need to mask bitwise operations because Python's ~ and -1 operators
    work on full integers (all 32/64 bits), but we need to constrain results to
    the ALU width. For example:
    - ~0 in Python gives -1 (0xFFFFFFFF), but for 4-bit ALU we want 0xF
    - -1 in Python gives -1 (0xFFFFFFFF), but for 4-bit ALU we want 0xF
    Without masking, carry calculations would be incorrect.
    """
    return {
        '0000': ('~A', lambda a, b: (~a) & mask),
        '0001': ('A_NOR_B', lambda a, b: (~(a | b)) & mask),
        '0010': ('~A_AND_B', lambda a, b: ((~a) & mask) & b),
        '0011': ('ZERO', lambda a, b: 0),
        '0100': ('A_NAND_B', lambda a, b: (~(a & b)) & mask),
        '0101': ('~B', lambda a, b: (~b) & mask),
        '0110': ('A_XOR_B', lambda a, b: a ^ b),
        '0111': ('A_AND_~B', lambda a, b: a & ((~b) & mask)),
        '1000': ('~A_OR_B', lambda a, b: ((~a) & mask) | b),
        '1001': ('A_XNOR_B', lambda a, b: (~(a ^ b)) & mask),
        '1010': ('B', lambda a, b: b),
        '1011': ('A_AND_B', lambda a, b: a & b),
        '1100': ('ONE', lambda a, b: (-1) & mask),
        '1101': ('A_OR_~B', lambda a, b: a | ((~b) & mask)),
        '1110': ('A_OR_B', lambda a, b: a | b),
        '1111': ('A', lambda a, b: a)
    }


def get_arith_ops_no_carry(mask):
    """
    Arithmetic operations without carry for different ALU widths.
    
    Note: We need to mask bitwise NOT operations (~b) because Python's ~ operator
    works on full integers, but we need to constrain operands to the ALU width.
    The final result masking is handled by format_result().
    """
    return {
        '0000': ('A', lambda a, b: a),
        '0001': ('A_OR_B', lambda a, b: (a | b)),
        '0010': ('A_OR_~B', lambda a, b: (a | (~b & mask))),
        '0011': ('MINUS_ONE', lambda a, b: (-1) & mask),
        '0100': ('A_PLUS_A_AND_~B', lambda a, b: a + (a & (~b & mask))),
        '0101': ('A_OR_B_PLUS_A_AND_~B', lambda a, b: (a | b) + (a & (~b & mask))),
        '0110': ('A_MINUS_B_MINUS_1', lambda a, b: a - b - 1),
        '0111': ('A_AND_~B_MINUS_1', lambda a, b: (a & (~b & mask)) - 1),
        '1000': ('A_PLUS_A_AND_B', lambda a, b: a + (a & b)),
        '1001': ('A_PLUS_B', lambda a, b: a + b),
        '1010': ('A_OR_~B_PLUS_A_AND_B', lambda a, b: (a | (~b & mask)) + (a & b)),
        '1011': ('A_AND_B_MINUS_1', lambda a, b: (a & b) - 1),
        '1100': ('A_PLUS_A', lambda a, b: a + a),
        '1101': ('A_OR_B_PLUS_A', lambda a, b: (a | b) + a),
        '1110': ('A_OR_~B_PLUS_A', lambda a, b: (a | (~b & mask)) + a),
        '1111': ('A_MINUS_1', lambda a, b: a - 1)
    }


def get_arith_ops_with_carry(mask):
    """
    Arithmetic operations with carry for different ALU widths.
    
    Note: We need to mask bitwise NOT operations (~b) because Python's ~ operator
    works on full integers, but we need to constrain operands to the ALU width.
    The final result masking is handled by format_result().
    """
    return {
        '0000': ('A_PLUS_1', lambda a, b: a + 1),
        '0001': ('A_OR_B_PLUS_1', lambda a, b: (a | b) + 1),
        '0010': ('A_OR_~B_PLUS_1', lambda a, b: (a | (~b & mask)) + 1),
        '0011': ('ZERO', lambda a, b: 0),
        '0100': ('A_PLUS_A_AND_~B_PLUS_1', lambda a, b: a + (a & (~b & mask)) + 1),
        '0101': ('A_OR_B_PLUS_A_AND_~B_PLUS_1', lambda a, b: (a | b) + (a & (~b & mask)) + 1),
        '0110': ('A_MINUS_B', lambda a, b: a - b),
        '0111': ('A_AND_~B', lambda a, b: a & (~b & mask)),
        '1000': ('A_PLUS_A_AND_B_PLUS_1', lambda a, b: a + (a & b) + 1),
        '1001': ('A_PLUS_B_PLUS_1', lambda a, b: a + b + 1),
        '1010': ('A_OR_~B_PLUS_A_AND_B_PLUS_1', lambda a, b: (a | (~b & mask)) + (a & b) + 1),
        '1011': ('A_AND_B', lambda a, b: a & b),
        '1100': ('A_PLUS_A_PLUS_1', lambda a, b: a + a + 1),
        '1101': ('A_OR_B_PLUS_A_PLUS_1', lambda a, b: (a | b) + a + 1),
        '1110': ('A_OR_~B_PLUS_A_PLUS_1', lambda a, b: (a | (~b & mask)) + a + 1),
        '1111': ('A', lambda a, b: a)
    }


def generate_tests(inputs, width):
    """Generates and prints test cases for ALUs of different widths."""
    # Calculate mask based on width
    mask = (1 << width) - 1
    
    # Logic mode
    mode = '1'
    logical_ops_dict = get_logical_ops(mask)
    for cin_logical in [1, 0]:  # Logical carry-in value
        cnb_signal = 1 - cin_logical  # Convert to active-low CNb signal
        for sel in sorted(logical_ops_dict.keys()):
            for a_val in inputs:
                for b_val in inputs:
                    name, op = logical_ops_dict[sel]
                    full_res = op(a_val, b_val)
                    # Mask result to width and convert directly to binary
                    masked_result = full_res & mask
                    expected_carry = 0  # Always 0, not checked in testbenches
                    # Convert everything to binary and concatenate
                    a_bin_width = f'{a_val:0{width}b}'
                    b_bin_width = f'{b_val:0{width}b}'
                    mode_bin = '1' if mode == '1' else '0'
                    cnb_bin = f'{cnb_signal:01b}'
                    expected_result_bin = f'{masked_result:0{width}b}'
                    expected_carry_bin = f'{expected_carry:01b}'
                    print(f'{a_bin_width}{b_bin_width}{mode_bin}{sel}{cnb_bin}{expected_result_bin}{expected_carry_bin}')

    # Arithmetic mode
    mode = '0'
    for cin_logical in [1, 0]:  # Logical carry-in value
        cnb_signal = 1 - cin_logical  # Convert to active-low CNb signal
        arith_ops_dict = get_arith_ops_with_carry(mask) if cin_logical == 1 else get_arith_ops_no_carry(mask)
        for sel in sorted(arith_ops_dict.keys()):
            for a_val in inputs:
                for b_val in inputs:
                    name, op = arith_ops_dict[sel]
                    full_res = op(a_val, b_val)
                    # Mask result to width and convert directly to binary
                    masked_result = full_res & mask
                    expected_carry = 0  # Always 0, not checked in testbenches
                    # Convert everything to binary and concatenate
                    a_bin_width = f'{a_val:0{width}b}'
                    b_bin_width = f'{b_val:0{width}b}'
                    mode_bin = '1' if mode == '1' else '0'
                    cnb_bin = f'{cnb_signal:01b}'
                    expected_result_bin = f'{masked_result:0{width}b}'
                    expected_carry_bin = f'{expected_carry:01b}'
                    print(f'{a_bin_width}{b_bin_width}{mode_bin}{sel}{cnb_bin}{expected_result_bin}{expected_carry_bin}')


def main():
    """Main function to parse arguments and generate test cases."""
    parser = argparse.ArgumentParser(description="Generate ALU test vectors.")
    parser.add_argument('--width', type=int, choices=[4, 8, 16, 32], required=True, help='ALU width (4 for SN74181, 8 for 8-bit ALU, 16 for 16-bit ALU, 32 for CADR ALU)')
    args = parser.parse_args()

    inputs = generate_inputs(args.width)
    generate_tests(inputs, args.width)


if __name__ == "__main__":
    main() 