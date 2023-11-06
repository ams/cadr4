PROJECT		= ttl

SIM		= ghdl
GHDLFLAGS	= --std=08 --work=ttl
VCDVIEWER	= vcd

UNSORTED_SRCS	= \
ic_16dummy.vhd \
ic_5600.vhd \
ic_5610.vhd \
ic_8221.vhd \
ic_9328.vhd \
ic_93425a.vhd \
ic_9346.vhd \
ic_942_1.vhd \
 \
sn74109.vhd \
sn74133.vhd \
sn74138.vhd \
sn74139.vhd \
sn7414.vhd \
sn74151.vhd \
sn74153.vhd \
sn74157.vhd \
sn74169.vhd \
sn74174.vhd \
sn74175.vhd \
sn74181.vhd \
sn74182.vhd \
sn74194.vhd \
sn74241.vhd \
sn74244.vhd \
sn74258.vhd \
sn74280.vhd \
sn74283.vhd \
sn74373.vhd \
sn74374.vhd \
sn74472.vhd \
sn7464.vhd \
sn7474.vhd

SN74_SRCS	= \
sn7400.vhd \
sn7402.vhd \
sn7404.vhd \
sn7408.vhd \
sn7410.vhd \
sn7411.vhd \
sn7420.vhd \
sn7428.vhd \
sn7432.vhd \
sn7437.vhd \
sn7451.vhd \
 \
sn7486.vhd \
sn74260.vhd \
sn74240.vhd					

SRCS_VHD	= \
misc.vhd \
other.vhd \
 td25.vhd \
 td50.vhd \
 td100.vhd \
 td250.vhd \
 am93s48.vhd \
 am2147.vhd \
 am2507.vhd \
 am2509.vhd \
 am2510.vhd \
 am252519.vhd \
 til309.vhd \
 res20.vhd \
 sip220_330_8.vhd \
 sip330_470_8.vhd \
sn74.vhd \
 $(SN74_SRCS) \
unsorted.vhd \
 $(UNSORTED_SRCS) \

TB_SRCS_VHD	= $(addsuffix _tb.vhd, $(basename $(SN74_SRCS)))
TESTBENCHES	= $(basename $(TB_SRCS_VHD))

include ~/hdlmake.mk/hdlmake.mk
