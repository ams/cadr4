
# ttl

This folder contains TTL components used in CADR.

All components have a testbench with `_tb` suffix. Run `make ttl-check` to run all testbenches. Testbenches might not be necessarily 100% accurate.

FFs and (normal) Registers are using ff_dpc and ff_jkpc common implementations. Shift Registers, Counters and Latches (dm9328, sn74169 sn74194, sn74373, til309) are not using ff_ implementations.

Every TTL component has a datasheet under doc/ttl with the same name as the entity name.

# TTL Compatibility

Real TTL components behave like they have a weak pull-up at their input. To be able to simulate this behavior, TTL components have internal signals for all in ports and the inputs are checked for Z before assigning them to internal signals. If in port is 'Z', the internal input signal is set to 'H'. This cannot be done by simply setting in port default value to 'H', because in port cannot drive a signal, default value only functions when there is no driver (when even no Z, like unconnected).

This is done with misc.ttl_input function. Additionally, this function operates like to_x01 function, so Z and H is mapped to 1, L is mapped to 0.

## Open-Collector Outputs

The components with open-collector outputs can only drive output to 0 or Z. An external pull-up resistor is required to convert Z to 1.

- sn74188 32x8 PROM is used as a replacement of 5600. 5600/sn74188 is only used in mskg4, and their outputs (MSK[31:0]) are pulled-up with 2x res20 components (2e20 and 2e15). See msk4g.

- n82s21 32x2 RAM with open-collector outputs is used in mmem and spc to implement M and SPC memories. The outputs in mmem (MMEM[31:0]) are pulled-up with 2x res20 components (4b19 and 4b20) in mctl. The outputs at spc (SPCO[18:0]) are pulled-up with 2x res20 components (4e29 and 4e24) in spc.

## TTLDM

TTLDM is a special component, see the internal comments for how it is implemented and why.

# Initial State

CADR reset is a bit strange. It seems like not all the required things are reset on power on reset (e.g. D_FF for IR25 driving -ILONG required for clock to tick). Because of this, the initial state of all memory components (FFs, registers and counters, RAMs) are set to zero. PROMs are initialized from hex files.

# Naming

On CADR4 schematics, part names of ICs have no letter prefix. VHDL requires identifiers to start with a letter. So all the entities in this project starts with a letter, similar to how manufacturers name them.

All part names are converted to lower-case e.g. n82s21 rather than N82S21.

The manufacturers of parts are checked from CADR AI documents (doc/ai). The manufacturers are:

- AMD: am prefix
- Fairchild or National: dm prefix
- Intel: d prefix
- Signetics: n prefix
- TI (or 7400 family in general): sn prefix

As some of Fairchild parts may have no prefix originally (e.g. 9S42), dm is used for such parts, for example 9S42 became dm9s42.

Other than sn74 entities, all entity names are exact to original part names (ignoring the dm prefix for Fairchild), i.e am25s07 is AMD Am25S07. However, the sn74 entities have no letter between the numbers (temperature range 74 and functional code like 00) since this letter identifies the process tweaks (no letter=TTL, S=Schottky, LS=low-power Schottky etc.) and they are logically and from HDL point of view equivalent.

# Packages

- amd (am...): am25ls2519, am25s07, am25s09, am25s10, am93s48
- ecc (ttldm): ttldm (ttldm-25, ttldm-50, ttldm-100, ttldm-250)
- fairchild (dm...): dm9s42, dm93s46, dm9328, dm93425a
- intel (d...): d2147
- signetics (n...): n82s21
- sn74 (sn74...) many sn74xx and sn74xxx
- other: dummy_type_A, res20, sip220_330_8, sip330_470_8, til309

ecc = Engineered Components Company

# Levels of Abstraction

All parts are implemented in one of the three architectures:

- behavioral: The implementation works to behave as same as the function or algorithm described in the datasheet. It probably consists of if or if-like statements, it is more software-ish. This is mostly the complex logic ICs.

- functional: The implementation consists of a logical equivalence or RTL equations, most probably based on an equation on the datasheet. This is all the basic gates and some logic ICs with the logic equation or function table available in the datasheet.

- structural: The implementation is wholly or mostly wiring of other components such as ff_ components. sn74181 ALU has a gate-level structural implementation.

# Parts

Below, all IC parts used in CADR4 are listed except the pure combinatorial logic gates such as sn7400. All combinatorial logic gates are in sn74 except fairchild dm9s42.

All ICs with tri-state outputs are explicitly indicated.

All ICs with open collector outputs are explicitly indicated.

## Mux/Demux

- sn74138: 3-8 demux
- sn74139: 2-4 demux
- sn74153: dual 4-1 demux
- sn74157: 2-1 mux with tri-state outputs
- sn74258: quad 2-1 inverse mux with tri-state outputs

## Line/Bus Drivers & Buffers

- sn74240: octal buffer and line driver with tri-state outputs
- sn74241: octal buffer and line driver with tri-state outputs
- sn74244: octal buffer and line driver with tri-state outputs

## FF & Register & Counter

### Flip-Flops

- sn7474: dual d-type positive edge triggered ff with preset and clear
- sn74109: dual j-k positive edge triggered ff with preset and clear
- sn74174: hex d-type ff with clear
- sn74175: quad d-type ff with clear
- sn74374: octal d-type ff with tri-state outputs

### Registers

- am25ls2519: quad register with two independently controlled tri-state outputs
- am25s07: 6-bit register with common clock enable
- am25s09: quad 2 input high-speed register (quad d-type ff with 2-1 select)

### Shift Registers

- dm9328: dual 8-bit shift register
- sn74194: 4-bit bidirectional universal shift register

### Transparent Latches

- sn74373: octal d-type transparent latch with tri-state outputs

### Counters

- sn74169: synchronous 4-bit up/down binary counter

## RAM & PROM

### RAM

- d2147: 4096x1 RAM with tri-state outputs 
- dm93425a: 1024x1 RAM with tri-state outputs
- n82s21: 32x2 RAM with open-collector outputs

### PROM

- sn74188: 32x8 PROM with open-collector outputs (replaces IM5600)
- sn74288: 32x8 PROM with tri-state outputs (replaces IM5610)
- sn74472: 512x8 PROM with tri-state outputs

## Arithmetic and Parity

### Arithmetic

- am25s10: 4-bit shifter
- dm93s46: 6-bit identity comparator
- sn74181: 4-bit ALU
- sn74182: look-ahead carry generator
- sn74283: 4-bit binary full adder with fast carry

sn74181 is implemented by translating the gate-level model available in Verilog (https://tumbleweed.nu/r/iscas.restore/doc/trunk/index.html). It is also possible to implement sn74182 and sn74283 like this.

### Parity Generator/Checker

- am93s48: 12-bit odd/even parity generator/checker
- sn74280: 9-bit odd/even parity generator/checker

## Special

- dummy_type_A: all passive element (passive components on a dip socket)
- til309: numeric display with logic
- ttldm: ttl delay line