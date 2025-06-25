
# ttl

This folder contains ttl components.

Since all components are TTL compatible, all inputs are initialized to 'H'.

All components have a testbench with `_tb` suffix. Run `make ttl-check` to run all testbenches.

# Naming

On CADR4 schematics, part names of ICs have no letter prefix. VHDL requires identifiers to start with a letter. So all the entities in this project starts with a letter, similar to how manufacturers name them.

All part names are converted to lower-case e.g. n82s21 rather than N82S21.

The manufacturers of parts are checked from CADR AI documents (doc/ai). The manufacturers are:

- AMD: am prefix
- Fairchild or National: dm prefix
- Intel: d prefix
- Signetics: n prefix
- TI (or 7400 family in general): sn prefix

As some of Fairchild parts may have no prefix originally (e.g. 9S42), dm is also used for such parts and for example became dm9s42.

Other than sn74 entities, all entity names are exact to original part names (ignoring the dm prefix for Fairchild), i.e am25s07 is AMD Am25S07. However, the sn74 entities have no letter between the numbers (temperature range 74 and functional code like 00) since this letter identifies the process tweaks (no letter=TTL, S=Schottky, LS=low-power Schottky etc.) and they are logically and from HDL point of view equivalent.

# Datasheets

Each entity has a datasheet under doc/ttl with the same name as the entity name.

# Packages

- amd (am...): am25ls2519, am25s07, am25s09, am25s10, am93s48
- ecc (ttldm): ttldm (ttldm-25, ttldm-50, ttldm-100, ttldm-250)
- fairchild (dm...): dm9s42, dm93s46, dm9328, dm93425a
- intel (d...): d2147
- signetics (n...): n82s21
- sn74 (sn74...) many sn74xx and sn74xxx
- other: dummy_type_A, res20, sip220_330_8, sip330_470_8, til309

ecc = Engineered Components Company

# Parts

Below, all IC parts used in CADR4 are listed except the pure combinatorial logic gates such as sn7400. All combinatorial logic gates are in sn74 except fairchild dm9s42.

All ICs with tri-state outputs are explicitly indicated.

All ICs with open collector outputs are explicitly indicated.

## Mux/Demux

- sn74138: 3-8 demux
- sn74139: 2-4 demux
- sn74157: 2-1 mux with tri-state outputs
- sn74258: quad 2-1 inverse mux with tri-state outputs

## Line/Bus Drivers & Buffers

- sn74240: octal buffer and line driver with tri-state outputs
- sn74241: octal buffer and line driver with tri-state outputs
- sn74244: octal buffer and line driver with tri-state outputs

## FF & Register

- am25ls2519: quad register with two independently controlled tri-state outputs
- am25s07: 6-bit register with common clock enable
- am25s09: quad 2 input high-speed register (quad d-type ff with 2-1 select)
- dm9328: dual 8-bit shift register
- sn7474: dual d-type positive edge triggered ff with preset and clear
- sn74109: dual j-k positive edge triggered ff with preset and clear
- sn74174: hex d-type ff with clear
- sn74175: quad d-type ff with clear
- sn74194: 4-bit bidirectional universal shift register
- sn74373: octal d-type transparent latch with tri-state outputs
- sn74374: octal d-type ff with tri-state outputs

## RAM & PROM

- d2147: 4096x1 RAM with tri-state outputs 
- dm93425a: 1024x1 RAM with tri-state outputs
- n82s21: 32x2 RAM with open-collector outputs
- sn74188: 32x8 PROM with open-collector outputs (replaces IM5600)
- sn74288: 32x8 PROM with tri-state outputs (replaces IM5610)
- sn74472: 512x8 PROM with tri-state outputs

## Complex Logic (arithmetic, parity etc.)

- am25s10: 4-bit shifter
- am93s48: 12-bit odd/even parity generator/checker
- dm93s46: 6-bit identify comparator
- sn74169: synchronous 4-bit up/down binary counter
- sn74181: 4-bit ALU
- sn74182: look-ahead carry generator
- sn74280: 9-bit odd/even parity generator/checker
- sn74283: 4-bit binary full adder with fast carry

## Special

- dummy_type_A: all passive elements
- til309: numeric display with logic
- ttldm: ttl delay line

# Notes on Components with Open-Collector Outputs

The components with open-collector outputs can only drive output to 0 or Z. An external pull-up resistor is required to convert Z to 1.

- sn74188 32x8 PROM is used as a replacement of 5600. 5600/sn74188 is only used in mskg4, and their outputs (MSK[31:0]) are pulled-up with 2x res20 components (2e20 and 2e15). See msk4g.

- n82s21 32x2 RAM with open-collector outputs is used in mmem and spc to implement M and SPC memories. The outputs in mmem (MMEM[31:0]) are pulled-up with 2x res20 components (4b19 and 4b20) in mctl. The outputs at spc (SPCO[18:0]) are pulled-up with 2x res20 components (4e29 and 4e24) in spc.
