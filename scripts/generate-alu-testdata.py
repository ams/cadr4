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


def sn74182_xy_function(pb_inputs, gb_inputs):
    """
    Calculate X and Y outputs for SN74182 carry lookahead generator.
    
    PBo (overall propagate) = PB[0] | PB[1] | PB[2] | PB[3]
    GBo (overall generate) = PB3GB3 | PB2GB23 | PB1GB123 | GB0123
    
    Args:
        pb_inputs: List of PB inputs (X outputs from individual ALUs)
        gb_inputs: List of GB inputs (Y outputs from individual ALUs)
    
    Returns:
        (PBo, GBo) tuple
    """
    # Pad inputs to 4 elements with 1s for PB and 0s for GB (inactive values)
    pb = pb_inputs + [1] * (4 - len(pb_inputs))
    gb = gb_inputs + [0] * (4 - len(gb_inputs))
    
    # Calculate intermediate terms
    PB3GB3 = pb[3] & gb[3]
    PB2GB23 = pb[2] & gb[2] & gb[3]
    PB1GB123 = pb[1] & gb[1] & gb[2] & gb[3]
    GB0123 = gb[0] & gb[1] & gb[2] & gb[3]
    
    # Calculate outputs
    PBo = pb[0] | pb[1] | pb[2] | pb[3]
    GBo = PB3GB3 | PB2GB23 | PB1GB123 | GB0123
    
    return PBo, GBo


def sn74181_xy_function(a_val, b_val, sel_bits, mask):
    """
    Calculate X and Y outputs for SN74181 based on the internal logic.
    
    X (carry propagate) = ~(E[0] & E[1] & E[2] & E[3])
    Y (carry generate) = ~(Pb3 | Pb2Gb3 | Pb1Gb23 | Pb0Gb123)
    
    Where:
    E[i] = ~((A[i] & B[i] & S[3]) | (A[i] & ~B[i] & S[2]))
    D[i] = ~(~B[i] & S[1] | B[i] & S[0] | A[i])
    """
    # Extract individual select bits
    s0 = int(sel_bits[3])  # LSB
    s1 = int(sel_bits[2])
    s2 = int(sel_bits[1])  
    s3 = int(sel_bits[0])  # MSB
    
    # Calculate E and D (Pb) bit by bit
    E = [0] * 4
    D = [0] * 4
    
    for i in range(4):
        a_bit = (a_val >> i) & 1
        b_bit = (b_val >> i) & 1
        bb_bit = 1 - b_bit  # ~B[i]
        
        # E[i] = ~((A[i] & B[i] & S[3]) | (A[i] & ~B[i] & S[2]))
        E[i] = 1 - ((a_bit & b_bit & s3) | (a_bit & bb_bit & s2))
        
        # D[i] = ~(~B[i] & S[1] | B[i] & S[0] | A[i])
        D[i] = 1 - ((bb_bit & s1) | (b_bit & s0) | a_bit)
    
    # Calculate X = ~(E[0] & E[1] & E[2] & E[3])
    X = 1 - (E[0] & E[1] & E[2] & E[3])
    
    # Calculate Y = ~(Pb3 | Pb2Gb3 | Pb1Gb23 | Pb0Gb123)
    # Where Pb = D, Gb = E
    Pb3 = D[3]
    Pb2Gb3 = D[2] & E[3]
    Pb1Gb23 = D[1] & E[2] & E[3]
    Pb0Gb123 = D[0] & E[1] & E[2] & E[3]
    
    Y = 1 - (Pb3 | Pb2Gb3 | Pb1Gb23 | Pb0Gb123)
    
    return X, Y


