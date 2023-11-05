# cadr4

Experiments of the third kind... This is an attempt at making a
faithful and accurate HDL implementation of CADR.  There will be no
attempt at making this synthesizable!

## Random chit-chat

There is a IRC channel on irc.libera.net, ##lispm for random
chit-chat.  Feel free to send bugs directly to ams@gnu.org.

## Setup

Prerequisites:

  - [Fossil](https://fossil-scm.org)
  - Git
  - GNU Make
  - [GHDL](http://ghdl.free.fr/)

	Ideally using the GCC or LLVM code generator, since at some point there will be a simulatd UART to talk to the core.
  - [GTKWave](https://gtkwave.sourceforge.net/), [vcd](https://github.com/yne/vcd) or some other VCD viewer.

```
cd ~/
fossil open https://tumbleweed.nu/r/hdlmake.mk
git clone https://github.com/ams/cadr4
cd cadr4
make help
```

If writing or testing CADR microcode, then it is useful to have [usim](https://tumbleweed.nu/r/usim) configured to be able to run [CADRLP](https://tumbleweed.nu/r/lm-3/uv/cadr.html#The-CADRLP-Assembler) or the CADR Console debugger (CC).

## Organization

  - ttl: contains all the ICs that are used by the CADR.

	* sn74: 74xx logic.

	* other: other ICs that do not fall into above categories.

	* unsorted: contains skeletons directly translated from the
	  schematics; these are to be deleted / merged at some point.

  - cadr4.vhd: contains a exact transliteration of the original CADR
	schematics, with a testbench that is capable of running it in
	cadr4_tb.vhd.

New documentation should be written in Markdown. At some point this
should be migrated back into the [Lisp Machine
Manual](https://tumbleweed.nu/r/lm-3/uv/chinual.html) or other
suitable places.
