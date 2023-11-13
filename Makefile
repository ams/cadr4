PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= vcd

SRCS_VHD	=				\
utilities.vhd					\
cadr4.vhd

include ~/hdlmake.mk/hdlmake.mk
