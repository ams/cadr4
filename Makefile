PROJECT		= cadr
VCDFORMAT	= vcd

GHDLSTD		= 08
GHDLOPTIONS	= -Pttl -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

SRCS =						\
	cadr_book.vhd				\
						\
	cadr_clock1.vhd				\
	cadr_clock2.vhd				\
	cadr_clockd.vhd				\
						\
	cadr_ictl.vhd				\
	cadr_iram00.vhd				\
	cadr_iram01.vhd				\
	cadr_iram02.vhd				\
	cadr_iram03.vhd				\
	cadr_iram10.vhd				\
	cadr_iram11.vhd				\
	cadr_iram12.vhd				\
	cadr_iram13.vhd				\
	cadr_iram20.vhd				\
	cadr_iram21.vhd				\
	cadr_iram22.vhd				\
	cadr_iram23.vhd				\
	cadr_iram30.vhd				\
	cadr_iram31.vhd				\
	cadr_iram32.vhd				\
	cadr_iram33.vhd				\
	cadr_iwr.vhd				\
	cadr_pctl.vhd				\
	cadr_prom0.vhd				\
	cadr_prom1.vhd				\
	cadr_debug.vhd				\
						\
	cadr_ior.vhd				\
	cadr_ireg.vhd				\
	cadr_ireg.vhd				\
						\
	cadr_source.vhd				\
						\
	cadr_actl.vhd				\
	cadr_amem0.vhd				\
	cadr_amem1.vhd				\
	cadr_alatch.vhd				\
	cadr_apar.vhd				\
						\
	cadr_mctl.vhd				\
	cadr_mmem.vhd				\
	cadr_mlatch.vhd				\
	cadr_mf.vhd				\
						\
	cadr_pdlptr.vhd				\
	cadr_pdlctl.vhd				\
	cadr_pdl0.vhd				\
	cadr_pdl1.vhd				\
	cadr_platch.vhd				\
						\
	cadr_smctl.vhd				\
	cadr_shift0.vhd				\
	cadr_shift1.vhd				\
	cadr_mskg4.vhd				\
						\
	cadr_aluc4.vhd				\
	cadr_alu0.vhd				\
	cadr_alu1.vhd				\
						\
	cadr_qctl.vhd				\
	cadr_q.vhd				\
						\
	cadr_l.vhd				\
						\
	cadr_dspctl.vhd				\
	cadr_dram0.vhd				\
	cadr_dram1.vhd				\
	cadr_dram2.vhd				\
						\
	cadr_flag.vhd				\
						\
	cadr_contrl.vhd				\
						\
	cadr_spc.vhd				\
	cadr_spclch.vhd				\
	cadr_spcw.vhd				\
	cadr_spcpar.vhd				\
	cadr_lpc.vhd				\
						\
	cadr_npc.vhd				\
						\
	cadr_lc.vhd				\
	cadr_lcc.vhd				\
						\
	cadr_vma.vhd				\
	cadr_vmas.vhd				\
						\
	cadr_md.vhd				\
	cadr_mds.vhd				\
						\
	cadr_vmem0.vhd				\
	cadr_vmem1.vhd				\
	cadr_vmem2.vhd				\
	cadr_vmemdr.vhd				\
						\
	cadr_vctl1.vhd				\
	cadr_vctl2.vhd				\
	cadr_olord1.vhd				\
	cadr_olord2.vhd				\
						\
	cadr_stat.vhd				\
	cadr_opcs.vhd				\
	cadr_iwrpar.vhd				\
	cadr_trap.vhd				\
	cadr_spy0.vhd				\
	cadr_spy1.vhd				\
	cadr_spy2.vhd				\
	cadr_spy4.vhd				\
	cadr_opcd.vhd				\
	cadr_mo0.vhd				\
	cadr_mo1.vhd				\
	cadr_bcterm.vhd				\
	cadr_ipar.vhd				\
	utilities.vhd

include ghdl.mk
