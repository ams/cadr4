PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= ghw

VHDSTND		= 08

GHDLFLAGS	= -Pttl

SRCS_VHD	=				\
cadr4.vhd					\
utilities.vhd					\
cpu.vhd

check::
	(cd ttl; make check)
clean::
	(cd ttl; make clean)

include ~/hdlmake.mk/hdlmake.mk