def sn74181_carry(a_val, b_val, sel_bits, cin_logical, width):
    """
    Carry out of the '181 (or of a chain of '181s and '182s) in the
    active-high data convention of the datasheet (Figure 2 / Table 2).

    Internally the '181 forms two operands from A, B and S,
        P = A | (B & S0) | (~B & S1)      ("propagate" operand)
        G = A & ((B & S3) | (~B & S2))    ("generate" operand, bitwise a subset of P)
    and in arithmetic mode (M = L) produces F = P PLUS G PLUS Cn, with Cn the
    active-high carry in. Its look-ahead chain C[i+1] = P[i] & (G[i] | C[i]) is
    exactly the carry of that addition (G is a subset of P), so the active-high
    carry out Cn+4 is bit `width` of P + G + Cn. Wider ALUs built from '181s
    and '182s compute the same carry over the full width.

    The carry output comes from the look-ahead network regardless of M, so the
    same expression gives Cn+4 in logic mode (M = H) as well.

    Pin polarities (datasheet page 2, active-high data): the carry-in pin is
    /Cn (low = carry in) and the carry-out pin is /Cn+4 (low = carry out).
    `cin_logical` is the active-high carry in (1 = carry, pin /Cn = 0); the
    returned carry is active-high (1 = carry out, pin /Cn+4 = 0) and the caller
    inverts it to get the /Cn+4 pin level written to the vector file.

    Datasheet cross-check (page 2 comparison table, active-high data): with
    S = LHHL (A MINUS B MINUS 1 for /Cn = H, A MINUS B for /Cn = L) this gives
    /Cn+4 = L exactly when A > B (/Cn = H) or A >= B (/Cn = L); see
    check_table2_comparison().

    Returns (carry_out, f) where f = (P + G + Cn) mod 2**width is the
    arithmetic-mode result (used as a self-check against the operation tables).
    """
    mask = (1 << width) - 1
    s0 = int(sel_bits[3])  # LSB
    s1 = int(sel_bits[2])
    s2 = int(sel_bits[1])
    s3 = int(sel_bits[0])  # MSB
    nb = (~b_val) & mask
    p = a_val | (b_val if s0 else 0) | (nb if s1 else 0)
    g = a_val & ((b_val if s3 else 0) | (nb if s2 else 0))
    total = p + g + cin_logical
    return (total >> width) & 1, total & mask


