# cadr/README.md

This folder contains cadr components.

A cadr component implements a CADR schematic page and named
accordingly as cadr_<PAGE>.  The cadr components are grouped into two
packages `cadr_book` and `icmem_book`.

The suds architecture of cadr components are auto-generated from
`doc/ai/cadr/*.drw` files.  The architecture is implemented in
cadr_<PAGE>_suds.vhd files.

# General Info

## Power On Reset

- when VCC applied, -BOOT1 and -BOOT2 are high (thus not asserted) and -POWER RESET is initially (for X ns, see below) asserted. (olord2)

- -POWER RESET assertion is used to assert -CLOCK RESET A and -CLOCK RESET B. (olord2)

- -CLOCK RESET A clears some registers (BOOT.TRAP, RUN, SRUN, SPEEDXX etc.) (olord1, olord2)

- -CLOCK RESET B asserted sets the S'R' latch in clock1 to generate -TPR0 pulse. The period of this is (TPREND (160ns for speed10=00) + TPW60 (60ns)) 220ns (for initial value of SSPEED0=SSPEED1=0). The pulse width is controlled with -TPR40 signal, so 40ns. (clock1)

- It is critical that -ILONG and -HANG be a non-metavalue, otherwise the required signals becomes metavalues.

- -CLOCK RESET B asserted resets the SR latch in clock2 to start generating TPCLK. TPCLK is set with -TPR0 and reset with -TPREND. (clock2)

- After X ns, -POWER RESET is de-asserted which de-asserts -CLOCK RESET A/B. This completes the reset. (olord2)

- In the hardware, it seems like the -POWER RESET pulse is due to the propagation delay of two inverters (olord2_1a20). Since cadr4 is not using any propagation delay, the cadr_olord2_suds are modified (automatically during make), and these inverters are removed. Instead, olord2_1a19 (dummy_type_a) generates the -POWER RESET pulse (initially asserted, after 20ns deasserted).

- Since having -BOOT1 and -BOOT2 not asserted, -BOOT is not asserted, this pauses booting after reset is completed. CADR does not automatically boot, it requires an external input (IOB etc.) to start booting.

## Booting

There are two main ways to boot CADR, from IOB (keyboard, chaos etc.) or SPY (PROG.BOOT in mode register). 

- When -BOOT is asserted, it causes olord2_1a18 to reset and assert BOOT.TRAP. (olord2)

- BOOT.TRAP asserts -TRAP, TRAPA and TRAPB. (trap)

- TRAPA and TRAPB disables NPC selectors (npc_4f01 .. 4f05, 4e01, 4e02) and outputs NPC[0-13] = 0. (npc)

- PC[0-13] is loaded from NPC[0-13]. (npc)

- IPC[0-13] is PC[0-13] + 1. (npc)

- In the next clock cycle, PROM[PC=0] is loaded to IR.

## A/M Memory Access

A/M memory writes are triggered with write pulses (WPx) which are generated from TPWP. TPWP is a 40ns pulse in the second half of CLK (-TPW30 <-> -TPW70). It looks like it may pass the end of the cycle but actual WPx signals are gated with DESTx, so it ends at the end of the CLK.

### A Memory (actl, amem0, amem1)

Uses dm93425a. 

- (Outputs) always enabled.
- Address: -AADR[0-9][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: AMEMPARITY, AMEM[31:0]
- Write enable: -AWPA, -AWPB and -AWPC. (WP3A nand DESTD)

DESTD signal follows DEST on the next clock. So the actual write takes place one cycle after the instruction having DEST.

### M Memory (mmem)

Uses n82s21. 

- Outputs always enabled, latch always disabled.
- Address: -MADR[0-4][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: MMEMPARITY, MMEM[31:0]
- Write always enabled.
- Write Clock: -MWPA, -MWPB (WP4B nand DESTMD)

DESTMD signal follows DESTM on the next clock. So the actual write takes place one cycle after the instruction having DESTM.

# Implementation Notes

- gnd, vcc and all hiX signals are defined as constants with values 0 and 1. These are removed from port lists of cadr components. cadr_*_suds.vhd's are using them but effectively using the constants defined in work.misc package.

# Which special purpose part is used where

## PROMs

- sn74188 (5600): mskg4
- sn74288 (5610): dspctl
- sn74472: prom

## RAMs

- d2147: imem
- dm93425a: amem, dram, pdl, vmem
- n82s21: mmem, spc

## Arithmetic

- am25s10: Shifter (shift, shift1)
- dm93s46: Identity Comparator (actl, mctl)
- sn74181: ALU (alu0, alu1)
- sn74182: Carry Generator (aluc4)
- sn74283: Adder (lcc, npc, smctl)