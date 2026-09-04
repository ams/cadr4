# ttl

Datasheets for the components on the CADR boards, plus ISCAS-85 gate-level
Verilog models of the 74181 and 74182 (`74181.v`, `74182.v`).

## Naming

Files are named by the part number as MIT's stuffing lists give it, in
lowercase: `sn74161.pdf`, `am25ls2521.pdf`, `mc10102.pdf`. Intel parts carry
Intel's D package prefix, as MIT wrote them: `d2147.pdf`, `d2118.pdf`. Parts
MIT lists by bare number keep the bare number: `2651.pdf` (Signetics PCI),
`9401.pdf` (Fairchild CRC generator), `67401.pdf` (MMI FIFO).

## Notes on individual files

- `dm8837.pdf` is National's DS7837/DS8837 datasheet. DS8837 is the DM8837
  under National's later DS prefix; it is the same part number.
- TI only publishes the later revision of some interface parts, so the file
  covers that revision: `am26ls33.pdf` is the AM26LS32A/AM26LS33A datasheet,
  `sn75107.pdf` the SN75107A/B, `sn75110.pdf` the SN75110A, `sn75452.pdf`
  the SN75452B.
- `sn7421.pdf` is three pages from TI's 1981 TTL Data Book (the pin
  assignment page and the positive-AND gate tables). TI never issued a
  standalone datasheet for the plain SN7421; its SDLS139 covers only the LS21.
- `sn74s287.pdf` is TI's 1975 bulletin for the whole series 54/74 PROM
  family, which lists the SN74S287.
- `sn74s158.pdf` and `sn74157.pdf` are the same TI document (SDLS058).
- Databook extracts: `am25ls193.pdf` and `am25ls2536.pdf` from the 1978 AMD
  Schottky and Low-Power Schottky Data Book, `67401.pdf` from the 1978 MMI
  Bipolar LSI Databook, `d2118.pdf` and `d2141.pdf` from the 1981 Intel
  Component Data Catalog, `9401.pdf` from the 1976 Fairchild Macrologic
  data book, `mc10102.pdf`, `mc10105.pdf`, `mc10121.pdf`, `mc10124.pdf`,
  `mc10125.pdf`, `mc10136.pdf`, `mc10141.pdf` and `mc10212.pdf` from ON
  Semiconductor's MECL Data book (DL122 rev. 7).
- The eight MECL files are the eight bodies MIT's own ECL body library for
  the TV board, `doc/ai/cadrtv/eclbod.drw`, defines. Note that the two
  translators do not carry the MECL supply pins the other six do:
  `mc10124.pdf` and `mc10125.pdf` have Gnd on pin 16, VCC (+5.0 V) on
  pin 9 and VEE (-5.2 V) on pin 8, not VCC1 on pin 1 / VCC2 on pin 16 /
  VEE on pin 8.
- `d2141.pdf` is the 4K x 1 static RAM on the TV board's sync program
  store, LISPMTV SYNRAM. It is Intel's slower part in the 2147 pinout, and
  its own first page says so: "Industry Standard 2147 Pinout", "the same
  as the 2147". Both sheets give the same pin configuration: A0-A5 on 1-6,
  DOUT 7, WE 8, GND 9, CS 10, DIN 11, then A11 12, A10 13, A9 14, A8 15,
  A7 16, A6 17, VCC 18. The six high address pins run downward, A6 on 17
  and A11 on 12, not A6 on 12. `d2147.pdf` is the later 2147H sheet, which
  states the same pinout. The 1981 catalog's 2141 is the HMOS part; a
  later ADVANCED HMOS II revision of the same sheet exists, with the same
  pinout and faster grades.
- `beckman-898.pdf` is BI Technologies' Models 898, 899 dual-in-line thick
  film resistor network sheet, which covers the `898-3-R22` packs on the TV
  board and the `898-3-R47` and `898-1-R1K` packs elsewhere. It is filed
  under the family rather than a full part number because one sheet covers
  them all: the suffixes are the circuit type and the resistance value.
  BI Technologies is Beckman's successor, and the sheet is stamped
  OBSOLETE; its schematics page is the authority for the `-3` isolated
  circuit, eight resistors from pin k to pin 17-k. It is the vendor's file
  byte for byte, so `qpdf --check` reports stale linearization hints on it;
  the page data is intact.
- `ttldm.pdf` and `mttldl.pdf` are Engineered Components Company delay-line
  datasheets: the TTLDM logic delay module and the multiple TTL military
  logic delay line.

## Not available

- EXAR-CL, the clock module on the I/O and TV boards. The part behind the
  name is not identified, so there is no datasheet for it.
