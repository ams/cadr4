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

If there is a `X_tb.opt`, it is used as waveform options file in GHDL (`--read-wave-opt`).

If the file contains "recreate" in its first line, the file is deleted and recreated. This will show all signal paths.

If the file contains "ignore" in its first line, the file is ignored, `--read-wave-opt` is not used.

## Organization

  - cadr/cadr_book.vhd: Main file for the CADR processor.

  - cadr/icmmem_book.vhd: Master clock, and memory.

  - cadr/<page>.vhd: Contains the component definition for each
    schematic page.  Human curated.

  - cadr/<page>_suds.vhd: (Semi-)Generated files from the original
    SUDS drawings.

  - dip.vhd: Model definitions that map SUDS DIP packages over the TTL
    library.  Each wrapper has its own file under dip/.

  - ttl (package): contains all the ICs that are used by the CADR.

	* sn74: 74xx logic.
	* other: other non-74xx ICs
  
## Documentation

New documentation should be written in Markdown.  At some point it
will be moved to a more suitable place at the [LM-3
project](https://tumbleweed.nu/r/lm-3).

  - [The CADR Microprocessor](https://tumbleweed.nu/r/lm-3/uv/cadr.html)
  - [Implementation of a List Processing Machine](https://tumbleweed.nu/r/lm-3/uv/knight-thesis.html)
  - [CADR Schematics](https://tumbleweed.nu/lm-3/schematics.html)
  - [Interactive CADR Schematics](https://www.nexoid.at/cadr/clock1.html)

## Glossary 

  - DR

    Dispatch R-bit is set.  Ignore new PC, pop PC off the SPC stack.

  - DN

    Dispatch N-bit is set.  Inhibit execution of next instruction.

  - DP

    Dispatch P-bit is set.  Save return address to SPC, jump to new PC
    address.

  - DFALL

    Both P and R bit in dispatch instruction are set, fallthrough (do
    not dispatch)

  - IRALU

    Instruction Register contains an ALU instruction (IR44-IR43).

  - IRBYTE

    Instruction Register contains a BYTE instruction (IR44-IR43).

  - IRJUMP

    Instruction Register contains a JUMP instruction (IR44-IR43).

  - IRDISP

    Instruction Register contains a DISPATCH instruction (IR44-IR43).

  - DEST

    There is a Destination.  True for ALU and BYTE instructions.

  - DESTM

    Destination M Memory.  True for ALU or BYTE instructions that have
    IR25 set.

  - DESTMEM

    Destination (Main) Memory.  The highest bit of the functional
    destination is set, destination is OA register, VMA or MD.

  - SRCDC

    Source Dispatch Constant

  - ZERO16

    Zero bits starting with 16 on MF bus.  Set when source is DC,
    PDLPTR, PDLIDX or OPC.

  - OPCINH

    OPC Inhibit.  Set by the spy interface, inhibits shifting the OPC
    values.

  - IR5

    Instruction Register bit 5: JUMP: If low, rotation count for M
    source.  If high, condition number.

  - IR6

    Instruction Register bit 6: JUMP: Invert Condition

  - IR7

    Instruction Register bit 7: JUMP: N-Bit, NOP

  - IR8

    Instruction Register bit 8: JUMP: P-bit, Call

  - IR9

    Instruction Register bit 9: JUMP: R-bit, Return

  - IR25

    Instruction Register bit 25: DISPATCH: L-PC flag.  Alter return
    address pushed on SPC by the CALL transfer type, if the N bit is
    set, to be the address of this instruction rather than the next
    instruction.

  - IR42

    Instruction Register bit 42: POPJ-bit, Return after next
    instruction.

  - JRET

    Jump Return.  Set in a jump instruction with P set and R cleared.

  - IWRITE

    Instruction Write.  Set in a jump instruction with P and R set.

  - IWRITED

    Instruction Write Delayed.  Set in the clock cycle after a jump
    instruction with P and R set.

  - IPOPJ

    Instruction POPJ.  POPJ bit is set and current instruction is not
    NOPed.

  - IGNPOPJ

    Ignore POPJ.  Instruction is a DISPATCH instruction and R-bit is
    cleared.

  - POPJ

    POPJ.  High if the POPJ bit in the current instruction is high and
    the current instruction is not NOPed or if a delayed instruction
    write (IWRITED) is active.

  - JFALSE

    Jump if False.  Instruction is JUMP and condition is inverted.

  - JCALF

    Jump Call if False.  Instruction is JUMP with P-bit set and
    condition inverted.

  - JRETF

    Jump Return if False.  Instruction is JUMP with R-bit set and
    condition inverted.

  - JCOND

    Jump Condition.  Selected based on IR0-IR2, IR5 must be high.

  - FUNCT0

    Miscellaneous Function bit 0.  Decoded from IR10-IR11.

  - FUNCT1

    Miscellaneous Function bit 1.  Decoded from IR10-IR11.

  - FUNCT2

    Miscellaneous Function bit 2.  Decoded from IR10-IR11.  DISPATCH:
    Write dispatch memory.

  - FUNCT3

    Miscellaneous Function bit 3.  Decoded from IR10-IR11.

  - DISPENB

    Dispatch Enabled.  Instruction is DISPATCH but not dispatch write.

  - N

    Next instruction will be NOPed.

  - INOP

    Instruction NOP.  Previous instruction NOPed the current
    instruction.

  - NOPA

    NOP A.  Previous instruction or Spy interface NOPed the current
    instruction.

  - NOP

    Previous instruction, Spy interface or a Trap NOPed the current
    instruction.

  - PCS0

    PC Source bit 0.  False if popj, or dispatch and not fallthrough,
    or jump return if false and jump-condition is false, or jump
    return and jump condition and not jump invert condition.  Used
    together with PCS1 to select the NPC bus source, 0=SPC, 1=IR,
    2=DPC, 3=IPC.

  - PCS1

    PC Source bit 1.  False if popj and not ignore popj, or jump if
    false and not jump condition, or instruction is jump and not
    invert condition and jump condition, or dispatch enabled and R-bit
    but not P-bit.  Used together with PCS0 to select the NPC bus
    source, 0=SPC, 1=IR, 2=DPC, 3=IPC.

  - IPC*

    Incremented PC

  - NPC*

    Next PC

  - SPC*

    Stack PC

  - DPC*

    Dispatch PC

  - LPC*

    Last PC

  - WPC*

    Write PC.  The PC that could be written to the SPC stack.

  - SPCW*

    SPC Write.  The PC value that is written to the SPC stack.

  - RETA*

    Return Address.  The PC value of either the next or the current
    instruction that could be written to the SPC stack.

  - SPCPTR*

    SPC Pointer

  - DESTSPCD

    Destination SPC delayed.  Set in the clock cycle after DESTSPC was
    set.

  - PCC*

    Alias of PC

  - PCB*

    Alias of PC

  - ICE*

    Instruction (Memory) Chip Enable.

  - IOB*

    Instruction (Modify) OR Bus.  OR of instruction from I-MEM and
    Output Bus.

  - DESTIMOD0

    Destination Instruction Modified 0.  Modify the low part of the
    next instruction.

  - DESTIMOD1

    Destination Instruction Modified 1.  Modify the high part of the
    next instruction.

  - IMOD

    Instruction Modified.

  - TRAPA

    Alias of TRAP

  - TRAPB

    Alias of TRAP

  - TRAP

    Set on Parity Error if Traps are enabled via Spy or on Boot Trap.

  - CLK0

    Main clock signal.

  - CLK1

    Alias of CLK0

  - CLK2

    Alias of CLK0

  - CLK3

    Alias of CLK0

  - CLK4

    Alias of CLK0

  - CLK5

    Alias of CLK0

  - TPWP

    TP? Write Pulse

  - TPWPIRAM

    TP? Write Pulse Instruction RAM

  - TPTSE

    TP? Tristate Enable

  - TSE*

    Tristate Enable.  Alias of TPTSE.

  - WP1

    Write Pulse.  Alias of TPWP.

  - WP2

    Write Pulse.  Alias of TPWP.

  - WP3

    Write Pulse.  Alias of TPWP.

  - WP4

    Write Pulse.  Alias of TPWP.

  - WP5

    Write Pulse.  Alias of TPWPIRAM.
