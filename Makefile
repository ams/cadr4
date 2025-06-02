PROJECT		= cadr
VCDFORMAT	= vcd

GHDLSTD		= 08
GHDLOPTIONS	= -Pttl -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

CADR_BOOK	= cadr_book.vhd

ICMEM_BOOK	= icmem_book.vhd

SRCS	= $(CADR_BOOK) $(ICMEM_BOOK) dip.vhd utilities.vhd

include ghdl.mk
