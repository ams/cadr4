PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= ghw

VHDSTND		= 08

GHDLFLAGS	= -Pttl

SRCS_VHD	=				\
cadr4_pages.vhd 				\
  cadr4_clock1.vhd 				\
  cadr4_source.vhd 				\
utilities.vhd					\

all::;	 	(cd ttl; make all)
check::;	(cd ttl; make check)
clean::;	(cd ttl; make clean)

include ~/hdlmake.mk/hdlmake.mk
