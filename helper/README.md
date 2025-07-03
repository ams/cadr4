
# helper

This folder contains helper components.

helper components are required for cadr_tb to run. There are a few external (bus interface) signals that has to be driven until the bus interface is implemented.

At the moment, boot is initiated with helper_spy, loading the mode register's PROG.BOOT. There is actually no such register, selecting mode register (eadr=0101), setting spy7 (spy7=1) and enabling db (debug?) write (\-dbwrite\=0), drives \-boot\ to low in olord2 and initiates boot.