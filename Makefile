PROJECT		= cadr
VCDFORMAT	= vcd

GHDLSTD		= 08
GHDLOPTIONS	= -Pttl -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

CADR_BOOK	=				\
	cadr_book.vhd				\
	cadr/actl.vhd				\
	cadr/alatch.vhd				\
	cadr/alu0.vhd				\
	cadr/alu1.vhd				\
	cadr/aluc4.vhd				\
	cadr/amem0.vhd				\
	cadr/amem1.vhd				\
	cadr/apar.vhd				\
	cadr/bcpins.vhd				\
	cadr/bcterm.vhd				\
	cadr/caps.vhd				\
	cadr/clockd.vhd				\
	cadr/contrl.vhd				\
	cadr/cpins.vhd				\
	cadr/dram0.vhd				\
	cadr/dram1.vhd				\
	cadr/dram2.vhd				\
	cadr/dspctl.vhd				\
	cadr/flag.vhd				\
	cadr/ior.vhd				\
	cadr/ipar.vhd				\
	cadr/ireg.vhd				\
	cadr/iwr.vhd				\
	cadr/l.vhd				\
	cadr/lc.vhd				\
	cadr/lcc.vhd				\
	cadr/lpc.vhd				\
	cadr/mctl.vhd				\
	cadr/md.vhd				\
	cadr/mds.vhd				\
	cadr/mf.vhd				\
	cadr/mlatch.vhd				\
	cadr/mmem.vhd				\
	cadr/mo0.vhd				\
	cadr/mo1.vhd				\
	cadr/mskg4.vhd				\
	cadr/npc.vhd				\
	cadr/opcd.vhd				\
	cadr/pdl0.vhd				\
	cadr/pdl1.vhd				\
	cadr/pdlctl.vhd				\
	cadr/pdlptr.vhd				\
	cadr/platch.vhd				\
	cadr/q.vhd				\
	cadr/qctl.vhd				\
	cadr/shift0.vhd				\
	cadr/shift1.vhd				\
	cadr/smctl.vhd				\
	cadr/source.vhd				\
	cadr/spc.vhd				\
	cadr/spclch.vhd				\
	cadr/spcpar.vhd				\
	cadr/spcw.vhd				\
	cadr/spy1.vhd				\
	cadr/spy2.vhd				\
	cadr/trap.vhd				\
	cadr/vctl1.vhd				\
	cadr/vctl2.vhd				\
	cadr/vma.vhd				\
	cadr/vmas.vhd				\
	cadr/vmem0.vhd				\
	cadr/vmem1.vhd				\
	cadr/vmem2.vhd				\
	cadr/vmemdr.vhd

ICMEM_BOOK	=				\
	icmem_book.vhd				\
	cadr/clock1.vhd				\
	cadr/clock2.vhd				\
	cadr/debug.vhd				\
	cadr/icaps.vhd				\
	cadr/ictl.vhd				\
	cadr/iwrpar.vhd				\
	cadr/mbcpin.vhd				\
	cadr/mcpins.vhd				\
	cadr/olord1.vhd				\
	cadr/olord2.vhd				\
	cadr/opcs.vhd				\
	cadr/pctl.vhd				\
	cadr/prom0.vhd				\
	cadr/prom1.vhd				\
	cadr/iram00.vhd				\
	cadr/iram01.vhd				\
	cadr/iram02.vhd				\
	cadr/iram03.vhd				\
	cadr/iram10.vhd				\
	cadr/iram11.vhd				\
	cadr/iram12.vhd				\
	cadr/iram13.vhd				\
	cadr/iram20.vhd				\
	cadr/iram21.vhd				\
	cadr/iram22.vhd				\
	cadr/iram23.vhd				\
	cadr/iram30.vhd				\
	cadr/iram31.vhd				\
	cadr/iram32.vhd				\
	cadr/iram33.vhd				\
	cadr/spy0.vhd				\
	cadr/spy4.vhd				\
	cadr/stat.vhd

SRCS	= $(CADR_BOOK) $(ICMEM_BOOK) dip.vhd utilities.vhd

include ghdl.mk
