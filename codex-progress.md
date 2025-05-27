# Progress tracking for CADR4 netlist vs VHDL verification

This document tracks pages and components verified against the CADR4.netlist.
Only errors/discrepancies are noted; successful matches are not detailed.

## Page ACTL
- Components checked: actl_3a06, actl_3a12, actl_3a16, actl_3a21, actl_3b15, actl_3b16,\
  actl_3b21, actl_3b26, actl_3b27, actl_3b28, actl_3b29, actl_3b30, actl_4b11,\
  actl_4b14
- No discrepancies found.

## Page ALATCH
- Components checked: alatch_3a01, alatch_3a02, alatch_3a03, alatch_3a04, alatch_3a05, alatch_3b01, alatch_3b02, alatch_3b03, alatch_3b04, alatch_3b05
- No discrepancies found.

## Page ALU0
- Components checked: alu0_2a23, alu0_2a28, alu0_2b23, alu0_2b28
- No discrepancies found.

## Page ALU1
- Components checked: alu1_2a03, alu1_2a04, alu1_2a08, alu1_2a13, alu1_2b08, alu1_2b13
- No discrepancies found.

## Page ALUC4
- Components checked: aluc4_2a16, aluc4_2a17, aluc4_2a18, aluc4_2a19, aluc4_2a20, aluc4_2b16, aluc4_2b17, aluc4_2b18, aluc4_2b20, aluc4_2c10, aluc4_2c11, aluc4_2c15, aluc4_2c20, aluc4_2d15, aluc4_2d21
- No discrepancies found.

## Page AMEM0
- Components checked: amem0_3a07, amem0_3a08, amem0_3a09, amem0_3a10, amem0_3a11, amem0_3a13,
  amem0_3a14, amem0_3a15, amem0_3b06, amem0_3b07, amem0_3b08, amem0_3b09, amem0_3b10,
  amem0_3b11, amem0_3b12, amem0_3b13, amem0_3b14
- No discrepancies found.

## Page AMEM1
- Components missing in VHDL: (netlist parts not found in cadr4_amem1.vhd)
- Extra VHDL instances not in netlist: (none)

## Page APAR
- VHDL instances with no netlist entry: apar_3a28, apar_3a29, apar_3a30,
  apar_4a12, apar_4a14, apar_4a17, apar_4b15

## Page BCPINS
- No components defined in netlist or VHDL for this page.

## Page BCTERM
- VHDL instances with no netlist entry: bcterm_1b15, bcterm_1b20, bcterm_1b25, bcterm_2c25