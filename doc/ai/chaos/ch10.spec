ML/DM Chaosnet interface programming specs

DATAI:
	Data in bits 0-31, zero in bits 32-35.
	Except for last (CRC) word of odd-length message, then
	garbage in bits 0-15 and data in bits 16-31.
	First DATAI in a packet reads garbage.

DATAO:
	Data in bits 0-31.  32-35 ignored.

CONO:
33-35	PIA
32	Transmit Done Interrupt Enable
31	Receive Done Interrupt Enable
30	Spy
29	Loop Back
28	Swap Bytes (both input and output)
27	Halfword Datao
26	Send packet if 1
25	Clear receiver if 1
24	Clear transmitter if 1
23	Reset everything if 1

CONI:
33-35	PIA
32	Transmit Done Interrupt Enable
31	Receive Done Interrupt Enable
30	Spy
29	Loop Back
28	Swap Bytes (both input and output)
27	Halfword Datao
26	Transmit Done
25	Receive Done
24	Transmit Aborted
20-23	Lost Count
19	CRC Error
18	Word Length Error (bit count not multiple of 16)
17	Packet Length Error (too many or too few DATAIs).
16	Overrun (DATAI or DATAO too fast).  Cleared by RESET.
0-15	My Number

Notes on CONO:

Bits 27-35 are a register, and CONI bits 27-35 read back that register.
Bits 23-26 are pulses active if a 1 is written.
Bits 18-22 are not used.

28	Swap bytes (both input and output)
If this is 1 when a DATAO is done, the 8-bit bytes in that word are swapped.
If this is 1 when a DATAI is done, the 8-bit bytes in that word are swapped.
This bit may not be changed within 4.5 microseconds after a DATAO.

27	Halfword Datao
If this is 1 when a DATAO is done, only bits 0-15 contain data.
This bit may not be changed within 4.5 microseconds after a DATAO.

26	Send packet if 1
If Transmit Done is clear, a new packet is being sent.  The last 16
bits output are the destination.  The hardware stores the source and
CRC into the packet buffer, saves the bit count, then starts sending
the packet.
If Transmit Done is set, a packet is being retransmitted (presumably
due to abort).  The saved bit count is restored, Transmit Done is
cleared, and the packet is sent.
Note that DATAO clears Transmit Done and Transmit Aborted.

25	Clear receiver if 1
Clears Receive Done and enables to receive the next packet.

24	Clear transmitter if 1
For maintenance only, resets the transmitter section.

23	Reset everything if 1
Same as IOB RESET.

Unlike the pdp-11 interface, you cannot read back the receive bit count;
you can only get a summary of it from CONI bits 17 and 18.  Word length
error is valid before any of the packet is DATAIed.  Packet length error is
valid when you think you have DATAIed the whole packet including the three
hardware halfwords; the last word DATAIed may be only half there.  Normally
the software gets the packet length from the header and only uses the bit
count as a validity check.
