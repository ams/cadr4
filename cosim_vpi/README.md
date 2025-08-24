
# cosim_vpi

This folder contains VPI cosimulation code used by GHDL.

- cosim.c and cosim.h contains vlog_startup_routines and utility functions.

- cosim_diagnostic_display: functions as diagnostic display, prints to console

# Co-Simulation Lashup

## Signals

### Debugger

DEBUG OUT A0 and A1 are connected directly to UBA 2 and UBA 3.

DEBUG OUT WR is connected to UBWR. How UBWR is asserted ?

When debugger writes to any debug registers (7661xx), UBA6=1, UBA5=0, SELECT DEBUG L and SELECT DEBUG are asserted.

SELECT DEBUG DLYD is asserted 100ns later, I believe to give time to components for outputs to settle.

When SELECT DEBUG and SELECT DEBUG DLYD are both asserted, they assert DEBUG OUT REQ L, thus 100ns after SELECT DEBUG.

### Connection

DEBUG OUT signals are connected to DEBUG IN signals over the cable. DBD signals are connected to DBD signals over the cable. Thus, the DBD bus is connected between the debugger and the debuggee.

DBD signals are bidirectional.

A0, A1, WR, REQ L are driven by the debugger.

ACK is driven by the debuggee.

### Debuggee

When DEBUG IN REQ L is asserted, DEBUG IN A1 and A0 selects DB ADR0 CLK L, DB ADR1 CLK L, DB READ STATUS L or DB NEED UB L. 

| UBA3=A1 | UBA2=A0 | UBA | ASSERTED SIGNAL |
| - | - | ------ | ------------ |
| 0 | 0 | 766100 | DB NEED UB L |
| 0 | 1 | 766104 | DB READ STATUS L |
| 1 | 0 | 766110 | DB ADR1 CLK L |
| 1 | 1 | 766114 | DB ADR0 CLK L |
    
DB ADR0 is the register holding unibus address bits 16-1 (bit 0 is always 0). DB ADR1 is the register holding extra modifier bits. DB READ STATUS is for reading bus status (reqerr.b15), some error bits are driven to DBD lines.

DB NEED UB L is asserted when read or write from the unibus is performed.

When DB ADR0, DB ADR1 or DB READ STATUS is asserted, DEBUG ACK is asserted.

When DBUB MASTER and SSYN T0 is asserted, DEBUG ACK is asserted.

DEBUG ACK drives DEBUG IN ACK (connected back to debugger's DEBUG OUT ACK).

## Registers

### 766100 (read-write)

Access to this location reads or writes the debuggee-Unibus address stored in register 766104 (bits 1-16) and 766110 (bit 17). Bit 0 is always 0.

### 766114 (write-only) 

This is a register and contains the bits 1-16 of the debuggee-Unibus address.

This register is dbgin.a19 and dbgin.a18.

### 766110 (write-only)

This register contains additional modifier bits:

- bit 0: bit 17 of the debuggee-Unibus address
- bit 1: resets the debuggee's Unibus and bus interface, write 1 then 0.
- bit 2: turns off the NXM timeout for all Xbus and Unibus

This register is dbgin.a16.

### 766104 (read-only)

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

## UDP Debug Protocol

The co-simulation lashup provides a UDP interface for remote debugging applications to read and write to the debuggee's memory through the debug cable interface.

### Implementation Overview

The VPI-based debug interface consists of:
- **VPI Debugger**: `cosim_lashup_debugger.c` - VPI module that interfaces with VHDL simulation
- **VHDL Debuggee**: `cosim_lashup_debuggee_tb.vhd` - Simple 4-address, 16-bit memory testbench
- **Python Test Client**: `cosim_lashup_debugger_test.py` - Example UDP client for testing

### UDP Server Configuration

- **Default Port**: 12345 (falls back to dynamic port if unavailable)
- **Protocol**: UDP
- **Address**: Binds to localhost (127.0.0.1)
- **Port Discovery**: Server reports actual port in console output

### Command Format

Remote applications send commands as ASCII strings over UDP:

- **Write Command**: `W <addr> <data>`
- **Read Command**: `R <addr>`

Where:
- `<addr>`: Address in hexadecimal format without 0x prefix (case insensitive, 0-3 for test memory)
- `<data>`: 16-bit data in hexadecimal format without 0x prefix (case insensitive)

### Response Format

All responses follow the format: `<code> [<data_or_error_msg>]`

#### Success Responses

- **Read Success**: `0 <data>` (e.g., `0 AAAA` - hexadecimal without 0x prefix)
- **Write Success**: `0`

#### Error Responses

- **Unknown Command**: `1 Unknown command`
- **Invalid Read Format**: `2 Invalid read command format`
- **Invalid Write Format**: `3 Invalid write command format`

### VPI Implementation Details

The VPI debugger uses the following key techniques:
- **Signal Reading**: Uses `vpiIntVal` format instead of `vpiScalarVal` for reliable VHDL signal reading
- **Bidirectional Bus**: Writes drive the data bus; reads rely on VHDL signal resolution
- **No Signal Forcing**: Avoids `vpiForceFlag`/`vpiReleaseFlag` to prevent crashes
- **Simple Protocol**: Single-timestep transactions without complex state machines

### Example Session

```
Client → Server: "W 1 AAAA"
Server → Client: "0"

Client → Server: "R 1"
Server → Client: "0 AAAA"

Client → Server: "W 0 DEAD"
Server → Client: "0"

Client → Server: "R 0"
Server → Client: "0 DEAD"
```

### Testing

Run the test suite:
```bash
make cosim-run-cosim_lashup_debuggee &  # Start simulation
python3 cosim/cosim_lashup_debugger_test.py [port]  # Run tests
```

The test performs comprehensive read/write verification across all 4 memory addresses.