PROJECT		= ttl

SIM		= ghdl

GHDLFLAGS	= --std=08 --work=ttl

VCDVIEWER	= vcd

UNSORTED_SRCS	= \
ic_16dummy.vhd \
ic_2147.vhd \
ic_2507.vhd \
ic_2509.vhd \
ic_2510.vhd \
ic_252519.vhd \
ic_5600.vhd \
ic_5610.vhd \
ic_7400.vhd \
ic_7402.vhd \
ic_7404.vhd \
ic_7408.vhd \
ic_7410.vhd \
ic_74109.vhd \
ic_7411.vhd \
ic_74133.vhd \
ic_74138.vhd \
ic_74139.vhd \
ic_7414.vhd \
ic_74151.vhd \
ic_74153.vhd \
ic_74157.vhd \
ic_74169.vhd \
ic_74174.vhd \
ic_74175.vhd \
ic_74181.vhd \
ic_74182.vhd \
ic_74194.vhd \
ic_7420.vhd \
ic_74240.vhd \
ic_74241.vhd \
ic_74244.vhd \
ic_74258.vhd \
ic_74260.vhd \
ic_7428.vhd \
ic_74280.vhd \
ic_74283.vhd \
ic_7432.vhd \
ic_7437.vhd \
ic_74373.vhd \
ic_74374.vhd \
ic_74472.vhd \
ic_7451.vhd \
ic_7464.vhd \
ic_7474.vhd \
ic_7486.vhd \
ic_8221.vhd \
ic_9328.vhd \
ic_93425a.vhd \
ic_9346.vhd \
ic_9348.vhd \
ic_942_1.vhd \
ic_res20.vhd \
ic_sip220_330_8.vhd \
ic_sip330_470_8.vhd \
ic_td100.vhd \
ic_td25.vhd \
ic_td250.vhd \
ic_td50.vhd \
ic_til309.vhd 

SN74_SRCS	=				\
sn7400.vhd					\
sn7402.vhd					\
sn7404.vhd					\
sn7408.vhd					\
sn7410.vhd					\
sn7411.vhd					\
sn7420.vhd					\
sn7428.vhd					\
sn7432.vhd					\
sn7437.vhd					\
sn7451.vhd					\
						\
sn7486.vhd					\
sn74260.vhd					\
sn74240.vhd

SRCS_VHD	=				\
misc.vhd					\
other.vhd					\
td25.vhd					\
td50.vhd					\
td100.vhd					\
td250.vhd					\
am93s48.vhd					\
sn74.vhd					\
$(SN74_SRCS) \
unsorted.vhd \
$(UNSORTED_SRCS) \


TB_SRCS_VHD	= $(addsuffix _tb.vhd, $(basename $(SN74_SRCS)))
TESTBENCHES	= $(basename $(TB_SRCS_VHD))

include ~/hdlmake.mk/hdlmake.mk
