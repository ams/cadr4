PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= ghw

VHDSTND		= 08

GHDLFLAGS	= -Pttl

SRCS_VHD	=				\
pages.vhd \
  cadr4_clock1.vhd				\
  cadr4_clock2.vhd				\
  cadr4_clockd.vhd				\
  \
  cadr4_ictl.vhd				\
  cadr4_iram00.vhd				\
  cadr4_iram01.vhd				\
  cadr4_iram02.vhd				\
  cadr4_iram03.vhd				\
  cadr4_iram10.vhd				\
  cadr4_iram11.vhd				\
  cadr4_iram12.vhd				\
  cadr4_iram13.vhd				\
  cadr4_iram20.vhd				\
  cadr4_iram21.vhd				\
  cadr4_iram22.vhd				\
  cadr4_iram23.vhd				\
  cadr4_iram30.vhd				\
  cadr4_iram31.vhd				\
  cadr4_iram32.vhd				\
  cadr4_iram33.vhd				\
  cadr4_iwr.vhd					\
  cadr4_pctl.vhd				\
  cadr4_prom0.vhd				\
  cadr4_prom1.vhd				\
  cadr4_debug.vhd				\
  \
  cadr4_ior.vhd					\
  cadr4_ireg.vhd				\
  cadr4_ireg.vhd				\
  \
  cadr4_source.vhd				\
  \
  cadr4_actl.vhd				\
  cadr4_amem0.vhd				\
  cadr4_amem1.vhd				\
  cadr4_alatch.vhd				\
  cadr4_apar.vhd				\
  \
  cadr4_mctl.vhd				\
  cadr4_mmem.vhd				\
  cadr4_mlatch.vhd				\
  cadr4_mf.vhd					\
  \
  cadr4_pdlptr.vhd				\
  cadr4_pdlctl.vhd				\
  cadr4_pdl0.vhd				\
  cadr4_pdl1.vhd				\
  cadr4_platch.vhd				\
  \
  cadr4_smctl.vhd				\
  cadr4_shift0.vhd				\
  cadr4_shift1.vhd				\
  cadr4_mskg4.vhd				\
  \
  cadr4_aluc4.vhd				\
  cadr4_alu0.vhd				\
  cadr4_alu1.vhd				\
  \
  cadr4_qctl.vhd				\
  cadr4_q.vhd					\
  \
  cadr4_l.vhd					\
  \
  cadr4_dspctl.vhd				\
  cadr4_dram0.vhd				\
  cadr4_dram1.vhd				\
  cadr4_dram2.vhd				\
  \
  cadr4_flag.vhd				\
  \
  cadr4_contrl.vhd				\
  \
  cadr4_spc.vhd					\
  cadr4_spclch.vhd				\
  cadr4_spcw.vhd				\
  cadr4_spcpar.vhd				\
  cadr4_lpc.vhd					\
  \
  cadr4_npc.vhd					\
  \
  cadr4_lc.vhd					\
  cadr4_lcc.vhd					\
  \
  cadr4_vma.vhd					\
  cadr4_vmas.vhd				\
  \
  cadr4_md.vhd					\
  cadr4_mds.vhd					\
  \
  cadr4_vmem0.vhd				\
  cadr4_vmem1.vhd				\
  cadr4_vmem2.vhd				\
  cadr4_vmemdr.vhd				\
  \
  cadr4_vctl1.vhd				\
  cadr4_vctl2.vhd				\
  cadr4_olord1.vhd				\
  cadr4_olord2.vhd				\
  \
  cadr4_stat.vhd				\
  cadr4_opcs.vhd				\
  cadr4_iwrpar.vhd				\
  cadr4_trap.vhd				\
  cadr4_spy0.vhd				\
  cadr4_spy1.vhd				\
  cadr4_spy2.vhd				\
  cadr4_spy4.vhd				\
  cadr4_opcd.vhd				\
  cadr4_mo0.vhd					\
  cadr4_mo1.vhd					\
  cadr4_bcterm.vhd				\
  cadr4_ipar.vhd				\
utilities.vhd

all::;	 	(cd ttl; make all)
check::;	(cd ttl; make check)
clean::;	(cd ttl; make clean)

include ~/hdlmake.mk/hdlmake.mk
