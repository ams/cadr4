# cadr4

Experiments of the third kind...  This is an attempt at making a
faithful and accurate HDL implementation of CADR.  There will be no
attempt at making this synthesizable (at this time)!

## Random chit-chat

There is a IRC channel on irc.libera.net, ##lispm for random
chit-chat.  Feel free to send bugs directly to ams@gnu.org.

## Setup

### Prerequisites

  - Git
  - GNU Make
  - [GHDL](http://ghdl.free.fr/)

	Ideally using the GCC or LLVM code generator, since at some point
	there will be a simulatd UART to talk to the core.

  - Some sort of VCD viewer:
 	  - [GTKWave](https://gtkwave.sourceforge.net/)
    - [Surfer](https://surfer-project.org)

### Build

```
git clone https://github.com/ams/cadr4
cd cadr4
make suds
make
```

All build artifacts are created under `build` directory.

### Run

To run a testbench (`build/X_tb`): `make run-X`

To run a testbench (`build/X_tb`) and create the waveforms: `make wf-X`

To run a testbench (`build/X_tb`), create the waveforms and run surfer with the waveform file: `make surfer-X`

#### waveform.opt file

If there is a `X_tb.opt` file next to `X_tb.vhd`, it is used as waveform options file in GHDL (`--read-wave-opt`).

If the file contains "recreate" in its first line, the file is deleted and recreated. This will show all signal paths.

If the file contains "ignore" in its first line, the file is ignored, `--read-wave-opt` is not used.

## File Organization

- cadr: cadr components
- dip: dip components
- doc: various documents
- rom: ROM files loaded to CADR (P)ROMs
- scripts: helper/utility scripts
- set: set components
- soap: utility to generate cadr_*_suds.vhd files
- tb: system tests
- ttl: ttl components

Each folder has a README.md containing more information.

## Packages

- work.set: set components
- work.cadr: cadr components
- work.dip: dip components
- work.sn74: ttl sn74 components
- work.other: other ttl components (am..., dm..., td... etc.)
- work.misc: misc functions and procedures (no components)

## Documentation

- [The CADR Microprocessor](https://tumbleweed.nu/r/lm-3/uv/cadr.html)
- [Implementation of a List Processing Machine](https://tumbleweed.nu/r/lm-3/uv/knight-thesis.html)
- [CADR Schematics](https://tumbleweed.nu/lm-3/schematics.html)
- [Interactive CADR Schematics](https://www.nexoid.at/cadr/clock1.html)