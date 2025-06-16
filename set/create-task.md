There is a list of set components and both the set and the cadr components it contains listed below. Create the set component X (set/X.vhd) and add or update its definition in package (set/set.vhd). Pay attention to rules for creating bus signal instead of using individual signals.

Track your progress in the `Completed Set Components` section below.

# Set Components

- clock: cadr_clock1, cadr_clock2, cadr_clockd
- amem: cadr_actl, cadr_amem0, cadr_amem1, cadr_alatch
- mmem: cadr_mctl, cadr_mmem, cadr_mlatch, cadr_mf
- dmem: cadr_dspctl, cadr_dram0, cadr_dram1, cadr_dram2
- alu: cadr_alu0, cadr_alu1, cadr_aluc4
- shifter_masker: cadr_smctl, cadr_shift0, cadr_shift1, cadr_mskg4
- pdl: cadr_pdlptr, cadr_pdlctl, cadr_pdl0, cadr_pdl1, cadr_platch
- spc: cadr_spc, cadr_spclch, cadr_spcw, cadr_lpc
- imem: cadr_ictl, cadr_iram00, cadr_iram01, cadr_iram02, cadr_iram03, cadr_iram10, cadr_iram11, cadr_iram12, cadr_iram13, cadr_iram20, cadr_iram21, cadr_iram22, cadr_iram23, cadr_iram30, cadr_iram31, cadr_iram32, cadr_iram33
- prom: cadr_pctl, cadr_prom0, cadr_prom1
- qreg: cadr_qctl, cadr_q
- spy: cadr_spy0, cadr_spy1, cadr_spy2, cadr_spy4
- lcreg: cadr_lc, cadr_lcc
- vma: cadr_vma, cadr_vmas
- md: cadr_md, cadr_mds
- vmaps: cadr_vmem0, cadr_vmem1, cadr_vmem2, cadr_vmemdr
- vctl: cadr_vctl1, cadr_vctl2
- olord: cadr_olord1, cadr_olord2
- ireg: cadr_ior, cadr_ireg, cadr_ipar
- fetch: cadr_iwr, cadr_iwrpar, cadr_idebug
- decode: cadr_source
- lreg: cadr_l
- jumpc: cadr_flag
- flowc: cadr_contrl
- npc: cadr_npc
- stat: cadr_stat
- trap: cadr_trap
- opc: cadr_opcs, cadr_opcd
- ampar: cadr_apar
- mos: cadr_mo0, cadr_mo1

# Completed Set Components

✅ clock: Completed - created set/clkgen.vhd and added to set/set.vhd
✅ amem: Completed - created set/amem.vhd and added to set/set.vhd
✅ mmem: Completed - created set/mmem.vhd and added to set/set.vhd
✅ alu: Completed - created set/alu.vhd and added to set/set.vhd
✅ spc: Completed - created set/spc.vhd and added to set/set.vhd
✅ dmem: Completed - created set/dmem.vhd and added to set/set.vhd
✅ shifter_masker: Completed - created set/shifter_masker.vhd and added to set/set.vhd
✅ pdl: Completed - created set/pdl.vhd and added to set/set.vhd
✅ imem: Completed - created set/imem.vhd and added to set/set.vhd
✅ prom: Completed - created set/prom.vhd and added to set/set.vhd
✅ qreg: Completed - created set/qreg.vhd and added to set/set.vhd
✅ spy: Completed - created set/spy.vhd and added to set/set.vhd
✅ lcreg: Completed - created set/lcreg.vhd and added to set/set.vhd
✅ vma: Completed - created set/vma.vhd and added to set/set.vhd
✅ md: Completed - created set/md.vhd and added to set/set.vhd
✅ vmaps: Completed - created set/vmaps.vhd and added to set/set.vhd
✅ vctl: Completed - created set/vctl.vhd and added to set/set.vhd
✅ olord: Completed - created set/olord.vhd and added to set/set.vhd
✅ ireg: Completed - created set/ireg.vhd and added to set/set.vhd
✅ fetch: Completed - created set/fetch.vhd and added to set/set.vhd
✅ decode: Completed - created set/decode.vhd and added to set/set.vhd
✅ lreg: Completed - created set/lreg.vhd and added to set/set.vhd
✅ jumpc: Completed - created set/jumpc.vhd and added to set/set.vhd
✅ flowc: Completed - created set/flowc.vhd and added to set/set.vhd
✅ npc: Completed - created set/npc.vhd and added to set/set.vhd
✅ stat: Completed - created set/stat.vhd and added to set/set.vhd
✅ trap: Completed - created set/trap.vhd and added to set/set.vhd
✅ opc: Completed - created set/opc.vhd and added to set/set.vhd
✅ ampar: Completed - created set/ampar.vhd and added to set/set.vhd
✅ mos: Completed - created set/mos.vhd and added to set/set.vhd