def check_table2_comparison():
    """Cross-check sn74181_carry against the A/B comparison table (datasheet page 2)."""
    for a in range(16):
        for b in range(16):
            cout_nc, _ = sn74181_carry(a, b, '0110', 0, 4)  # /Cn = H: A MINUS B MINUS 1
            cout_c, _ = sn74181_carry(a, b, '0110', 1, 4)   # /Cn = L: A MINUS B
            assert cout_nc == (1 if a > b else 0), (a, b)   # /Cn+4 = L  <=>  A > B
            assert cout_c == (1 if a >= b else 0), (a, b)   # /Cn+4 = L  <=>  A >= B


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
                    expected_result = full_res & mask
                    # The carry output is not gated by M: same look-ahead expression as in arithmetic mode
                    expected_carry, _ = sn74181_carry(a_val, b_val, sel, cin_logical, width)
                    # Calculate X and Y outputs
                    if width == 4:
                        expected_x, expected_y = sn74181_xy_function(a_val, b_val, sel, mask)
                    elif width in [8, 16, 32]:
                        # For cascaded ALUs, calculate X and Y from individual 4-bit ALUs
                        pb_inputs = []
                        gb_inputs = []
                        
                        # Split into 4-bit chunks and calculate X,Y for each
                        for i in range(0, width, 4):
                            a_chunk = (a_val >> i) & 0xF
                            b_chunk = (b_val >> i) & 0xF
                            x_chunk, y_chunk = sn74181_xy_function(a_chunk, b_chunk, sel, 0xF)
                            pb_inputs.append(x_chunk)
                            gb_inputs.append(y_chunk)
                        
                        # Calculate overall X and Y using SN74182 logic
                        expected_x, expected_y = sn74182_xy_function(pb_inputs, gb_inputs)
                    else:
                        expected_x, expected_y = 0, 0
                    
                    # carry output CN4b is active-low
                    expected_carry_cnb4_signal = 1 - expected_carry
                    # Convert everything to binary and concatenate
                    a_bin_width = f'{a_val:0{width}b}'
                    b_bin_width = f'{b_val:0{width}b}'
                    mode_bin = '1' if mode == '1' else '0'
                    cnb_bin = f'{cnb_signal:01b}'
                    expected_result_bin = f'{expected_result:0{width}b}'
                    expected_carry_bin = f'{expected_carry_cnb4_signal:01b}'
                    expected_x_bin = f'{expected_x:01b}'
                    expected_y_bin = f'{expected_y:01b}'
                    print(f'{a_bin_width} {b_bin_width} {mode_bin} {sel} {cnb_bin} {expected_result_bin} {expected_carry_bin} {expected_x_bin} {expected_y_bin}')

    # Arithmetic mode
    mode = '0'
    for cin_logical in [1, 0]:  # Logical carry-in value
        cnb_signal = 1 - cin_logical  # Convert to active-low CNb signal
        arith_ops_dict = get_arith_ops_with_carry(mask) if cin_logical == 1 else get_arith_ops_no_carry(mask)
        for sel in sorted(arith_ops_dict.keys()):
            for a_val in inputs:
                for b_val in inputs:
                    name, op = arith_ops_dict[sel]
                    
                    # Calculate result
                    full_res = op(a_val, b_val)
                    expected_result = full_res & mask
                    # Carry out of the P + G + Cn addition (active high, inverted below for the /Cn+4 pin)
                    expected_carry, f_check = sn74181_carry(a_val, b_val, sel, cin_logical, width)
                    assert f_check == expected_result, \
                        f'{name}: operation table and P + G + Cn disagree for A={a_val:x} B={b_val:x} S={sel} Cn={cin_logical}'
                    
                    # Calculate X and Y outputs
                    if width == 4:
                        expected_x, expected_y = sn74181_xy_function(a_val, b_val, sel, mask)
                    elif width in [8, 16, 32]:
                        # For cascaded ALUs, calculate X and Y from individual 4-bit ALUs
                        pb_inputs = []
                        gb_inputs = []
                        
                        # Split into 4-bit chunks and calculate X,Y for each
                        for i in range(0, width, 4):
                            a_chunk = (a_val >> i) & 0xF
                            b_chunk = (b_val >> i) & 0xF
                            x_chunk, y_chunk = sn74181_xy_function(a_chunk, b_chunk, sel, 0xF)
                            pb_inputs.append(x_chunk)
                            gb_inputs.append(y_chunk)
                        
                        # Calculate overall X and Y using SN74182 logic
                        expected_x, expected_y = sn74182_xy_function(pb_inputs, gb_inputs)
                    else:
                        expected_x, expected_y = 0, 0
                    
                    # carry output CN4b is active-low
                    expected_carry_cnb4_signal = 1 - expected_carry
                    # Convert everything to binary and concatenate
                    a_bin_width = f'{a_val:0{width}b}'
                    b_bin_width = f'{b_val:0{width}b}'
                    mode_bin = '1' if mode == '1' else '0'
                    cnb_bin = f'{cnb_signal:01b}'
                    expected_result_bin = f'{expected_result:0{width}b}'
                    expected_carry_bin = f'{expected_carry_cnb4_signal:01b}'
                    expected_x_bin = f'{expected_x:01b}'
                    expected_y_bin = f'{expected_y:01b}'
                    print(f'{a_bin_width} {b_bin_width} {mode_bin} {sel} {cnb_bin} {expected_result_bin} {expected_carry_bin} {expected_x_bin} {expected_y_bin}')


def main():
    """Main function to parse arguments and generate test cases."""
    parser = argparse.ArgumentParser(description="Generate ALU test vectors.")
    parser.add_argument('--width', type=int, choices=[4, 8, 16, 32], required=True, help='ALU width (4 for SN74181, 8 for 8-bit ALU, 16 for 16-bit ALU, 32 for CADR ALU)')
    args = parser.parse_args()

    check_table2_comparison()
    inputs = generate_inputs(args.width)
    generate_tests(inputs, args.width)


if __name__ == "__main__":
    main() 