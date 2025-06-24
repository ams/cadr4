
# TTL Components

Since all components are TTL, all inputs are initialized to 'H'. This is critical for CADR to work, if changed, many things can break.

All components have a testbench with `_tb` suffix. Run `make ttl-check` to run all testbenches.

# Naming

On CADR4 schematics, part numbers of ICs have no letter prefix. VHDL requires identifiers to start with a letter. So all the entities in this folder starts with a letter.

All standard 74xx ICs start with prefix sn, so sn7400 rather than 7400.

Fairchild semiconductor parts, for example 93S46, has National semiconductor prefix dm, for example dm93s46.

AMD parts already start with prefix am, so they already have matching names.

# Parts

Below are all IC parts used in CADR4.

ICs not explicitly mentioned below are pure combinatorial logic gates such as sn7400.

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

- sn7474: dual d-type positive edge triggered ff with preset and clear
- sn74109: dual j-k positive edge triggered ff with preset and clear
- sn74174: hex d-type ff with clear
- sn74175: quad d-type ff with clear
- sn74194: 4-bit bidirectional universal shift register
- sn74373: octal d-type transparent latch
- sn74374: octal d-type ff
- am2507: 6-bit register with common clock enable
- am2509: quad 2 input high-speed register (quad d-type ff with 2-1 select)
- am252519: quad register with two independently controlled tri-state outputs
- dm9328: dual 8-bit shift register

## RAM & PROM

- sn74s188: 32x8 PROM with open-collector outputs (replaces IM5600)
- sn74s288: 32x8 PROM with tri-state outputs (replaces IM5610)
- am2147: 4096x1 RAM with tri-state outputs 
- am93425a: 1024x1 RAM with tri-state outputs
- dm8221: 32x2 RAM with tri-state outputs
- dm74472: 512x8 PROM with tri-state outputs


## Complex Logic (arithmetic, parity etc.)

- sn74169: synchronous 4-bit up/down binary counter
- sn74181: 4-bit ALU
- sn74182: look-ahead carry generator
- sn74280: 9-bit odd/even parity generator/checker
- sn74283: 4-bit binary full adder with fast carry
- am93s48: 12-bit odd/even parity generator/checker
- am2510: 4-bit shifter
- dm93s46: 6-bit identify comparator

## Special

- td25, td50, td100, td250: time delay
- til309: numeric display with logic