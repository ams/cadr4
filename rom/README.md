
# rom

This folder contains PROM and RAM hex files and generic-map tables, plus
`mit/`, an archive of MIT's own PROM listings as they came off the ITS tapes.

## dspctl and mskg4

dspctl and mskg4 uses dspctl.2f22.hex and mskg4.*.hex files.

## promh.mcr.9.hex and promh9.table

promh.mcr.9.hex is the official and original PROM of CADR.

This file is used to generate promh9/*.hex files. They can be regenerated with `make regenerate-hex-files`.

To use this prom, promh9.table should be used with fix-suds.soap4.py. This is done by calling `make regenerate-promh9-cadr-suds` and `make regenerate-promh9-icmem-suds`.

## fast-promh.mcr.hex and fast-promh.table

fast-promh.mcr.hex is promh.mcr.9.hex with a modified first instruction, which jumps to 0257 (FUDGE-INITIAL-DISK-PARAMETERS) rather than 045 (GO). The idea is to skip memory initialization to speed up booting. When it is used, all memories have to be initialized and some has to be pre-loaded with some values.

amem.hex, dram.hex, mmem.hex and vmem0.hex contains the preloading values for A-MEMORY, D-MEMORY (DPC), M-MEMORY and LEVEL-1-MAP.

These files are used to generate fast-promh/*.hex files. They can be regenerated with `make regenerate-hex-files`.

To use this prom, fast-promh.table should be used with fix-suds.soap4.py. This is done by calling `make regenerate-fast-promh-cadr-suds` and `make regenerate-fast-promh-icmem-suds` (what `make regen` does). This is the default and the suds files in the repo are generated like this.

The usim dumps carry the odd parity bit above the data bits (e.g. the D-memory word 0x20000 is 17 zero data bits plus parity); split-hex masks it off and recomputes parity.

## reqtim.0a02.hex, uprior.0d09.hex and busint.table

These two are the busint board's PROMs, and unlike everything above they are
not derived from a usim dump: each is MIT's own listing in `mit/cadr1/`
converted octal to hex, one word per line, in order. `busint.table` maps them
onto the components, and `make regen` applies it. The conversion is exact --
32 of 32 words for reqtim, 512 of 512 for uprior -- so `mit/cadr1/*.prom` is
the authority if either ever needs to be rebuilt.

## mit/

MIT's PROM listings, byte-identical copies of the files in `doc/ai`, which
`doc/drwtools/install.py` selects from the ITS tape dumps. They are kept here
too because `doc/ai` is machine-generated -- install.py deletes what its rules
stop selecting -- while this folder is where the machine's ROM content lives.
Refresh them with `cp -p doc/ai/<group>/<file> rom/mit/<group>/`.

The format is MIT's, not ours: a title line, then `address<TAB>value` in
**octal**, one word per line, comments after `;`, terminated by `END`. Nothing
in the build reads them; they are archived as the original source for the hex
files, and for the PROMs cadr4 does not model yet. Every listing below is
contiguous from address 0.

| file | part | words | page | designator | board |
|---|---|---|---|---|---|
| `cadr1/reqtim.prom` | 74S288 32x8 | 32 | REQTIM | A02 | busint |
| `cadr1/uprior.prom` | 74S472 512x8 | 512 | UPRIOR | D09 | busint |
| `cadrtv/lmprom.3` | 74S288 32x8 | 32 | SYNCLK | D06 | SIMPLE TV |
| `cadrtv/lmtv4b.prom` | 74S288 32x8 | 32 | SYNCLK | D06 | LISPM TV, 4-bit |
| `cadrtv/lmtv8b.prom` | 74S288 32x8 | 32 | SYNCLK | D06 | LISPM TV, 8-bit |
| `cadrtv/cpt.prom` | 74S472 512x8 | 297 | SYNRAM | C05 | both TV boards |
| `cadrtv/vmi.prom` | 74S472 512x8 | 297 | SYNRAM | C05 | both, APR-81 revision |
| `cadrdc/mksman.d03` | 74S472 512x8 | 512 | MKUI | D03 | Marksman |
| `cadrdc/mksman.d04` | 74S472 512x8 | 512 | MKUI | D04 | Marksman |
| `cadrdc/mksman.d05` | 74S472 512x8 | 512 | MKUI | D05 | Marksman |
| `chaos/lmmodu.prom` | 74S288 32x8 | 32 | LMMODU | A10 | qbchni |
| `chaos/lmmodu.prom2` | 74S288 32x8 | 32 | LMMODU | A10 | qbchni, precharge version |
| `chaos/lmmynm.prom` | 74S287 256x4 | 256 | LMMYNM | D01 | qbchni |

Part types, pages and designators are MIT's, read off the wire lists
(`doc/ai/cadr1/busint.wlr`, `cadrdc/mk.wlr`, `cadrtv/lmtv4b.wlr`,
`chaos/qbchni.wlr`). `lmmodu.promt` and `lmmynm.promt` are the state tables
those two implement, not images.

`cpt.prom` and `vmi.prom` are the TV **sync program**, and both boards take
one: on `nsyram.drw` (SIMPLE TV, 24-JAN-80) and `synram.drw` (LISPM TV,
07-DEC-80) alike, the 74S472 at 0C05 and the eight sync RAMs drive the same
SYNC 0-7 bus and are selected against each other, PROM by `-SYNC PROM ENB L`
and RAM by `SYNC PROM ENB L`. That net is Q7 of the 74LS273 at 0A07 on TVINC,
whose `-CLR` is `-POWER RESET`, so **after reset the PROM is selected and the
RAM is not**: 0C05 is what the board runs at power-up, until software writes
bit 7 of `173777x3` to switch to the loaded RAM program (`lmtv.order`). This is
the "PROM mode" of the 18-JUN-80 entry in `lmtv.eco`.

Do not use `lmtv.stf` to settle SIMPLE TV parts: it is 28-MAY-79 and describes
the SYNRAM sheet of 05-AUG-78, before the 24-JAN-80 revision that put the
74S472 in 0C05 and moved the 74LS244 to 0D05, so it lists 0C05 as a 74LS244
and no 74S472 at all. `lmtv4b.stf` and `lmtv4b.wls` are same-day with their
drawings; for the SIMPLE TV the `n`-named sheets in `doc/ai/cadrtv/simple-tv/`
are the authority. The 2147-vs-2141 split is real: SIMPLE TV 2147, LISPM TV
2141.

The word format is in `lmtv.order`: bit 0 Hsync, 1 Vsync, 2 composite sync,
3 blank, 5-4 buffer cycle type (00 processor, 01 refresh, 10 video, 11
end-of-line), 7-6 special function (01 TVMA CLR, 10 end of loop, 11 end of
program). The SIMPLE TV's `gen4b.drw` carries the same legend on the drawing
itself -- "0 HORIZONTAL SYNC, 1 VERTICAL SYNC, 2 --, 3 BLANKING, 4,5 PROCESSOR
CYCLE/REFRESH/DISPLAY/NEW LINE, 6,7 --/START OF FRAME/END OF LINE/END OF
FRAME" -- which is MIT confirming the layout independently of `lmtv.order`.
Decoded that way the two images are the same program -- same 297
words, same 9 loop ends, same 4 program ends -- differing in exactly one word,
address 41 octal, where `vmi.prom` adds Blank and a second TVMA CLR
(065 -> 175). So `vmi.prom` is a one-word revision of `cpt.prom`, not a
different board's or a different monitor's program.

Three cautions:

- The three TV clock PROMs are **not** interchangeable, despite sharing the
  D06 socket: their RAS/RASW/CLK-64B patterns differ. `lmprom.3` is the SIMPLE
  TV's; a 4-bit LISPM TV wants `lmtv4b.prom`.
- `mksman.d0*` are the **Marksman** controller's, on the MK board's MKUI page.
  Their header reads "PROM LOCATION DISK-CONTROL-D03", but that is a literal
  copied from `newdsk.trans` and is wrong: the microword layout differs from
  the disk controller's. Do not load them into the DC board.
- The DC board's own three 74S472s, at DCUI D03/D04/D05, have **no surviving
  image**. `cadrdc/newdsk.31` is the microcode source, the only version on the
  tapes and the one whose 24 fields match `doc/ai/cadrdc/dcui.wd` signal for
  signal; `cadrdc/newdsk.trans` is MIT's Lisp program splitting an assembled
  `NEWDSK MCR` into the three images. The assembler it names, MICRO 52, is not
  on the tapes, and neither is `NEWDSK MCR` -- both lived in a `MOON;`
  directory that was never dumped. `cadrdc/mksman.39` is here because it is
  the check on any reimplementation: source (`mksman.39`), MIT's own assembled
  listing (`mksman.mcr`) and the resulting `mksman.d0*` all survived, so the
  whole round trip is here and a new assembler can be held to it before it is
  pointed at NEWDSK 31. Applying `newdsk.trans`'s arithmetic to `mksman.mcr`
  reproduces all three `mksman.d0*` images exactly, so the listing format is
  confirmed: `U <addr>, <high12>,<low12>` in octal, stopping at the first bare
  `END` -- the `U` lines after it are the cross-reference index, not data.

# Details

## DSPCTL

DSPCTL.2F22	// dispatch prom

0 0000000
1 0000001
2 0000011
3 0000111
4 0001111
5 0011111
6 0111111
7 1111111

## MSKG4 (mask generation)

MSKG4_2D12	// right, 24-31
MSKG4_2E12	// r, 16-23
MSKG4_2D17	// r, 8-15
MSKG4_2E17	// r, 0-7

MSKG4_2D11	// left, 24-31
MSKG4_2E11	// l, 16-23
MSKG4_2D16	// l, 8-15
MSKG4_2E16	// l, 0-7

octal  LEFT MASK MEMORY contents            RIGHT MASK MEMORY contents
index
  0    00000000000000000000000000000001     11111111111111111111111111111111
  1    00000000000000000000000000000011     11111111111111111111111111111110
  2    00000000000000000000000000000111     11111111111111111111111111111100
  3    00000000000000000000000000001111     11111111111111111111111111111000
  4    00000000000000000000000000011111     11111111111111111111111111110000
  5    00000000000000000000000000111111     11111111111111111111111111100000
  6    00000000000000000000000001111111     11111111111111111111111111000000
  7    00000000000000000000000011111111     11111111111111111111111110000000
 10    00000000000000000000000111111111     11111111111111111111111100000000
 11    00000000000000000000001111111111     11111111111111111111111000000000
 12    00000000000000000000011111111111     11111111111111111111110000000000
 13    00000000000000000000111111111111     11111111111111111111100000000000
 14    00000000000000000001111111111111     11111111111111111111000000000000
 15    00000000000000000011111111111111     11111111111111111110000000000000
 16    00000000000000000111111111111111     11111111111111111100000000000000
 17    00000000000000001111111111111111     11111111111111111000000000000000
 20    00000000000000011111111111111111     11111111111111110000000000000000
 21    00000000000000111111111111111111     11111111111111100000000000000000
 22    00000000000001111111111111111111     11111111111111000000000000000000
 23    00000000000011111111111111111111     11111111111110000000000000000000
 24    00000000000111111111111111111111     11111111111100000000000000000000
 25    00000000001111111111111111111111     11111111111000000000000000000000
 26    00000000011111111111111111111111     11111111110000000000000000000000
 27    00000000111111111111111111111111     11111111100000000000000000000000
 30    00000001111111111111111111111111     11111111000000000000000000000000
 31    00000011111111111111111111111111     11111110000000000000000000000000
 32    00000111111111111111111111111111     11111100000000000000000000000000
 33    00001111111111111111111111111111     11111000000000000000000000000000
 34    00011111111111111111111111111111     11110000000000000000000000000000
 35    00111111111111111111111111111111     11100000000000000000000000000000
 36    01111111111111111111111111111111     11000000000000000000000000000000
 37    11111111111111111111111111111111     10000000000000000000000000000000

  <remainder zero -- unused>