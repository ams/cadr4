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
  Bipolar LSI Databook, `d2118.pdf` from the 1981 Intel Component Data
  Catalog, `9401.pdf` from the 1976 Fairchild Macrologic data book,
  `mc10102.pdf` and `mc10212.pdf` from ON Semiconductor's MECL Data book
  (DL122 rev. 7).
- `ttldm.pdf` and `mttldl.pdf` are Engineered Components Company delay-line
  datasheets: the TTLDM logic delay module and the multiple TTL military
  logic delay line.

## Not available

- EXAR-CL, the clock module on the I/O and TV boards. The part behind the
  name is not identified, so there is no datasheet for it.
