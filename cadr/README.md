# cadr/README.md

This folder contains cadr components.

A cadr component implements a CADR schematic page and named
accordingly as cadr_<PAGE>.  The cadr components are grouped into two
packages `cadr_book` and `icmem_book`.

The suds architecture of cadr components are auto-generated from
`doc/ai/cadr/*.drw` files.  The architecture is implemented in
cadr_<PAGE>_suds.vhd files.

# PROM Usage

- sn74188 (5600): mskg4
- sn74288 (5610): dspctl
- sn74472: prom

# RAM Usage

- d2147: imem
- dm93425a: amem, dram, pdl, vmem
- n82s21: mmem, spc

# Notes

A/M memory writes are triggered with write pulses (WPx) which are generated from TPWP. TPWP is a 40ns pulse in the second half of CLK (-TPW30 <-> -TPW70). It looks like it may pass the end of the cycle but actual WPx signals are gated with DESTx, so it ends at the end of the CLK.

## A Memory (actl, amem0, amem1)

Uses dm93425a. 

- (Outputs) always enabled.
- Address: -AADR[0-9][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: AMEMPARITY, AMEM[31:0]
- Write enable: -AWPA, -AWPB and -AWPC. (WP3A nand DESTD)

DESTD signal follows DEST on the next clock. So the actual write takes place one cycle after the instruction having DEST.

## M Memory (mmem)

Uses n82s21. 

- Outputs always enabled, latch always disabled.
- Address: -MADR[0-4][A|B]
- Data Input: LPARITY, L[31:0]
- Data Output: MMEMPARITY, MMEM[31:0]
- Write always enabled.
- Write Clock: -MWPA, -MWPB (WP4B nand DESTMD)

DESTMD signal follows DESTM on the next clock. So the actual write takes place one cycle after the instruction having DESTM.