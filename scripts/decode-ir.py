#!/usr/bin/env python3
"""
CADR Microprocessor Instruction Decoder

This script decodes 48-bit CADR microprocessor instructions according to the
format documented at https://tumbleweed.nu/r/lm-3/uv/cadr.html

Usage: python decode-ir.py <instruction>

Where <instruction> is a 48-bit value in octal format (default) or hexadecimal.
- Octal (default): up to 16 octal digits
- Hexadecimal: prefixed with 0x, followed by up to 12 hex digits
"""

import sys
import argparse

class CADRDecoder:
    """CADR instruction decoder"""
    
    # Instruction types based on opcode bits 44-43
    OPCODES = {
        0: "ALU",
        1: "JUMP", 
        2: "DISPATCH",
        3: "BYTE"
    }
    
    # ALU operations (IR<7-3> when IR<8>=0)
    ALU_OPS = {
        0x00: "SETZ",    # ZEROS
        0x01: "AND",     # M&A
        0x02: "ANDCA",   # M&~A
        0x03: "SETM",    # M
        0x04: "ANDCM",   # ~M&A
        0x05: "SETA",    # A
        0x06: "XOR",     # M^A
        0x07: "IOR",     # M|A
        0x08: "ANDCB",   # ~A&~M
        0x09: "EQV",     # M=A
        0x0A: "SETCA",   # ~A
        0x0B: "ORCA",    # M|~A
        0x0C: "SETCM",   # ~M
        0x0D: "ORCM",    # ~M|A
        0x0E: "ORCB",    # ~M|~A
        0x0F: "SETO",    # ONES
        # Arithmetic operations
        0x10: "SUB",     # M-A-1 (carry=1) or M-A (carry=0)
        0x11: "ADD",     # M+A (carry=0) or M+A+1 (carry=1)
        0x12: "M+1",     # M+1 (carry=0) or M (carry=1)
        0x13: "M+M",     # M+M (carry=0) or M+M+1 (carry=1)
        0x14: "M-A-1",   # M-A-1
        0x15: "M+A+1",   # M+A+1
        0x16: "M+1",     # M+1
        0x17: "M+M+1",   # M+M+1
    }
    
    # Conditional ALU operations (IR<7-3> when IR<8>=1)
    CONDITIONAL_ALU_OPS = {
        0x00: "MULTIPLY-STEP",
        0x01: "DIVIDE-STEP", 
        0x05: "REMAINDER-CORRECTION",
        0x0B: "INITIAL-DIVIDE-STEP"
    }
    
    # Output bus control (IR<13-12>)
    OUTPUT_BUS_CTRL = {
        0: "BYTE-EXTRACTOR",    # Illegal for ALU
        1: "ALU-OUTPUT",
        2: "ALU-RIGHT-SHIFT-1", 
        3: "ALU-LEFT-SHIFT-1"
    }
    
    # Q control (IR<1-0>)
    Q_CONTROL = {
        0: "NO-OP",
        1: "SHIFT-LEFT",  # Shift in ~ALU<31>
        2: "SHIFT-RIGHT", # Shift in ALU<0>
        3: "LOAD-Q"       # Load from ALU
    }
    
    # Jump conditions (IR<4-0> when IR<5>=1)
    JUMP_CONDITIONS = {
        0: "LOW-BIT-SHIFTER",  # Illegal
        1: "M<A",
        2: "M<=A", 
        3: "M=A",
        4: "PAGE-FAULT",
        5: "PAGE-FAULT-OR-INTERRUPT",
        6: "PAGE-FAULT-OR-INTERRUPT-OR-SEQUENCE-BREAK",
        7: "ALWAYS-TRUE"
    }
    
    # Miscellaneous functions (IR<11-10>)
    MISC_FUNCTIONS = {
        0: "NORMAL",
        1: "NOT-USED",
        2: "WRITE-DISPATCH-MEMORY",
        3: "ENABLE-LC-MODIFICATION"
    }
    
    # M source functional sources (IR<30-26> when IR<31>=1)
    M_FUNCTIONAL_SOURCES = {
        0x00: "DISPATCH-CONSTANT",
        0x01: "SPC-POINTER-AND-DATA",
        0x02: "PDL-POINTER",
        0x03: "PDL-INDEX",
        0x05: "PDL-BUFFER-INDEXED",
        0x06: "OPC-REGISTERS",
        0x07: "Q-REGISTER",
        0x0A: "VMA-REGISTER",
        0x0B: "MEMORY-MAP-DATA",
        0x0C: "MD-REGISTER",
        0x0D: "LC-LOCATION-COUNTER",
        0x0E: "SPC-POINTER-AND-DATA-POP",
        0x18: "PDL-BUFFER-POINTER-POP",
        0x19: "PDL-BUFFER-POINTER"
    }
    
    # Functional destinations (IR<23-19> when IR<25>=0)
    FUNCTIONAL_DESTINATIONS = {
        0x00: "NONE",
        0x01: "LC-LOCATION-COUNTER",
        0x02: "INTERRUPT-CONTROL",
        0x03: "IMOD-ENABLE",  # Based on source decode logic
        0x04: "UNUSED-04",
        0x05: "UNUSED-05",
        0x06: "UNUSED-06",
        0x07: "UNUSED-07",
        0x08: "UNUSED-08",
        0x09: "UNUSED-09",
        0x0A: "PDL-POINTER-ADDRESSED",
        0x0B: "PDL-POINTER-ADDRESSED-PUSH",
        0x0C: "PDL-INDEX-ADDRESSED",
        0x0D: "PDL-INDEX",
        0x0E: "PDL-POINTER",
        0x0F: "SPC-DATA-PUSH",
        0x10: "OA-REGISTER-LOW",
        0x11: "OA-REGISTER-HIGH",
        0x12: "VMA-REGISTER-LOW",
        0x13: "VMA-REGISTER-HIGH", 
        0x14: "VMA-REGISTER",
        0x15: "VMA-START-READ",
        0x16: "VMA-START-WRITE",
        0x17: "VMA-WRITE-MAP",
        0x18: "MD-REGISTER-LOW",
        0x19: "MD-REGISTER-HIGH",
        0x1A: "UNUSED-1A",
        0x1B: "UNUSED-1B",
        0x1C: "UNUSED-1C",
        0x1D: "UNUSED-1D",
        0x1E: "MD-REGISTER",
        0x1F: "MD-START-READ",
        # Note: Higher values possible with 5-bit field
        0x20: "MD-START-WRITE",
        0x21: "MD-WRITE-MAP"
    }

    def __init__(self):
        self.number_format = 'octal'
    
    def format_number(self, value, width=0):
        """Format a number according to the current format setting"""
        if self.number_format == 'hex':
            if width > 0:
                return f"{value:0{width}X}"
            else:
                return f"{value:X}"
        else:  # octal (default)
            if width > 0:
                return f"{value:0{width}o}"
            else:
                return f"{value:o}"
    
    def format_line(self, ir_range, value, field_name, field_description):
        """Format a line with aligned equal signs"""
        # Pad IR range to 11 characters, value to 8 characters for alignment
        ir_part = f"{ir_range:<11}"
        value_part = f"{value:<8}"
        return f"{ir_part} = {value_part} = {field_name} = {field_description}"
    
    def parse_instruction(self, inst_value):
        """Parse a 48-bit instruction into its constituent fields"""
        fields = {}
        
        # Common fields for all instructions
        fields['parity'] = (inst_value >> 48) & 1
        fields['unused'] = (inst_value >> 47) & 1
        fields['statistics'] = (inst_value >> 46) & 1
        fields['ilong'] = (inst_value >> 45) & 1
        fields['opcode'] = (inst_value >> 43) & 3
        fields['popj'] = (inst_value >> 42) & 1
        fields['a_source'] = (inst_value >> 32) & 0x3FF
        fields['m_source'] = (inst_value >> 26) & 0x3F
        fields['misc_func'] = (inst_value >> 10) & 3
        
        # Decode M source
        if (fields['m_source'] >> 5) & 1:  # IR<31> = 1
            fields['m_functional'] = fields['m_source'] & 0x1F
            fields['m_scratchpad'] = None
        else:
            fields['m_functional'] = None
            fields['m_scratchpad'] = fields['m_source'] & 0x1F
        
        return fields
    
    def decode_alu(self, inst_value, fields):
        """Decode ALU instruction"""
        result = []
        
        # Destination field (IR<25-14>)
        dest = (inst_value >> 14) & 0xFFF
        dest_value = self.format_number(dest, 4)
        if (dest >> 11) & 1:  # IR<25> = 1
            # A memory destination
            a_dest = dest & 0x3FF
            dest_desc = f"A-memory[{self.format_number(a_dest, 3)}]"
            result.append(self.format_line("IR<25-14>", dest_value, "Destination", dest_desc))
        else:
            # Functional + M memory destination
            func_dest = (dest >> 5) & 0x1F
            m_dest = dest & 0x1F
            func_name = self.FUNCTIONAL_DESTINATIONS.get(func_dest, f"UNKNOWN-{self.format_number(func_dest, 2)}")
            dest_desc = f"{func_name} + M[{self.format_number(m_dest, 2)}]"
            result.append(self.format_line("IR<25-14>", dest_value, "Destination", dest_desc))
        
        # Output bus control (IR<13-12>)
        out_ctrl = (inst_value >> 12) & 3
        result.append(self.format_line("IR<13-12>", str(out_ctrl), "Output Bus", self.OUTPUT_BUS_CTRL[out_ctrl]))
        
        # Miscellaneous function (IR<11-10>)
        misc_func_name = self.MISC_FUNCTIONS.get(fields['misc_func'], f"UNKNOWN-{fields['misc_func']}")
        result.append(self.format_line("IR<11-10>", str(fields['misc_func']), "Miscellaneous Function", misc_func_name))
        
        # ALU operation (IR<8-3>)
        alu_op_field = (inst_value >> 3) & 0x3F
        conditional = (alu_op_field >> 5) & 1
        op_code = alu_op_field & 0x1F
        
        if conditional:
            operation = self.CONDITIONAL_ALU_OPS.get(op_code, f"UNKNOWN-CONDITIONAL-{self.format_number(op_code, 2)}")
        else:
            operation = self.ALU_OPS.get(op_code, f"UNKNOWN-{self.format_number(op_code, 2)}")
        
        alu_value = self.format_number(alu_op_field, 2)
        result.append(self.format_line("IR<8-3>", alu_value, "ALU Operation", operation))
        
        # Carry (IR<2>)
        carry = (inst_value >> 2) & 1
        result.append(self.format_line("IR<2>", str(carry), "Carry", str(carry)))
        
        # Q control (IR<1-0>)
        q_ctrl = inst_value & 3
        result.append(self.format_line("IR<1-0>", str(q_ctrl), "Q Control", self.Q_CONTROL[q_ctrl]))
        
        return result
    
    def decode_jump(self, inst_value, fields):
        """Decode JUMP instruction"""
        result = []
        
        # New PC (IR<25-12>)
        new_pc = (inst_value >> 12) & 0x3FFF
        pc_value = self.format_number(new_pc, 5)
        result.append(self.format_line("IR<25-12>", pc_value, "New PC", pc_value))
        
        # Miscellaneous function (IR<11-10>)
        misc_func_name = self.MISC_FUNCTIONS.get(fields['misc_func'], f"UNKNOWN-{fields['misc_func']}")
        result.append(self.format_line("IR<11-10>", str(fields['misc_func']), "Miscellaneous Function", misc_func_name))
        
        # Control bits
        r_bit = (inst_value >> 9) & 1
        p_bit = (inst_value >> 8) & 1
        n_bit = (inst_value >> 7) & 1
        invert = (inst_value >> 6) & 1
        bit_test = (inst_value >> 5) & 1
        
        # Transfer type (IR<9-8>)
        if p_bit and r_bit:
            transfer_type = "I-MEM-WRITE"
        elif p_bit:
            transfer_type = "CALL"
        elif r_bit:
            transfer_type = "RETURN"
        else:
            transfer_type = "BRANCH"
        
        result.append(self.format_line("IR<9>,<8>", f"{r_bit},{p_bit}", "R,P Transfer Type", transfer_type))
        
        # N bit (IR<7>)
        result.append(self.format_line("IR<7>", str(n_bit), "N (Inhibit Next)", str(n_bit)))
        
        # Invert condition (IR<6>)
        result.append(self.format_line("IR<6>", str(invert), "Invert Condition", str(invert)))
        
        # Condition test type (IR<5>)
        test_desc = "Condition Test" if bit_test else "Bit Test"
        result.append(self.format_line("IR<5>", str(bit_test), "Test Type", test_desc))
        
        # Jump condition or bit number (IR<4-0>)
        condition_field = inst_value & 0x1F
        cond_value = self.format_number(condition_field, 2)
        if bit_test:  # IR<5> = 1: condition number
            condition = self.JUMP_CONDITIONS.get(condition_field, f"UNKNOWN-{self.format_number(condition_field, 2)}")
            result.append(self.format_line("IR<4-0>", cond_value, "Jump Condition", condition))
        else:  # IR<5> = 0: left rotation count
            tested_bit = (32 - condition_field) % 32
            bit_desc = f"Test bit {tested_bit} of M source (left rotate by {condition_field})"
            result.append(self.format_line("IR<4-0>", cond_value, "Bit Test", bit_desc))
        
        return result
    
    def decode_dispatch(self, inst_value, fields):
        """Decode DISPATCH instruction"""
        result = []
        
        # Flags (IR<25-24>)
        alter_return = (inst_value >> 25) & 1
        enable_istream = (inst_value >> 24) & 1
        
        alter_desc = "Yes" if alter_return else "No"
        result.append(self.format_line("IR<25>", str(alter_return), "Alter Return", alter_desc))
        
        istream_desc = "Yes" if enable_istream else "No"
        result.append(self.format_line("IR<24>", str(enable_istream), "Enable Instruction Stream", istream_desc))
        
        # Dispatch address (IR<22-12>)
        dispatch_addr = (inst_value >> 12) & 0x7FF
        addr_value = self.format_number(dispatch_addr, 4)
        result.append(self.format_line("IR<22-12>", addr_value, "Dispatch Address", addr_value))
        
        # Miscellaneous function (IR<11-10>)
        misc_func_name = self.MISC_FUNCTIONS.get(fields['misc_func'], f"UNKNOWN-{fields['misc_func']}")
        result.append(self.format_line("IR<11-10>", str(fields['misc_func']), "Miscellaneous Function", misc_func_name))
        
        # Map control (IR<9-8>)
        map_ctrl = (inst_value >> 8) & 3
        result.append(self.format_line("IR<9-8>", str(map_ctrl), "Map Control", str(map_ctrl)))
        
        # Length and rotation (IR<7-5> and IR<4-0>)
        length = (inst_value >> 5) & 7
        rotation = inst_value & 0x1F
        result.append(self.format_line("IR<7-5>", str(length), "Byte Length", str(length)))
        
        rot_value = self.format_number(rotation, 2)
        result.append(self.format_line("IR<4-0>", rot_value, "Rotation Count", rot_value))
        
        return result
    
    def decode_byte(self, inst_value, fields):
        """Decode BYTE instruction"""
        result = []
        
        # Destination field (IR<25-14>) - same as ALU
        dest = (inst_value >> 14) & 0xFFF
        dest_value = self.format_number(dest, 4)
        if (dest >> 11) & 1:  # IR<25> = 1
            # A memory destination
            a_dest = dest & 0x3FF
            dest_desc = f"A-memory[{self.format_number(a_dest, 3)}]"
            result.append(self.format_line("IR<25-14>", dest_value, "Destination", dest_desc))
        else:
            # Functional + M memory destination
            func_dest = (dest >> 5) & 0x1F
            m_dest = dest & 0x1F
            func_name = self.FUNCTIONAL_DESTINATIONS.get(func_dest, f"UNKNOWN-{self.format_number(func_dest, 2)}")
            dest_desc = f"{func_name} + M[{self.format_number(m_dest, 2)}]"
            result.append(self.format_line("IR<25-14>", dest_value, "Destination", dest_desc))
        
        # Byte operation control (IR<13-12>)
        mr_bit = (inst_value >> 13) & 1  # Mask Rotate
        sr_bit = (inst_value >> 12) & 1  # Source Rotate
        
        # Determine operation type
        if mr_bit == 0 and sr_bit == 0:
            operation = "NOT-USEFUL"
        elif mr_bit == 0 and sr_bit == 1:
            operation = "LOAD-BYTE"
        elif mr_bit == 1 and sr_bit == 0:
            operation = "SELECTIVE-DEPOSIT"
        else:  # mr_bit == 1 and sr_bit == 1
            operation = "DEPOSIT-BYTE"
        
        # If MR,SR is not 00, calculate and show the final mask
        if mr_bit != 0 or sr_bit != 0:
            # Get length and rotation for mask calculation
            length_minus_1 = (inst_value >> 5) & 0x1F
            rotation = inst_value & 0x1F
            byte_length = length_minus_1 + 1
            
            # Calculate the mask: (2^byte_length - 1) rotated left by rotation positions
            base_mask = (1 << byte_length) - 1
            final_mask = ((base_mask << rotation) | (base_mask >> (32 - rotation))) & 0xFFFFFFFF
            
            # Format mask in both octal and hex
            if self.number_format == 'hex':
                mask_str = f"{final_mask:08X} ({final_mask:011o})"
            else:
                mask_str = f"{final_mask:011o} (0x{final_mask:08X})"
            
            operation_with_mask = f"{operation}, mask={mask_str}"
        else:
            operation_with_mask = operation
        
        result.append(self.format_line("IR<13>,<12>", f"{mr_bit},{sr_bit}", "MR,SR Byte Operation", operation_with_mask))
        
        # Miscellaneous function (IR<11-10>)
        misc_func_name = self.MISC_FUNCTIONS.get(fields['misc_func'], f"UNKNOWN-{fields['misc_func']}")
        result.append(self.format_line("IR<11-10>", str(fields['misc_func']), "Miscellaneous Function", misc_func_name))
        
        # Length and rotation (IR<9-5> and IR<4-0>)
        length_minus_1 = (inst_value >> 5) & 0x1F
        rotation = inst_value & 0x1F
        
        len_value = self.format_number(length_minus_1, 2)
        result.append(self.format_line("IR<9-5>", len_value, "Byte Length - 1", str(length_minus_1)))
        
        rot_value = self.format_number(rotation, 2)
        result.append(self.format_line("IR<4-0>", rot_value, "Rotation Count", rot_value))
        
        return result
    
    def decode_sources(self, fields):
        """Decode source specifications"""
        result = []
        
        # A source
        a_value = self.format_number(fields['a_source'], 4)
        a_desc = f"A[{self.format_number(fields['a_source'], 4)}]"
        result.append(self.format_line("IR<41-32>", a_value, "A Source", a_desc))
        
        # M source
        m_value = self.format_number(fields['m_source'], 2)
        if fields['m_functional'] is not None:
            source_name = self.M_FUNCTIONAL_SOURCES.get(fields['m_functional'], f"UNKNOWN-{self.format_number(fields['m_functional'], 2)}")
            result.append(self.format_line("IR<31-26>", m_value, "M Source", source_name))
        else:
            m_desc = f"M[{self.format_number(fields['m_scratchpad'], 2)}]"
            result.append(self.format_line("IR<31-26>", m_value, "M Source", m_desc))
        
        return result
    
    def decode_common_fields(self, fields):
        """Decode common fields present in all instructions"""
        result = []
        
        # Parity (highest bit)
        result.append(self.format_line("IR<48>", str(fields['parity']), "Parity", "Odd"))
        
        # Statistics bit
        stats_desc = "Enabled" if fields['statistics'] else "Disabled"
        result.append(self.format_line("IR<46>", str(fields['statistics']), "Statistics", stats_desc))
        
        # Slow clock
        ilong_desc = "Slow clock" if fields['ilong'] else "Normal clock"
        result.append(self.format_line("IR<45>", str(fields['ilong']), "ILONG", ilong_desc))
        
        # Opcode
        opcode_name = self.OPCODES.get(fields['opcode'], f"UNKNOWN-{fields['opcode']}")
        result.append(self.format_line("IR<44-43>", str(fields['opcode']), "Opcode", opcode_name))
        
        # POPJ
        popj_desc = "Return after next" if fields['popj'] else "Normal"
        result.append(self.format_line("IR<42>", str(fields['popj']), "POPJ", popj_desc))
        
        return result
    
    def decode(self, inst_str, number_format='octal'):
        """Main decode function"""
        self.number_format = number_format
        
        try:
            # Determine format and convert to integer
            if inst_str.startswith('0x') or inst_str.startswith('0X'):
                # Hexadecimal format
                inst_value = int(inst_str, 16)
            else:
                # Default to octal format
                inst_value = int(inst_str, 8)
            
            # Ensure it's a 48-bit value
            if inst_value >= (1 << 48):
                raise ValueError("Instruction value too large for 48 bits")
            
        except ValueError as e:
            return [f"Error: Invalid instruction format - {e}"]
        
        # Parse common fields
        fields = self.parse_instruction(inst_value)
        
        result = []
        
        # Decode all fields in bit order (highest to lowest)
        result.extend(self.decode_common_fields(fields))
        result.extend(self.decode_sources(fields))
        
        # Decode based on instruction type
        opcode = fields['opcode']
        inst_type = self.OPCODES.get(opcode, f"UNKNOWN-{opcode}")
        
        if opcode == 0:  # ALU
            result.extend(self.decode_alu(inst_value, fields))
        elif opcode == 1:  # JUMP
            result.extend(self.decode_jump(inst_value, fields))
        elif opcode == 2:  # DISPATCH
            result.extend(self.decode_dispatch(inst_value, fields))
        elif opcode == 3:  # BYTE
            result.extend(self.decode_byte(inst_value, fields))
        else:
            result.append(f"Unknown instruction type: {opcode}")
            return result
        
        return result

def main():
    parser = argparse.ArgumentParser(description='Decode CADR microprocessor instructions', add_help=False)
    parser.add_argument('instruction', help='48-bit instruction in octal (default) or hex (0x prefix)')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    parser.add_argument('--help', action='help', help='Show this help message and exit')
    
    # Number format options
    parser.add_argument('-x', action='store_true', help='Display numbers in hexadecimal format')
    
    args = parser.parse_args()
    
    # Determine number format
    if args.x:
        number_format = 'hex'
    else:
        number_format = 'octal'
    
    decoder = CADRDecoder()
    result = decoder.decode(args.instruction, number_format)
    
    for line in result:
        print(line)

if __name__ == "__main__":
    main() 