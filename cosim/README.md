
# Co-Simulation Lashup

## Two Machine Lashup

By using 4 Unibus locations and 16 bidirectional data lines (dbd0..dbd15), the debugger can read and write on debuggee's Unibus. By using Unibus map, also Xbus can be accessed.

These 4 Unibus locations are consecutive and addressed by two signals, a0 and a1.

The two machine lashup debug operation is enabled by the assertions of -debug in req signal.

The direction of debug operation (read or write) is controlled with debug in wr signal. This provides a UD>DEBUG signal which is supplied to bus transceivers connecting Unibus data lines to dbd signal.

### 766100 (read-write)

Access to this location reads or writes the debuggee-Unibus address stored in register 766104 (bits 1-16) and 766110 (bit 17). Bit 0 is always 0.

Access to this register means a0 and a1 is zero, and this asserts -DB NEED UB.

### 766104 (write-only) 

This is a register and contains the bits 1-16 of the debuggee-Unibus address.

This register is dbgin.a19 and dbgin.a18.

### 766110 (write-only)

This register contains additional modifier bits:

- bit 0: bit 17 of the debuggee-Unibus address
- bit 1: resets the debuggee's Unibus and bus interface, write 1 then 0.
- bit 2: turns off the NXM timeout for all Xbus and Unibus

This register is dbgin.a16.

### 766114 (read-only)

This register contains the status of bus cycles executed on the debuggee's busses. It is cleared by writing to 766044 (Error Status) on the debuggee's Unibus.

- bit 0: Xbus NXM Error, set when Xbus cycle times out
- bit 1: Xbus Parity Error, set when Xbus read receives a word with a bad parity and ignore-parity is not asserted. It is also set when Xbus NXM Error is set.
- bit 2: CADR Address Parity Error, set when an address received from the processor has bad parity
- bit 3: Unibus NXM Error, set when Unibus cycle times out
- bit 4: CADR Parity Error, set when data received from the processor has bad parity
- bit 5: Unibus Map Error, set if Unibus map is refused, invalid or write-protected

This register is reqerr.b15.

## Debug Cable and Signals

Debugger's J06 (25 pin) is connected to Debuggee's J05 (25 pin). From the thesis, "Two bus interfaces may be cabled together with a single 50-wire flat cable for maintenance purposes.". The other 25 wires in the cable are most possibly GND.

This means debug out a0, a1, wr, req l and ack lines are connected to debug in a0, a1, wr, req l and ack lines through the cable in addition to dbd lines.

In cosim_lashup_debuggee implementation, J06 is driven externally (e.g. by usim) and J05 is read by the cosim_lashup_debuggee implementation.