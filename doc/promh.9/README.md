
# promh9 files

PROM0_1B19	// prom 40-48, ce0
PROM0_1B17	// prom 32-39, ce0
PROM0_1C20	// prom 24-31, ce0
PROM0_1D16	// prom 16-23, ce0
PROM0_1E19	// prom 8-15, ce0
PROM0_1E17	// prom 0-7, ce0

promh9.*.hex files (see doc/ai/lispm1) come from the 24 Feb 1981 tape. These are converted to hex format (originals were octal) and they match to promh.mcr.9 i-mem contents.  These are for PROM0 only. PROM1 does not contain any data and loaded with prom.00.hex and prom.80.hex files containing only zeroes with correct parity.

Hex file are indexed 512 to 0.