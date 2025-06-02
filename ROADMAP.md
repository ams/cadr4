# ROADMAP

## End Goal

The end goal is to have a CADR that works on a FPGA, with console,
keyboard, mouse, disk and networking and is capable of running the
current microcode and world load band.

## Accurate simulation of CADR

Implement an accurate version of the original CADR schematics (CADR)
that can run in simulation.  This would most probobly not have vull
virtual memory, any bus for I/O, etc.  And only capable of running
through the boot PROM and failing at either the first memory access,
or looping in DISK-WAIT.  It would also most probobly not be
syntheziable.

## Two-Machine Lashup

Implement a SPY bus that can access the core via GHDL co-simulation
over a TCP/IP or PTY link that can exercise the design.  This would be
something suitable at some pint in the future that can be used by the
native CADR Console debugger (CC).

### [Serial SPY protocol notes](https://tumbleweed.nu/r/lm-3/uv/lmnotes.html#Serial-SPY-protocol-notes)

See [SYS: CC; LDBG
LISP](https://tumbleweed.nu/r/sys/file?name=cc/ldbg.lisp&ci=tip) for
details.  Not all of these commands need to be implemented, some way
to get the status register, and accessing memory should suffice for
quite some time.

Serial SPY protocol (values are octal, as usual):

```
<ADDRESS>/		Read from address ADDRESS, used by DBG-READ.
<ADDRESS>:<VALUE>:	Write value VALUE to address ADDRESS, used by DBG-WRITE.
R			Read status, returns a octal number.
<N>S			Manipulates some kind of high serial bit.
<N>A			Set the baud rate of the UART, where N is one of:

	0: 50. baud
	1: 75. baud
	2: 110. baud
	4: 150. baud
	5: 300. baud
	6: 600. baud
	7: 1200. baud
	10: 1800. baud
	11: 2000. baud
	12: 2400. baud
	13: 3600. baud
	14: 4800. baud
	15: 7200. baud
	16: 9600. baud
	17: 19200. baud

<LOW>L<MIDDLE>M<HIGH>H0I	CC-EXECUTE-LOAD-DEBUG-IR
<LOW>L<MIDDLE>M<HIGH>H1I	CC-EXECUTE-R
<LOW>L<MIDDLE>M<HIGH>H7I	CC-EXECUTE-W
```

Error code:

```
#o7	ERRONEOUS COMMAND RECEIVED BY DEBUGGER
#o10	DEBUGGER GOT PARITY ERROR, RESETTING DEBUGGER; when getting this we type out #o33
#o15	Nothing.
```


## Open Questions

### Final FPGA board to use?

### What bus design to use?

### Bus Interconnect?
