
# cadr1

This folder contains cadr1 components.

A cadr1 component implements a CADR1 schematic page and named
accordingly as cadr1_<PAGE>.  The cadr1 components are in `busint_book` package.

The suds architecture of cadr1 components are auto-generated from
`doc/ai/cadr1/*.drw` files. The architecture is in
cadr1_<PAGE>_suds.vhd files. These can be regenerated with `make regenerate-cadr1-suds`.

# temporary notes

CADR (processor) and bus interface is connected with 5x 50 pin (5x 25 signal) cable. https://tumbleweed.nu/lm-3/schematics/cadr1/clm.png

This cable includes: MEM[31:0], ADR[21:0], SPY[15:0], SPY ADR[4:1], SPY READ, SPY WRITE, and some other control signals.

Between CADR and BUSINT:

- MEM[31:0] (data)
- ADR[21:0] (address)
- SPY[15:0] (spy data)
- SPY ADR[4:1] (spy address) (=UBA[4:1])

Between BUSINT and XBUS:

- XBUS[31:0] (data)
- XADDR[21:0] (address)

Between BUSINT and Unibus:

- UBD[15:0] (data)
- UBA[17:0] (address)

Between BUSINT and DBD:

- DBD[15:0] (data)
- DEBUG IN/OUT A1, A0 (address) (=UBA[3:2])

DBD is debug/two-machine lashup. Here both address and in/out data for Unibus is set with DBD[15:0]. Unibus[0] is always zero, Unibus[17] is set separately. Unibus[16:1] is set with DBD[15:0].