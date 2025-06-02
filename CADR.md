# CADR

Guts from Tom Knight's master thesis [Implementation of a list
processing machine](http://dspace.mit.edu/handle/1721.1/16033).  For a
description of the CADR processor see [The CADR
processor](https://tumbleweed.nu/r/lm-3/uv/cadr.html), by Knight,
Moon, et al.

# The Microprogrammable Processor

This chapter concerns the features of the microprocessor which
executes the Lisp Machine macro instruction set and supports the
macrocode operating environment.  First, we present the design of the
machine in detail, and then come back to consider the aspects of the
design which are unique, and how they help in execution of the macro
instruction set we have just described.

## The Processor

The processor is a synchronous 32 bit wide machine, with two main data
manipulation paths, as shown in figure 4.  On each cycle, a pair of 32
bit operands is fetched onto the A and M busses, an operation
performed on them, and (usually) a 32 bit result written.  The
microprocessor is similar in many respects to a traditional computer,
as distinguished from the majority of microprocessors.  It has, for
example, a traditional incrementing micro program counter, instead of
the more commonly encountered micro instruction next address field.
It is perhaps best compared to a three address (two sources and a
destination) computer with a small address space (the registers) and
extensive secondary memory (the main memory).  The microcode
instruction format is largely vertical, meaning that fields are
decoded differently within different instructions, instead of taking
direct action on the hardware.

## The Microinstructions

There are four major microinstructions, specified by a two bit field.
Each begins with identical specification of operands to drive the A
and M busses.  Two, the ALU instruction and the BYTE instruction,
perform data manipulations on these operands, and then return the
result to a register specified in the micro instruction destination
field.  The other two instructions, JUMP and DISPATCH, do not store
results, but rather affect the flow of control in the processor.  The
format of the microinstruction word for the four main instructions is
shown in figure 5.

## Sources

All cycles begin with uniform fetching of two operands, specified by
two fields in the microinstruction.  This uniformity of register
reference in the micro order code allows fast gating of the register
addresses into the register files following the main clock, an
operation which is in the critical path for the micro cycle length.

The ten bit A source field determines which one of the 1024 possible
internal memory locations will drive the A bus.  The six bit M source
field is more complex.  Values from 0 to 31 specify one of 32 internal
memory locations, identical in contents to, but distinct in
implementation from, the low 32 locations accessible from the A bus.
The remaining values of the M source field specify that the M bus be
driven from a variety of miscellaneous internal registers.  Among
these are the data from main memory, the stack buffer, the Q register
and the micro program counter subroutine return stack.  These special
bus sources will be discussed later in more detail.  Table 1
summarizes the source specifications and figure 6 shows a detailed
datapath diagram of the A and M source section of the processor.

## The ALU Datapath

![Figure 4 Main Data Paths](https://github.com/ams/cadr/assets/7945138/cf6ab70b-f2b1-4443-9f6b-aa41a1f3ef76)

![Figure 5 Micro Instruction Format](https://github.com/ams/cadr/assets/7945138/0e87bcbc-e3f2-44bb-83b9-22ba6980af26)

![Figure 6 Detailed M Bus Block Diagram](https://github.com/ams/cadr/assets/7945138/50760e78-5fc4-45fe-a156-0205d8900f55)

The ALU instruction provides basic arithmetic and logical data
manipulation in the machine.  The two operands supplied on the A and M
busses are gated into an arithmetic logic unit constructed from the
74S181 integrated circuit.  This device provides all sixteen bitwise
logical operations on the operands (such as A∨M, A∧¬M, A, ¬M etc.) and
a variety of arithmetic operations, such as A+M and M-A.  Notable by
its absence is the operation of A-M.  The carry into the low order bit
position is controlled independently by the micro instruction.
Normally, the operation to be performed on the data is specified in a
six bit field in the micro instruction, but in the case of multiply
step and divide step, the function performed is determined in part by
the data being handled.

Divide and multiply use the 32 bit Q register to form extended
precision 64 bit results, The Q shift register is controlled by a two
bit field in the ALU instruction, and can be loaded or shifted left or
right.  Right shifts shift in the low order bit of the ALU output, and
left shifts shift in the complement of the sign of the ALU output,
These shift paths are primarily designed to allow the multiply step
and divide step instructions to take place in one cycle.

The output of the arithmetic logic unit is optionally shifted left or
right by one bit position, and written into the location specified in
the destination field.  Right shifts duplicate the ALU sign bit, and
left shifts insert the high order bit of the Q register,

## The Shifter/Masker Datapath

The shifter/masker datapath provides convenient mechanisms for
extracting, depositing, and moving arbitrary length and position bit
strings within the processor.  The mechanism is implemented in two
stages.  First, the M bus data is routed through a combinatorial
shifter, allowing an arbitrary rotation of the 32 bit word.  This type
of network is sometimes termed a "barrel shifter." The shifter output,
together with the A bus data is routed to the masker.  The masker then
combines these inputs using a bitwise selection of each output bit
from either the rotated shifter output or the A bus data.  The masker
selection is controlled by a 32 bit mask generated by a field in the
microinstruction.  The mask may specify any number of contiguous bits,
positioned any number of bits from the right end of the word.  Two
five bit numbers control the mask generation process.  A single five
bit number specifies the rotation of the M bus data in the shifter.
Three five bit numbers thus control the action of the shifter/masker
datapath.

The useful operations performed in this datapath can, however, be
specified in only two five bit fields.  We observe that the operations
that are most commonly desired are field extraction, with a right
justified result; field deposit, with a right justified M bus source;
and an operation we call selective deposit, which deposits a specified
field of the M bus data into the same size and position field in the A
bus data.

In all of these operations, the right most bit position of the mask
and the amount by which the M bus data is rotated are either the same
(field deposit), or one or the other is zero (field extract has right
bit of mask zero: selective deposit has the rotate zero).  Thus, we
can specify the operation of the masker/shifter with two five bit
fields, plus two bits to control the zeroing of either the rotate or
right bit of mask inputs.

The operations we provide in the datapath are, then:

- Extract Field

  extract a contiguous set of bits from the M bus data, right justify
  it, and replace the rightmost bits of the A bus data with those bits
  to form the result of the instruction.  The mask right most bit
  field is forced to zero, the rotation is taken from the
  microinstruction.

- Deposit Field

  take a right justified field from the M bus data, shift it left some
  amount, and replace the same length field in the A bus data with the
  rotator output to form the result.  Both the rotator input and the
  right most bit of the mask are taken from the microinstruction.

- Selective Deposit

  take a field from the M bus data and replace a similarly located
  field in the A bus data with it to form the result.  The rotate
  input is forced to zero, the right most mask bit location is taken
  from the microinstruction.

As in the ALU instruction, the result is written into locations as
specified in the destination field.

## The Destination Field

The destination field controls where the result of the ALU and Byte
operations is stored.  Two distinct formats for this field exist.  The
first specifies a single address of 10 bits, adequate to specify any
internal memory location.  The second allows two locations to be
written simultaneously.  Five bits specify one of the low 32 internal
memory locations (those accessible from both the A and M busses),
while the remaining five bits specify one of a number of so-called
functional destinations, such as the external main memory write data
and the stack buffer.  Writing certain of the functional destinations
initiates special processor action, such as main memory accesses for
either reads or writes.  The detailed description of the destination
field is shown in table 2.

## Flow of Control

The processor normally executes sequential instructions in the
microprogram memory, much like traditional machine language
architectures.  This normal instruction flow can be interrupted by
execution of either of the two remaining main instruction types, the
conditional jump or the dispatch.  Microinstruction fetch in the
processor is pipelined one level, resulting in the prior fetch of one
instruction after any successful transfer of control.  The programmer
has the option, in these cases, of either executing this instruction
in the normal way, or of discarding the instruction and wasting the
cycle for which it was fetched.

Thus, for example, a two instruction loop could either be written as
this:

```
tag:   <instruction>
       <transfer to tag / inhibit next prefetched instruction>
```

which would execute a total of three processor cycles per loop
execution, or as this:

```
tag:   <transfer to tag/ execute next prefetched instruction>
       <instruction>
```

which loops every two processor cycles.

Most often, useful work can be found for the instruction following the
transfer of control.  All unconditional branches, for example, can be
followed by the initial instruction of the called routine, adjusting
the branched-to-location forward by one.  Due to special logic in the
microsubroutine call/return logic, this can even be done on
unconditional microsubroutine calls, Conditional transfers sometimes
provide a problem in demanding additional cycles, but often the setup
for one of the paths will not be harmful to the other, allowing
optimization in some percentage of the execution paths.

## Jumps

The jump instruction allows conditional transfer of control depending
on a wide variety of internal processor conditions.  Like all other
microinstructions, it specifies two operands for the A and M busses.
Both main datapaths of the machine are used for processing this data.

One class of conditional jumps compares the A and M operands via the
ALU datapath.  The ALU is setup to perform an unconditional subtract
of the A and M bus data.  Special logic detects the all-zero output
condition in the ALU data, and the sign bit of the ALU is also
available for testing.  Thus, this form of the conditional jump may be
made conditional on the A data less than, less than or equal, equal,
greater than, greater than or equal, or not equal to the M operand.
The “always” and “never” conditions are also available here for
completeness.

Several special conditions internal to the processor, such as pending
interrupts and failure of the main memory associative mapping hardware
to produce a match may also be tested.  Table 3 shows the jump field
specifiers available.

A second class of conditional jumps utilizes the shifter matrix for
its conditional test.  The M bus data is rotated by an amount
specified in the microinstruction, and the rightmost bit is tested for
being either a zero or a one.  Thus, any single bit accessible from
the M bus may be tested in one cycle.

The action of the conditional jump instruction upon the processor when
the condition is satisfied is controlled by a three bit field in the
microinstruction.  One of these bits, the N bit, inhibits execution of
the immediately following instruction, wasting the cycle that its
execution would have occupied.

The remaining two bits, the P bit and the R bit, are decoded four ways
to provide different types of transfers,

If both the P and R bits are zero, the processor executes a simple
transfer of control to the location specified in the fourteen bit jump
address field of the microinstruction.

If the P bit is a one, then the transfer is performed as in the
previous case, but the current micro program counter (the PC) is saved
on the micro subroutine return stack (the SPC).  This allows control
to be transfered back to the next instruction in sequence, if desired.
A slight complication of this feature is the interaction between this
and the next instruction execution flow of control, If the following
instruction is executed, then the subroutine should return not to the
instruction following the jump, but to the one after that.  Thus, when
the N bit is off, specifying execution of the following instruction,
the saved PC plus one is saved as the subroutine return, rather than
the PC.

Microsubroutine returns are specified by successful jumps with the P
bit zero and the R bit one.  In this case, the jump field of the
microinstruction word is ignored, the new PC is taken from the top of
the SPC stack and the stack is popped.

The return from microsubroutines is a sufficiently common operation,
and one which is easily enough specified, that an independent,
unconditional mechanism is provided for its execution.  Each
microinstruction has a bit we call the POPJ-AFTER-NEXT bit, which
forces the PC to be loaded from the SPC stack.  It does not inhibit
execution of the following instruction, so the transfer of control
becomes effective after the next instruction is executed.  This saves
both the time and space taken by the common case of returns from
microsubroutines.

The final decoding of the P and R bits specifies a write of the
microinstruction memory.  The sequence of actions necessary to write
microinstruction memory from the running processor is rather complex.
The goal is to load the program counter (which addresses the
microprogram memory) with the address of the location to be written,
then to initiate a write cycle, and then return to the normal
instruction sequence.  Since the PC must be loaded, in many ways the
microinstruction write is similar to a jump, accounting for its place
in the microcode instruction set.

The sequence of events on a cycle by cycle basis follows.  First, the
write instruction loads the PC with the jump address field of the
microinstruction.  Simultaneously, it saves the current PC on the SPC
stack, in the same way a microsubroutine call would.  The following
cycle is normally specified as a NOP with the N bit set in the
instruction specifying the write.  During this cycle, the PC contains
the address of the location to be written, The data (saved from the A
and M bus operands on the previous cycle) is written into the
addressed microinstruction location.  The instruction fetched by the
processor during this cycle is garbage, and will be automatically
NOPed by the processor.  A microsubroutine return is forced during
this cycle, loading the PC with the address of the instruction
following the original write instruction.  The next cycle is NOPed
since its microinstruction register contains invalid data.  During
this cycle, the contents of the location following the original write
is being fetched prior to resumption of normal processor operation on
the next cycle.

## Dispatching

A key operation necessary for emulation of instruction sets is the
ability to transfer to one of several different locations depending
upon the contents of a specified field.  The processor implements this
operation as one of its four basic microinstructions.  Making use of
the same shift matrix as the BYTE instruction, the M bus operand is
rotated by an amount specified in the microinstruction.  The resulting
word is masked to a variable number of low order bits, thus extracting
a particular field of the M operand.  This field is then bitwise ORed
with an eleven bit microinstruction field, called the dispatch offset.
The resulting eleven bit number is used as a table index into the 2048
location dispatch memory.  There, a new program counter, plus a set of
N, P, and R bits, similar in function to the microinstruction bits of
the conditional jump are fetched.  Data flow for the dispatch
instruction is shown in figure 7.

Thus, we allow, conditional on the contents of a specified arbitrarily
placed field, execution of transfers, subroutine calls, or subroutine
returns.  The combination of P = 1 and R = 1 is decoded differently in
the case of dispatch instructions, however.  In dispatches it
indicates that the instruction stream should not be interrupted, and
is said to FALL-THROUGH.  This feature is particularly good in testing
for exceptional conditions, since in the normal case execution will
continue without wasted cycles, while in the special conditions being
tested, the N bit of the dispatch table entry may be specified to
inhibit execution of the following cycle.

The dispatch instruction is also used, with miscellaneous function one
set, to write the dispatch memory contents.  Data to be written is
taken from the low order bits of the M bus operand.

## Main Memory Reference

![Figure 7 Dispatch Datapath](https://github.com/ams/cadr/assets/7945138/62642bbc-b2f0-403f-b8e1-3b2697fc0b61)

References to main memory in the processor are implemented as special
M bus sources and as special functional destinations.

Read memory cycles are initiated by loading the functional destination
VMA-START-READ with the address of the location to be read.  This
initiates a map cycle (see below), and if the map is set up, it starts
a main memory fetch at the physical address specified by the map.  The
processor is free to execute additional microinstructions following
the read cycle initiation.  Testing of map misses and page faults is
recommended as the immediately following cycle.  The processor
accesses the data returned by the memory system with any instruction
specifying READ-MEMORY-DATA as an M source.  If such an instruction is
encountered prior to the availability of the data, the execution of
processor cycles is delayed until the data is ready.  Approximately
three cycles following the initiation of the read are available prior
to the data being ready.

Write cycles may be initiated in one of two different ways.  Two
operands are needed for a write, the memory data and the memory
address.  These may be specified by the functional destinations VMA,
for the address, or MD for the memory write data.  Initiation of the
cycle may be specified along with the loading of either of the
registers by specifying the functional destination VMA-START-WRITE or
MD-START-WRITE.  Again, prior to actually initiating the memory cycle,
the processor executes a map cycle.  The validity of the map entry
should be checked on the cycle following the write initiate by
execution of a conditional jump instruction testing the page fault
condition.  Typical sequences for initiating main memory writes might
look like this:

```
((VMA) M-ADDRESS)                     ;LOAD THE MEMORY ADDRESS REGISTER
                                      ;WITH THE VIRTUAL MEMORY LOCATION
                                      :TO BE WRITTEN
((MD-START-WRITE) M-DATA)             ;LOAD THE WRITE DRTA REGISTER WITH
                                      ;DATA TO BE WRITTEN, START THE WRITE
(CALL-CONDITIONAL PAGE-FAULT
           PAGE-FAULT-HANDLER)        ;TEST FOR MAP MISS OR PAGE FAULT
```

Often this case can be simplified when the VMA register already
contains the correct data, as when a read has just taken place from
the same location.

```
((MD) M-DATA)                         ;LOAD WRITE DATA
((VMA-START-WRITE M-ADDRESS)          ;LOAD VMA, INITIATE WRITE
(CALL-CONDITIONAL PAGE-FAULT
           PAGE-FAULT-HANDLER)        ;TEST FOR MAP MISS OR PAGE FAULT
```

No features of the processor are provided to allow read-pause-write
operation, because of the complexity of the logic required and the use
of a semiconductor based main memory system, where the only advantage
a read-pause-write scheme has is for simple types of multi-process
interlocks, which, in a single processor system, are not required.

## The Map

![Figure 8 Memory Map Data Flow](https://github.com/ams/cadr/assets/7945138/c04458b6-6377-4b4d-a2a9-9978b87b121b)

The processor memory address register can address up to 24 bits of
virtual memory.  A mapping is made prior to read and write requests to
produce a real core address for the reference.  The table relating
virtual to physical core locations is kept in main memory, and certain
entries in that table are duplicated in fast access registers in the
processor.  The 24 bit address is divided into three portions for
purposes of mapping (see figure 8).  The low order eight bits are
passed directly to main memory from the address register, implying a
page size in the system of 256 locations.  The high order eleven bits
of the memory address register index into a table of 2048 entries of
five bits each.  Out of all of these entries, a maximum of 31, each
with a different table value, are non-zero and are designated as
"valid".

The five bits specifying the valid table entry and the remaining
middle five bits of the memory address register form a ten bit address
for access to a 1024 by 20 bit memory, which holds a page table entry.

The page table entry specifies read access, write access, and the
physical page address in core memory.  The real time garbage
collection algorithm which we utilize requires extra bits in the map
entry to specify the nature of the address space which a pointer is
referencing.

The performance of this type of memory map is quite good.  At a
minimum, the map can hold 31 entries of the in-core page table, if
only a single combination of the five middle address bits for each of
the valid 31 first level entries exist.  At its best, the map can hold
31*32 entries of the page table, when each of the 32 combinations of
the middle bits references a valid page table entry.  Due to the
locality of references in the macro compiled code, and in the
linearized list structure, we expect that the second level map will
often contain more than one valid entry per non-zero first level map
combination.

### Map Interface to the Dispatch Instruction

Normally, a memory map is used for performing a translation between
virtual and physical memory locations.  In our processor design, the
map performs not only this function, but also enforces the
oldspace/newspace distinctions of memory pages implied by the Baker
garbage collector.  When unused for mapping newly issued memory
requests, the map address inputs are taken from the memory data
register.  This provides the processor with access to the page table
entry data for the pointer which is in the MD register.  At the
termination of a main memory read cycle, the MD is loaded with new
data from main memory.  The first thing which is done with this data
in the vast majority of cases is to examine the data type of the
entry, and, as required by the Baker garbage collector, to determine
whether it is a new or old space pointer.  With the map entry lookup
on the MD register, the processor has available quickly the new/old
space data for the newly fetched pointer.  A special type of dispatch
instruction may be executed which combines the old/new space map
output bit with the normal field selected by the dispatch instruction
(usually the datatype of the MD) to check in one instruction both the
datatype and old/new space location of the newly fetched data.

### The Stack buffer

The stack buffer provides a sort of cache mechanism for processor
memory references to the top of the macro code stack.  It is a 1024
location register bank internal to the processor, some portion of
which holds the top of the macro code push down list.  On macro
instruction calls and macro instruction returns, one of the
housekeeping activities performed by the micro code is to fill or
empty this register bank from main memory in order to maintain valid
data in the stack buffer.  Thus, between macro code calls and returns,
(i.e.  within a function) all references to the macro code stack can
refer instead to the contents of this register bank.

Note that, unlike a cache, the data in the stack buffer is required to
be present.  There is no probabilistic element in its utility.  The
stack buffer performs best in situations where the execution trace is
relatively shallow, that is, has many function calls and returns at
nearly the same level on the stack.  This requirement is almost always
satisfied in real programs.  If this requirement is not met, the stack
buffer mechanism results in effectively moving the location of the
memory read or write, with no saving in time.

The stack buffer is implemented as a 1K by 32 static RAM array
addressed by two ten bit pointers.  One pointer is an up/down counter,
used to address the top of the macro stack within the stack buffer,
the other pointer is a fixed register which can be loaded in order to
index into a fixed location in the buffer.  It is intended for use in
applications where the processor wishes to access, for instance, the
third element back from the top of the stack.

Special M source locations provide convenient access to data from the
stack buffer indexed by either of these pointers, The up/down counter
may be optionally decremented after a fetch of data, providing the
macro code “pop” operation at the microcode level.

Likewise, special functional destinations provide for writing into the
stack buffers, indexed by either of the pointers, and the up/down
counter may be incremented prior to the write, providing the “push”
operation.

On a macro function call, the microcode checks that at least some
minimum amount of data space in the stack buffer is free, such that
the called function can push data on the stack without further checks.
If there is no free space, a portion of the stack buffer data is
written into main memory, creating free space.

On macro function returns, the microcode checks that at least the
entire stack frame being returned to is resident in the stack buffer,
again assuring that all referenced data is within the stack buffer.

Main memory references to locations which are currently held in the
stack buffer are intercepted by the microcode by making the pages upon
which the data resides “invalid” in the page map.  Thus, the rare
reference to those locations by other than pushing or popping data in
the macro code instruction stream can be caught and interpreted as a
reference to the data held in the stack buffer.

### Unibus references

The 22 physical address bits from the processor drive a 32 data bit
main memory bus which we call the XBUS.  Additionally, 1/32 of the
processor physical address space is occupied by the address space of
the Unibus.  References to this portion of the physical address space
initiate 16 bit reads or writes on the processor Unibus.  The data for
these transfers is supplied from and returned to the right most 16
bits of the 32 bit processor word.

Unibus devices may reference the main processor memory via the XBUS.
This ability is important if, as in the prototype, we wish to use
Unibus compatible devices for disk swapping of main memory.  A problem
encountered in this mode of operation is that the Unibus transfers
only 16 bits at a time, while the XBUS transfers are 32 bits wide.
This problem is solved by having the Unibus interface buffer the even
Unibus word on writes, and the odd Unibus words on reads from the main
memory.  The alternative approach of cycling the XBUS memories twice
per 32 bit word transfered would not have transfered quickly enough to
keep up with the disk.

Unibus devices also require an address translation mechanism to allow
them access to the full address space of the XBUS.  The Unibus address
space of 17 bits (of 16 bit words) is not adequate for addressing the
much larger XBUS space.  Further, as pages are transfered to and from
memory, the mapping from processor virtual address space to physical
location in XBUS address space becomes complex.  For these reasons, we
provide a mapping register between the Unibus address space and the
XBUS address space.  This mapping register is itself a Unibus device,
and can be loaded by either the processor, through its access to the
Unibus address space, or by any Unibus device.

### The Macro Program Counter and Automatic Macro Instruction Fetch

The main macro instruction execution loop in the microcode
sequentially fetches and decodes the 16 bit macro instructions from
the function entry frame.  If this process was coded with the normal
microcode instruction set, the resulting loop would include such
overhead items as the macro program counter increment, the loading of
the VMA with the macro program counter, and a set of moderately
complex routines associated with the branch instruction microcode to
handle the cases of transfer to macro instructions which do not fall
on a 32 bit word boundary.

Many of these overhead items are handled automatically by this
processor as built in functions.  The main added feature is the
inclusion of a macro program counter, called the LC (location counter)
to distinguish it from the micro program counter.  During execution of
a macro instruction, the LC register holds the byte address of the
macro instruction to be executed next.  At the completion of execution
of the currently executing macro instruction, the incrementing,
overflow testing, and main memory references resulting from overflows
are automatically performed on this register.

Normally, the word containing the currently executing macro
instruction is held in an M memory location, so that byte and dispatch
access to its fields is easily obtained.  In the current software
system, each macrocode instruction is 16 bits long, packed two per 32
bit word.  The half of this word which is referenced by microcoded
byte or dispatch instructions is determined by combining the shift
specified in those instructions, with an additional bit from the LC
register, thus effectively “shifting” the macrocode instruction when
the LC register is incremented.  This modification of the shift field
in byte, dispatch, and bit test jumps is enabled by a miscellaneous
function field value of three.

For generality in emulating future, possibly different macro
instruction sets, a feature is provided for packing four eight bit
macro instructions per 32 bit word.  The LC register thus holds an
eight bit byte address for a macro instruction.  In normal emulation
of the Lisp system microcode, the hardware forces the low order bit
zero and increments this register by two.

Two mechanisms trigger an increment of the LC register.  First, since
the main emulation loop performs a microsubroutine call to the routine
which executes its instruction, the return following execution is by
means of a POPJ instruction.  The return address stored by the main
loop on this top level call is explicitly loaded into the SPC
register, and contains, in addition to the normal return address, a
special tag bit which identifies this POPJ as the finish of a macro
instruction execution, which in turn activates the LC increment
sequence.  The second way in which this sequence may be activated, is
a dispatch instruction with one of the otherwise unused bits set.
This feature is useful in the case where immediate information is
stored as part of the macro instruction stream (for example, the
extended branch offset).  The dispatch path allows the LC to be
incremented past these extended instructions without awkward special
case programming.

In the normal case, incrementing the LC register will merely advance
the low order bits of the LC, thus changing the behaviour of the
specially marked byte, dispatch, and bit test jump instructions.  When
the LC counter overflows the end of the previously fetched macro
instruction word, however, a new word must be fetched.  In this case,
the LC register, shifted right by two (making a word address) is
automatically loaded into the VMA register, and a read cycle is
initiated.

Two other actions must be performed, however.  The specified read
cycle may cause a page fault, so the page fault indicator must be
tested - and when the data is finally available, it must be transfered
from the MD into the M location holding the macro instruction word.
These functions are performed with a pair of microcode instructions
which immediately precede the main emulator microcode.  When the
incrementing of the LC as a result of the finish of a macro
instruction fails to overflow, the microprogram counter loaded from
the SPC is modified by ORing a one into bit 1 of the return PC.  This
effectively jumps over the two instructions which, when performing a
memory cycle, test for page faults and transfer the data,

Macrocode branching is vastly simplified with this hardware, because,
whenever the LC register is loaded from the main data paths (which
amounts to a macro code branch), a flag is set to force a new fetch
the next time the LC is incremented, regardless of whether the counter
overflowed.

It should be emphasized that the presence of this hardware in the
machine, which is admittedly very specialized to performing a
particular emulation task, does not force the programmer to make use
of it; it merely provides a convenient and efficient mechanism for a
common inner loop.

### Micro Instruction Modification

It is often necessary to modify the actions of microinstructions as a
result of data passing through the main processor data paths.  An
example of such a case might be the Lisp function LSH, which performs
a logical shift of an integer.  Here, we must fetch an integer, shift
it an amount dependent on the argument of the function, and store the
result.  The architecture as presented so far provides only clumsy
mechanisms for this operation.  What we would like to do is to modify
a shift instruction to specify the amount of bit shift, execute it,
and store the results.  Another example is the operation of storing
and restoring the processor state around an interrupt or page fault.
Here, we would like to cycle through all of the processor registers,
save or restore their contents, and loop.  For this to work, we need a
technique for modifying the register address contained in the
microinstruction.

The solution we implemented for this problem is a technique due to
Fuller, first used in the PDP-11/40E.  We observe that, due to the
overlapped fetch of the next microinstruction with the execution of
this one, just prior to clocking a new microinstruction, both the data
on the output bus, and the next microinstruction to be executed are
simultaneously available.  If we OR this data together, then we can
create a modified microinstruction, suitable for clocking into the
instruction register.  In effect, this allows a microinstruction to
selectively modify its successor.  The feature is enabled by
specifying two “destinations” for the output bus data, one for bits in
the high half of the microinstruction word (specifying the source and
destination registers), and one for the low half of the
microinstruction word (specifying the exact operation to be
performed).  Since the modifying instruction can be a deposit byte
operation, shifting the source data to an appropriate location for
doing the modification, we have a very effective technique for
variablizing the execution of a microinstruction.

### Diagnostic processor features

Another important device on the Unibus is the debugging interface for
the processor.  It provides an access path to the internal processor
registers so that an external computer, such as a PDP-11, or a second
Lisp Machine system, can assist in debugging the processor.  The
processor has no lights or switches interfaced, so the sole method of
influencing or observing its behaviour is through this interface.  The
method by which the debugging processor influences that behaviour is
by loading and executing microinstructions through a path independent
of the normal control memory.  Clock control is provided, so that the
debugging processor can single step and start and stop the processor.
The path by which the processor control memory is initially loaded is
by execution of normal control memory write instructions loaded by the
diagnostic processor.

Observational paths are considerably more common.  The A, M and output
busses, the program counter, and the instruction register can be
directly observed, and by loading the appropriate microinstruction
which references other processor registers, the contents of these
registers may be observed on one of these directly accessible paths.

# Print Set and Commentary

## Clock Generation

The main clock for the processor is of approximately 180 nanosecond
period, with roughly equal phases.  The processor registers are
clocked on the rising edge of this waveform, which marks the beginning
of a new processor cycle.

Memory devices in the processor requiring write pulses are written by
a write pulse occurring during the second (low) phase of the main
processor clock.

These fundamental timing signals are generated by the circuity on the
CLOCK1 and CLOCK2 prints.  Initially, the cross coupled nand flip flop
in the upper left corner of the CLOCK1 print is set, either by
completion of the previous cycle or by power up reset of the
processor.  In the absence of the HANG signal indicating a main memory
response delay, the rising edge of the CYCLECOMPLETED flip flop
travels down the series of tapped delay lines, producing the sequence
of TPRxx signals.  TPR40 is used to clear CYCLECOMPLETED, establishing
the width of the pulse in the delay lines at about 40 nanoseconds.

The rising edge of the main processor clock is produced by TPR0, which
sets the TPCLK flip flop on the CLOCK2 print.  Depending upon the
speed with which the processor is running, a selected pulse from the
TPRxx chain is gated into TPREND, which both clears TPCLK,
establishing the time of fall for the main processor clock, and
initiates the TPWxx delay line pulse.  The TPWxx timing chain is used
to produce the processor write pulse, and TPDONE which sets
CYCLECOMPLETED in preparation for a new processor cycle.

Buffering and gating of the main clock signals is done on the CLOCK2
print.  The TPCLK and TPWP flip flop outputs are gated with the
MACHRUN signal (processor running) to produce the final processor
clock and write pulse.  These are buffered once here in the clock
circuitry, and once again local to their use in the processor, as
shown in the CLOCKD print.

Two other timing signals are generated from the main timing chain.

TPWPIRAM is used to produce a slightly wider and earlier write pulse
for the control memory rams.  TPTSE is a signal generated during the
very first part of each processor cycle which disables all tristate
drivers on the M and A busses, preventing noise problems due to
tristate enable overlaps caused by instruction decoding skews.

The choice of a delay line clock generator rather than a totally
synchronous crystal oscillator generator was based on a desire to
allow the processor to “hang” waiting for a main memory response, and
then immediately resume when the data was available.  With a totally
synchronous design, the delay before the available data could be used
might be quite high due to synchronizer problems and quantization of
time in units of the fastest oscillator interval.

  - [CADR; CLOCK1](http://tumbleweed.nu/lm-3/schematics/cadr/clock1.png) // CLOCK1 --- MASTER CLOCK 
  - [CADR; CLOCK2](http://tumbleweed.nu/lm-3/schematics/cadr/clock2.png) // CLOCK2 --- MASTER CLOCK 
  - [CADR; CLOCKD](http://tumbleweed.nu/lm-3/schematics/cadr/clockd.png) // CLOCKD --- CLOCK DISTRIBUTION 

## Microinstruction Fetch

During each microcycle, the fetch of the next microinstruction to be
executed is taking place.  The PC contains the address of this next
microinstruction.  The ICTL print shows the decoding and initial
buffering of the PC for driving the control memory address lines.  A
portion of the control memory itself is shown on the IRAM00 through
IRAM03 prints.  The microinstruction fetched is 49 bits wide,
including the parity bit.  The IWR print shows the register used to
hold data which is about to be written into control memory (the A and
M bus data from the control memory write instruction).  The control
memory write pulses are produced and buffered as shown on the ICTL
print,

Two other sources of microinstructions exist.  The first is the
permanent PROM control memory, which is normally only active during
the processor initial bootstrap.  It is 1K by 48, the additional bit
being forced to zero.  The address buffering and enable logic is shown
on the PCTL print, while the proms themselves are shown on the PROM0
and PROM1 prints.

The second additional source of microinstructions is from a register
loadable from the console computer interface.  This source allows the
debugging computer to execute arbitrary instructions on the processor,
exercising its datapaths, and allowing access to internal processor
state which is not directly readable through other console computer
paths.  The execution of microinstructions through this path is the
main mechanism by which the console computer exerts control over the
processor.

  - [CADR; ICTL](http://tumbleweed.nu/lm-3/schematics/cadr/ictl.png) // ICTL --- I RAM CONTROL 
  - [CADR; IRAM00](http://tumbleweed.nu/lm-3/schematics/cadr/iram00.png) 
  - [CADR; IRAM01](http://tumbleweed.nu/lm-3/schematics/cadr/iram01.png) 
  - [CADR; IRAM02](http://tumbleweed.nu/lm-3/schematics/cadr/iram02.png) 
  - [CADR; IRAM03](http://tumbleweed.nu/lm-3/schematics/cadr/iram03.png) 
  - [CADR; IWR](http://tumbleweed.nu/lm-3/schematics/cadr/iwr.png) // IWR --- INSTRUCTION WRITE REGISTER 
  - [CADR; PCTL](http://tumbleweed.nu/lm-3/schematics/cadr/pctl.png) // PCTL --- PROM CONTROL 
  - [CADR; PROM0](http://tumbleweed.nu/lm-3/schematics/cadr/prom0.png) 
  - [CADR; PROM1](http://tumbleweed.nu/lm-3/schematics/cadr/prom1.png) 
  - [CADR; DEBUG](http://tumbleweed.nu/lm-3/schematics/cadr/debug.png) // DEBUG --- PDP11 DEBUG INSTRUCTION 

## Microinstrction Modification and Main Instruction Register

The fetched microinstruction word can potentially be modified by the
result of the previously executed microinstruction.  This is
implemented on the IOR print by inclusively ORing the main output bus
(OBx) with the output of control memory (Ixx) to produce the IOBxx
modified signals.  The main processor instruction register on the IREG
print conditionally selects either the modified or unmodified result,
depending upon whether the instruction modification feature has been
activated.  The clocking of a new instruction into the IR register
marks the initiation of execution for the new microinstruction.

  - [CADR; IOR](http://tumbleweed.nu/lm-3/schematics/cadr/ior.png) // IOR --- INST. MODIFY OR 
  - [CADR; IREG](http://tumbleweed.nu/lm-3/schematics/cadr/ireg.png) // IREG --- INSTRUCTION REGISTER 

## IR Decoding

For the most part, the processor is designed so that the initial phase
of microinstruction execution is independent of the details of the
particular instruction.  The decoding of the IR fields, then, as shown
on the SOURCE print is not in the critical path of cycle timing.

The four main instructions are decoded from a pair of IR bits,
providing the IRBYTE, IRALU, IRJUMP and IRDISP conditions.  All of
these are inhibited if the execution of this cycle is NOP’d.

The SRCxxx conditions specify a particular source of M bus data.
These are activated only if a normal M memory location is not
specified (IR31 set).

The destination codes are not needed until quite late in a cycle and
are decoded in several stages.  First, only the IRBYTE and IRALU
instructions specify destinations, producing the DEST signal.  Next,
only destination codes with bit IR25 clear specify an M register
address (less than 32.) producing DESTM.  These, of course, also
specify a functional destination, which is decoded from IR19 to IR22.
If IR23 is on, the functional destination is to either the VMA or MD
register, and the memory subroutine further decodes this field.

  - [CADR; SOURCE](http://tumbleweed.nu/lm-3/schematics/cadr/source.png) // SOURCE --- SOURCE, DEST, OP DECODE 

## A Memory

All instructions begin with the fetching of data from the M and A
busses.  Regardless of whether the data will be used, data is fetched
from all of the memories in the machine at the beginning of each
cycle.

In the A memory, the data fetch begins with the high phase of the
clock selecting IR bits 41-32 for driving the A memory address lines
(AADRxx), as shown on the ACTL print.  Simultaneously, the A memory
address is compared with the A memory write address from the previous
cycle, in order to detect the situation in which a read is being
performed on a location which has yet to be written.  The APASS signal
indicates that this condition has occurred.

After the address access time of the A memory rams (shown on AMEM0 and
AMEM1), the AMEMxx signals are valid at the input of the A memory
latch (print ALATCH).  Either this data or the contents of the L
register (which stores the yet to be written result of the previous
instruction) is driven onto the A bus as determined by the APASS
signal (AMEMENB and APASSENB on ACTL).

When the main clock falls, the A memory latches close, holding the
output of the A memory for the remainder of the cycle.  Data from the
L register will of course be valid throughout the cycle.

Simultaneously, the A memory address selector (ACTL) selects the
previous cycle’s write address as the A memory address.  If the
previous cycle specified an A memory destination (DEST) then an A
memory write pulse is generated (AWPx) writing the data from the
previous cycle.

  - [CADR; ACTL](http://tumbleweed.nu/lm-3/schematics/cadr/actl.png) // ACTL --- A CONTROL 
  - [CADR; AMEM0](http://tumbleweed.nu/lm-3/schematics/cadr/amem0.png) -- missing 
  - [CADR; AMEM1](http://tumbleweed.nu/lm-3/schematics/cadr/amem1.png) 
  - [CADR; ALATCH](http://tumbleweed.nu/lm-3/schematics/cadr/alatch.png) // ALATCH --- A MEMORY LATCH 

## M Memory

Timing of M memory fetches and writes is very similar to timing of the
A memory, and is shown on the MCTL, MMEM, MLATCH prints.

The major difference is a two-level buffering of the M bus data,
introduced for loading reasons.  The M bus is split into two parts: a
short bus, unbuffered for “slow” sources, and a long bus, buffered,
for “fast” sources.  The short bus, labeled Mxx, is driven from the M
memory latches, the PDL buffer latches, the SPC latches, and from the
buffered outputs of the long bus.  The long bus, labelled MFxx is
driven from all of the remaining M bus sources, including the L
register output, which is used for the pass around path.  The MFxx to
Mxx buffers are shown on the MF print.

  - [CADR; MCTL](http://tumbleweed.nu/lm-3/schematics/cadr/mctl.png) // MCTL --- M CONTROL 
  - [CADR; MMEM](http://tumbleweed.nu/lm-3/schematics/cadr/mmem.png) // MMEM --- M MEMORY 
  - [CADR; MLATCH](http://tumbleweed.nu/lm-3/schematics/cadr/mlatch.png) // MLATCH --- M MEMORY LATCH 
  - [CADR; MF](http://tumbleweed.nu/lm-3/schematics/cadr/mf.png) // MF --- DRIVE MF ONTO M 

## Stack Buffer

The stack buffer is addressed from one of two registers, the PDLPTR or
the PDLIDX.  The PDLCTL print shows the address selector for the
buffer.  During the first half of a cycle, the buffer performs a read
from either the address contained in the PDLPTR or the address
contained in the PDLIDX controlled by IR bit 30.  The output of the
buffer memories (shown on PDL0 and PDL1) drive the inputs of the
latches shown on the PLATCH print.  When the clock falls, this set of
latches holds the output of the buffer for the remainder of the cycle,
The latch output is driven onto the Mxx lines as an M source if the M
source field contains either SRCPDL or SRCPDLPOP.

The stack buffer address lines also change when the clock falls,
switching the address so that the results of the previous cycle’s
write in the stack buffer may be performed.  If a write is to occur,
the PWPx write pulses are produced.

The PDLIDX and PDLPTR registers are conditionally loaded directly from
the output bus at the rising edge of the main clock.  In addition, the
PDLPTR register can conditionally count up or down by one to perform
the push and pop operations.  Due to the delay in performing the write
until the succeeding cycle, the post-decrement pop and pre-increment
push occur automatically due to the intervening rising clock edge.
Since pushing and immediately popping data on the stack is a rather
meaningless exercise, there is no facility in the stack buffer for
performing data passarounds.  As a result, it is possible to produce
nominally correct, although inefficient, code which will function
incorrectly.

Either the PDLPTR or PDLIDX may be read onto the M bus as fast sources
buffered through the MF buffers.

  - [CADR; PDLPTR](http://tumbleweed.nu/lm-3/schematics/cadr/pdlptr.png) // PDLPTR --- PDL INDEX AND POINTER 
  - [CADR; PDLCTL](http://tumbleweed.nu/lm-3/schematics/cadr/pdlctl.png) // PDLCTL --- PDL BUFFER CONTROL 
  - [CADR; PDL0](http://tumbleweed.nu/lm-3/schematics/cadr/pdl0.png) 
  - [CADR; PDL1](http://tumbleweed.nu/lm-3/schematics/cadr/pdl1.png) 
  - [CADR; PLATCH](http://tumbleweed.nu/lm-3/schematics/cadr/platch.png) // PLATCH --- PDL BUFFER LATCH 

## The Shifter/Masker

The A and M bus data drive both the ALU and the shifter/masker.  The
shifter is controlled by a five bit shift field generated on the SMCTL
print.  The shift is usually specified from IR4-IR0, but this
selection can be modified in two ways.  In the selective deposit
instruction, the shift of the M source is forced zero, by setting IR
bit 12 in a byte instruction.  In instructions referencing
macroinstruction byte streams of 8 or 16 bit words, the shift can be
modified in bits 4 and 3 by the contents of the macro program counter
(LCC) if the miscellaneous function 3 is selected (IR bits 10 and 11
on).  This allows instructions referencing a word containing this data
to be automatically shifted to examine the correct byte with no extra
cycles for performing shifts.

The specified five bit shift field is used to control a 32 x 32 shift
matrix set up as a rotator, as shown on the SHIFT0 and SHIFT1 prints.

The output of the shifter (Rxx) is used to drive both the masker and
the dispatch table address inputs,

The masker performs a bitwise selection between the output of the
rotator and the A bus data.  The selection is based on a third 32 bit
number, the mask (MSKxx).  This number is produced from a set of two
32 x 32 programmable read only memories (print MSKGEN), whose contents
are OR'd.  Each set contains a triangular bit pattern, working from
left to right in one set, and from right to left in the other.

The address inputs to these proms represent the left and right bit
positions of the selected field.  The right bit position is either
zero or the same as the input to the shift matrix, as controlled by
bit 13 in a byte instruction,

The left bit position is always produced by adding the contents of IR9
to IR5 to the right bit position.  Thus, these IR bits control the
width of the masked field.

The actual masking operation requires both polarities of the mask, and
is performed with the non-inverting and/or gate as shown on the MASK
print.  This is one of the more inefficient areas of the processor
from a package count standpoint, primarily because there is no package
efficient and fast device for implementing the bitwise select
operation.

  - [CADR; SMCTL](http://tumbleweed.nu/lm-3/schematics/cadr/smctl.png) // SMCTL --- SHIFT/MASK CONTROL 
  - [CADR; SHIFT0](http://tumbleweed.nu/lm-3/schematics/cadr/shift0.png) 
  - [CADR; SHIFT1](http://tumbleweed.nu/lm-3/schematics/cadr/shift1.png) 
  - [CADR; MSKGEN](http://tumbleweed.nu/lm-3/schematics/cadr/mskgen.png) -- missing; MSKG4 in CADR 
  - [CADR; MASK](http://tumbleweed.nu/lm-3/schematics/cadr/mask.png)   -- missing; not used in CADR? 

## The ALU

The ALU performs the basic arithmetic in the machine.  It consists of
a set of nine 4 bit arithmetic chips, with two levels of fast carry
extenders.  The A and M busses drive the two inputs of the ALU
directly.  The function performed by the ALU is controlled by the set
of selectors shown on the ALUCRY print.  For the normal ALU
instruction, the function, mode, and carry inputs are controlled by
bits in the IR,

Three “hardwired” functions are also provided, by other selector
inputs.  One is a hardwired add of the A and M bus data, invoked by
both multiply step and divide step under the appropriate circumstances
(controlled by the ALUADD signal).  Another is the subtract operation,
invoked conditionally by the divide operation, and unconditionally by
all jump instructions (ALUSUB).  The jump instruction subtracts the A
and M bus data, allowing an examination of the sign and equality
condition code outputs of the ALU.  The third hardwired function
simply passes A memory data through, and is used as the NOP cycle
during an inactive multiply step (both ALUSUB and ALUADD asserted).

  - [CADR; ALUCRY](http://tumbleweed.nu/lm-3/schematics/cadr/alucry.png) -- ALUC4 in CADR 
  - [CADR; ALU0](http://tumbleweed.nu/lm-3/schematics/cadr/alu0.png) 
  - [CADR; ALU1](http://tumbleweed.nu/lm-3/schematics/cadr/alu1.png) 

## The Q Register

The Q register forms the remainder of the multiply-step and
divide-step hardware.  It stores low order product bits as they are
produced by the multiply step, and is used to store both dividend and
quotient bits during a divide step operation.  It consists of a 32 bit
shift register which can be loaded from the ALU output, shifted left,
or shifted right.  It is controlled by IR1 and IR0 in an ALU
instruction (QCTL).  It acts as a fast source on the M bus, and is
altered on the rising edge of the main clock.

Shifts in from the left are from the low order bit of the ALU (useful
for the multiply step), while shifts in from the right are from the
complement of the sign of the ALU output, which is the correct data
for the partial quotient in a divide step.

  - [CADR; QCTL](http://tumbleweed.nu/lm-3/schematics/cadr/qctl.png) // QCTL --- Q REGISTER CONTROL 
  - [CADR; Q](http://tumbleweed.nu/lm-3/schematics/cadr/q.png)	   // Q --- Q REGISTER 

## The Output Bus

The primary result of either BYTE or ALU instructions is placed on the
output bus (OBx).  The output bus is heavily loaded, and drives all of
the processor registers, except the Q, which are clocked on the rising
edge of the main clock.  During BYTE instructions, the output bus
selector is forced to pass data from the masker (ALUCRY print).
Otherwise, the selector is controlled by bits 12 and 13 in an ALU
instruction.  The selector may select either the unshifted ALU output,
which is the normal case, or the ALU output shifted left by one, with
the low bit coming from the high order bit of the Q, or the ALU output
shifted right by one, with the high order bit coming from the one bit
ALU extension,

The output bus bit shifting paths are again chosen to make the
multiply step and divide step operations occur in a single cycle.

  - [CADR; OB](http://tumbleweed.nu/lm-3/schematics/cadr/ob.png) -- missing; not used in CADR? 

## The L Register

The L register provides a clocked version of the output bus data from
the previous cycle.  It is used as the source of write data for all of
the memories which are written with write pulses in the second half of
the succeeding cycle, and as a source of operand data on the A or M
bus when the passaround logic is activated by sequential write-read
instructions to the same memory location.

  - [CADR; L](http://tumbleweed.nu/lm-3/schematics/cadr/l.png) // L --- A CONTROL 

## The Dispatch Memory

The dispatch memory is used to produce new program counter values as a
result of data flowing through the processor.  Qutputs of the shifter
(Rxx) are AND'd with a dispatch byte length mask, and OR'd with an
eleven bit field from the IR to form the dispatch memory address,
DADRxx (left hand side of DRAM0,1,2).  Bit zero of ihe dispatch
address additionally may be taken from the output of the memory map
(see below).  The mask used for selecting the dispatch byte length is
located on the DSPCTL print, as are the buffers for A bus data which
is used for writing into dispatch memory.  The dispatch memory, unlike
all other memories in the machine, is loaded in the same instruction
which specifies the write, since its output is needed late in the
cycle and cannot be latched as can the other processor memory outputs.

Output of the dispatch memory is a new 14 bit program counter value
and three additional bits, DN, DP, and DR, which control the type of
transfer performed (see control discussion below).

  - [CADR; DSPCTL](http://tumbleweed.nu/lm-3/schematics/cadr/dspctl.png) // DSPCTL --- DISPATCH CONTROL 
  - [CADR; DRAM0](http://tumbleweed.nu/lm-3/schematics/cadr/dram0.png) 
  - [CADR; DRAM1](http://tumbleweed.nu/lm-3/schematics/cadr/dram1.png) 
  - [CADR; DRAM2](http://tumbleweed.nu/lm-3/schematics/cadr/dram2.png) 

## Jump Conditions

The FLAG print shows the jump condition selector, which is used to
determine what controls the success of a conditional jump.  If IR bit
5 is zero, the low bit of the rotator output (R0) is selected, and the
field IR4-0 is used for controlling the rotator.  Otherwise, bits 2-0
control the jump selector, which examines the ALU sign and equal zero
outputs in various combinations to provide arithmetic compares.  The
selector also has access to the page fault condition (-VMAOK) and
combinations of it with interrupt and sequence break conditions, so
that these combinations may be easily tested in a single cycle.

  - [CADR; FLAG](http://tumbleweed.nu/lm-3/schematics/cadr/flag.png) // FLAG --- FLAGS, CONDITIONALS 

## Flow of Control

The CONTRL print implements the different types of jump and dispatch
transfers.  Three sources influence the transfer of control: the jump
instruction data, the dispatch instruction data, and the
POPJ-AFTER-NEXT bit.

The jump instruction is further decoded into special cases prior to
the availability of the condition output.  For the PC source, the jump
selects between IPC (no jump), IR (jump or call) and SPC data
(return).  If the transfer is taken, the value of IR7 is selected for
N, which controls execution of the following instruction.

The dispatch instruction similarly specifies with DP and DR, the PC
source and N outputs, selecting the new PC from DPCxx (output of the
dispatch memory), IPC (fall through) or SPC (return).  The N bit is
driven directly from the DN output of the dispatch memory,

  - [CADR; CONTRL](http://tumbleweed.nu/lm-3/schematics/cadr/contrl.png) // CONTRL --- PC, SPC CONTROL 

## Microcode Subroutine Return Stack

The return address for micro subroutine calls is kept in the 32 entry
SPC memory.  This memory is addressed by a five bit counter, the
SPCPTR.  On micro subroutine calls, this counter is advanced, and the
subroutine return address is written into the memory.  This address
may be one of four quantities, the current PC, the incremented PC, the
previous PC, or the L register contents.

The decision as to which PC to write on a call is based on whether the
call specified execution of the following instruction (PC or IPC) and
on whether it is an error catching dispatch, with the intention of
allowing retry (LPC).  Writing into the memory from the L register
allows normal restoration of processor state information, as well as
allowing the machine to set the special flags in the left half of the
SPC register.  One of these flags activates the macroinstruction
prefetch mechanism when a return is executed with that bit set.

The data contained in the SPC memory is read in two independent paths,
one driving the M bus, and the other driving the inputs to the next PC
selector (NPC).  This allows the stack data to be read from the main
data paths, and to be used as a return address in jump and dispatch
instructions.  Pass around paths are provided on the SPC output path
to the NPC selector, but are missing on the M memory path, since the
data is available from other registers in the machine after an SPC
write cycle.

  - [CADR; SPC](http://tumbleweed.nu/lm-3/schematics/cadr/spc.png) // SPC --- SPC MEMORY AND POINTER 
  - [CADR; SPCLCH](http://tumbleweed.nu/lm-3/schematics/cadr/spclch.png) // SPCLCH --- SPC MEMORY LATCH 
  - [CADR; SPCM](http://tumbleweed.nu/lm-3/schematics/cadr/spcm.png) -- missing; SPCW in CADR 
  - CADR; LPC				   // LPC --- LAST PC
  - [CADR; LPC0](http://tumbleweed.nu/lm-3/schematics/cadr/lpc0.png] // not used in CADR? 

## Next PC Selector

The NPC selector determines the location of the next microinstruction
fetch.  It loads one of four potential sources for the next program
counter into the PC register, whose contents directly drive the
microinstruction memory addresses.  The four sources are the output of
the SPC stack (SPC), the instruction register (IR), the dispatch
memory outputs (DPC) and the incremented PC (IPC).  The PC may also be
forced to a zero by the TRAP signal, used for initial bootstrap, and
main memory parity errors.  The output of the NPC selector is loaded
on each clock into the PC register, and the incremented PC is
developed with an adder chain from the PC register.

  - [CADR; NPC](http://tumbleweed.nu/lm-3/schematics/cadr/npc.png) // NPC --- NPC,IPC,PC 

## The LC register and Instruction Prefetch

The LC register provides an efficient mechanism for executing 16 bit
and 8 bit macro instruction streams with the processor.  LC contains
the byte address of the next macroinstruction to be executed.  When
the SPC return memory flag specifying the end of a macroinstruction
execution is set, the contents of LC are incremented by one or two
(depending on the 8/16 bit instruction flag).  Then, if the last byte
of the macro instruction was just used, a main memory fetch is
initiated, loading the memory address register from the LC register,
shifted right by two.

During the course of macroinstruction execution, the LC register
contents influence execution of all microinstructions with the
miscellaneous field set to three.  This specifies that the shift and
mask select for the current operation is operating on a macro
instruction word, and the value of the shift field is to be modified
according to the low order bits of the LC, resulting in the selection
of the proper half or quarter of the macro instruction word as data in
the modified microinstruction.

  - [CADR; LC](http://tumbleweed.nu/lm-3/schematics/cadr/lc.png)	 // LC --- LOCATION COUNTER 
  - [CADR; LCC](http://tumbleweed.nu/lm-3/schematics/cadr/lcc.png) // LCC --- LC CONTROL 

## The VMA and VMA Selector

The VMA is a 32 bit register which holds the virtual memory address
being fetched by the processor.  It is normally loaded from the output
bus, but may also be loaded during the macroinstruction prefetch
sequence from the (shifted) LC register contents.  The output of the
VMA may drive the MF bus for access from the main data paths.

During one cycle prior to the initiation of a main memory cycle, the
output of the VMA drives the virtual memory map inputs though the MAPI
selector.  This takes bits 23 though 8 (the virtual page number) and
maps them into a physical page number.  Bits 7 through 0 are passed
directly to the memory system as an offset within the page.

  - [CADR; VMA](http://tumbleweed.nu/lm-3/schematics/cadr/vma.png) // VMA --- VMA REGISTER 
  - [CADR; VMAS](http://tumbleweed.nu/lm-3/schematics/cadr/vmas.png) // VMAS --- VMA INPUT SELECTOR 

## The MD and the MD Selector

The MD is a 32 bit register holding the contents of a main memory word
which is being read or written.  Data is loaded into the MD from
either the main memory system (through the MEM bus) or from the output
bus.  Output of the MD register drives the MEM bus (for memory
writes), the MF bus for access from the main processor data paths, and
the virtual page map input selector.

Access to the virtual memory map is provided so that the operation of
checking the data type and newspace/oldspace pointer location can be
effectively done simultaneously.  Normally the map input selector is
driven from the MD register, allowing newly fetched data coming into
the MD to be looked up in the map and drive the main data paths for
the dispatch instruction on the data type simultaneously.

  - [CADR; MD](http://tumbleweed.nu/lm-3/schematics/cadr/md.png) // MD --- MEMORY DATA REGISTER 
  - [CADR; MDS](http://tumbleweed.nu/lm-3/schematics/cadr/mds.png) // MDS --- MEMORY DATA SELECTOR 

## First and Second Level Maps

The virtual memory map is implemented as a two level table lookup map.
The map input selector drives either the MD or VMA contents onto the
MAPI lines.  Bits 23 through 13 address a 2K by 5 memory, the first
level map on the VMEM0 print.  Of the possible 2048 entries in this
table, a maximum of 31 are non-zero, producing non-zero outputs on the
five VMAP lines.  The five VMAP signals combine with the map input
bits 12 to 8 to address the second level map, on prints VMEM1 and
VMEM2.  The second level map is a 1K by 24 bit memory, holding map
entries.

On a main memory read or write cycle, the map inputs are driven from
the VMA, and the map outputs, after settling, are held in the latches
shown on the VMEMDR print, such that the address sent to the memory
system is stable for the duration of the memory cycle.  The final
memory address is formed from the low 8 bits of the VMA and the low 14
bits of the map outputs.

The VMEMDR print also contains drivers for the map outputs onto the MF
bus, so that the main data paths can access the map data.  The
intermediate VMAP data is also driven onto the MF bus so that the
processor can distinguish first from second level map misses in the
paging microcode.

Writing of the map is done by addressing the map in the normal manner,
by loading a particular page entry into the MD register, and then
writing into the memories the data held in the VMA register.

  - [CADR; VMEM0](http://tumbleweed.nu/lm-3/schematics/cadr/vmem0.png) // VMEM0 --- VIRTUAL MEMORY MAP STAGE 0 
  - [CADR; VMEM1](http://tumbleweed.nu/lm-3/schematics/cadr/vmem1.png) // VMEM1 --- VIRTUAL MEMORY MAP STAGE 1 
  - [CADR; VMEM2](http://tumbleweed.nu/lm-3/schematics/cadr/vmem2.png) 
  - [CADR; VMEMDR](http://tumbleweed.nu/lm-3/schematics/cadr/vmemdr.png) // VMEMDR --- MAP OUTPUT DRIVE 

## Memory Control Logic

The timing interface between the processor and the memory system is
handled on the VCTL1 and VCTL2 prints.  These handle the timing of map
references, synchronization between the asynchronous bus and the
clocking of the processor, and detection of the cases when the
processor clock must be delayed pending arrival of data from the main
memory system.

Cycles are initiated with either a read, write, or instruction fetch
(-MEMRD, -MEMWR, -IFETCH) is required, and results in setting of the
MEMSTART flipflop.  During the MEMSTART cycle, the map inputs are
gated from the VMA.

Assuming there was no map miss or protect violation, the request is
sent to the main memory system (MEMRQ) and memory busy is set (MBUSY).
On read cycles, RD.IN.PROGRESS is set.  Execution of microinstructions
continues normally, unless one of the gates driving HANG or WAIT
causes the processor clock generator to momentarily halt, after
detecting the potential interference between the program executing and
the state of the memory system.

  - [CADR; VCTL1](http://tumbleweed.nu/lm-3/schematics/cadr/vctl1.png) // VCTL1 --- VMEMORY CONTROL 
  - [CADR; VCTL2](http://tumbleweed.nu/lm-3/schematics/cadr/vctl2.png) // VCTL2 --- VMA/MD CONTROL 
  - [CADR; OLORD1](http://tumbleweed.nu/lm-3/schematics/cadr/olord1.png) // OLORD1 --- OVERLORD 
  - [CADR; OLORD2](http://tumbleweed.nu/lm-3/schematics/cadr/olord2.png) // OLORD2 --- OVERLORD 
