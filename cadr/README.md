# cadr/README.md

This folder contains cadr components.

A cadr component implements a CADR schematic page and named
accordingly as cadr_<PAGE>.  The cadr components are grouped into two
packages `cadr_book` and `icmem_book`.

The suds architecture of cadr components are auto-generated from
`doc/ai/cadr/*.drw` files.  The architecture is in
cadr_<PAGE>_suds.vhd files.

# Testbenches

| Test                 | Description                    | Relevant Pages |
| -------------------- | ------------------------------ | -------------- |
| cadr_alu             | Tests 32-bit ALU               | alu0, alu1, aluc4 |
| cadr_npc_ipc         | Tests IPC Adder in NPC         | npc |
| cadr_prom            | Tests Prom Contents            | prom0, prom1 |
| cadr                 | Complete CADR Run              | all pages |

# Special Initialization with promh.10

In order to speed up boot, the memory clearing and initializing can be done in VHDL. fast-promh.mcr.hex is modified to jump FUDGE-INITIAL-DISK-PARAMETERS directly, and M, A, PDL, SPC, L1-MAP, L2-MAP, IMEM, DMEM are initialized in vhdls with values at that point. The actual values are taken from usim when PC reaches 257.

Memory Contents (decimal index, hex value):

```
MMEM
0: 0x20001
1: 0x400
3: 0xFFFFFFFF
4: 0x20000
5: 0x4000000

AMEM
0: 0x20001
1: 0x400
3: 0xFFFFFFFF
4: 0x20000
5: 0x4000000
32: 0x1
33: 0x2
34: 0x3
35: 0x4
36: 0x5
37: 0x9
38: 0x20
39: 0x100
40: 0x2000
41: 0x770
42: 0x9FFEF0
43: 0x200205

L1-MAP
0: 0x0
1: 0x1
2: 0x2
3: 0x3
4: 0x4
5: 0x5
6: 0x6
7: 0x7
8: 0x8
9: 0x9
10: 0xA
11: 0xB
12: 0xC
13: 0xD
14: 0xE
15: 0xF
16: 0x10
17: 0x11
18: 0x12
19: 0x13
20: 0x14
21: 0x15
22: 0x16
23: 0x17
24: 0x18
25: 0x19
26: 0x1A
27: 0x1B
28: 0x1C
29: 0x1D
30: 0x1E
31: 0x1F
... so on until 2047

DMEM
0: 0x20000

PDL, SPC, L2-MAP, IMEM are all zeroes.
```
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

## A/M/PDL Memory Access

"The only events which do not take place synchronous with the clock are the control signals for the A, M, and PDL scratchpads and the SPC stack. For these devices, a two stage cycle is performed."

A write to A, M or PDL memory does not happen at the same (first) clock cycle as the execution of the instruction, but happens on the next (second) clock cycle.

For example, PROM[45] instruction ((2@M Q-R) SETZ) means: set ALU function SETZ (set zeroes) which will output zeroes on ALU bus and store this (zeroes) in M[2] and also load Q from ALU. When IR is loaded with this instruction (when PC=46), ALU output is immediately set to zeroes and it is also output on the output bus OB. This is loaded into Q in the beginning of the next (second) clock cycle. However, the write to M[2] happens at the end of the second clock cycle. This delay is  ccomplished by using a register for DEST (destination A), DESTM (destination M) and PDLWRITE (destination PDL) signals, which become DESTD, DESTMD and PDLWRITED. The registered/delayed xD signals gate the write pulse, hence the write pulse happen one clock later.

- DEST signal is always set with ALU and BYTE instructions.
- DESTM signal is set when DEST is set but IR<25> is not set (meaning IR<18-14> contains the M scratchpad address)
- PDLWRITE signal is set when DESTM is set and DESTPDL(X), DESTPDLTOP or DESTPDL(P) is asserted with an instruction having PDL memory as functional destination (IR<23-19>=10,11 or 12).

In the above example, ((2@M Q-R) SETZ), DEST and DESTM is set.

In the next cycle, DESTD and DESTMD will be set.

"During the first phase, the source addresses of the respective devices are gated into the address inputs."

The destination address of A in IR<23-14>, the destination address of M in IR<18-14> is loaded into WADR register in the beginning of the second clock cycle.

"After the output data has settled, the outputs of these devices are latched."

The data to be stored is loaded into the L register. The input to A, M and PDL memories are all the same, the L register.

"Then, the address is changed to that specified as the write location from the previous instruction."

WADR contains the Write Address of the destination. WADR is selected as the address input for the destination when clock is low, this happens before the write pulse. Thus, the write address is fed to the destination memory (A, M or PDL) before the write pulse.

"After the address has settled, a write pulse is generated for the scratchpad memory to perform the write."

Write pulses for A, M and PDL memories are generated with WPx signal together with relevant delayed/registered destination input (DESTD, DESTMD, PDLWRITED).

WPx is generated from TPWP, which is a 40ns pulse in the second half of CLK (-TPW30 <-> -TPW70). It looks like it may pass the end of the cycle but actual WPx signals are gated with DESTD, DESTMD and PDLWRITED, so the write pulse for the memory ends at the end of the clock cycle.

With the write pulse, the address input (in WADR or PDLPDR or PDLIDX) and the data in L register, the write operation is completed at the end of the second cycle.

### A Memory (actl, amem0, amem1)

Uses dm93425a. 

- (Outputs) always enabled.
- Address: -AADR[0-9][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: AMEMPARITY, AMEM[31:0]
- Write enable: -AWPA, -AWPB, -AWPC (WP3A nand DESTD)

### M Memory (mmem)

Uses n82s21. 

- Outputs always enabled, latch always disabled.
- Address: -MADR[0-4][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: MMEMPARITY, MMEM[31:0]
- Write always enabled.
- Write Clock: -MWPA, -MWPB (WP4B nand DESTMD)

### Shared use of M and A Memory

When functional destination is used in ALU and BYTE instructions (IR<25>=0), an M address has to be specified independent of it is intended or not. 0 is selected for this purpose. So M[0] is like a garbage register (probably set in CADRLP), always written when functional write is made without a specific M target.

Also, ALU and BYTE instructions set DEST and IR<25> not set asserts DESTM. Meaning all ALU and BYTE instructions write to A mem and some (IR<25>=0) also to M mem. When IR<25>=0, the M address is also used as A address (there is selector in actl for this). Hence, when M[0] is written as garbage A[0] is also written.

This can be observed in the following instruction from PROM:

00154 0000101400010317:	 ((Q-R) ADD ALU-CARRY-IN-ONE M-ONES A-ZERO)

### PDL Memory (pdlctl, pdl0, pdl1)

Uses 93425a.

- (Outputs) always enabled.
- Address: -PDLA[0-9][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: PDLPARITY, PDL[31:0]
- Write enable: -PWPA, -PWPB, -PWPC (PDLWRITED nand WP4A)

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