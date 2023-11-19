PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= ghw

VHDSTND		= 08

GHDLFLAGS	= -Pttl

SRCS_VHD	=				\
cadr4.vhd					\
utilities.vhd					\
cpu.vhd

include ~/hdlmake.mk/hdlmake.mk
