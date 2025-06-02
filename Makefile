PROJECT		= cadr
VCDFORMAT	= vcd

GHDLSTD		= 08
GHDLOPTIONS	= -Pttl -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

CADR_BOOK	=

ICMEM_BOOK	= 

SRCS	= $(CADR_BOOK) $(ICMEM_BOOK) dip.vhd utilities.vhd

include ghdl.mk
