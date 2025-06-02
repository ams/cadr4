#!/bin/sh

# AI:CADR;CADR BOOK
for x in actl alatch alu0 alu1 aluc4 amem0 amem1 apar bcpins bcterm caps clockd contrl cpins dram0 dram1 dram2 dspctl flag ior ipar ireg iwr l lc lcc lpc mctl md mds mf mlatch mmem mo0 mo1 mskg4 npc opcd pdl0 pdl1 pdlctl pdlptr platch q qctl shift0 shift1 smctl source spc spclch spcpar spcw spy1 spy2 trap vctl1 vctl2 vma vmas vmem0 vmem1 vmem2 vmemdr; do
    ./soap/soap -n doc/ai/cadr/$x.drw > $x.vhd
done

# AI:CADR;ICMEM BOOK
for x in clock1 clock2 debug icaps ictl iwrpar mbcpin mcpins olord1 olord2 opcs pctl prom0 prom1 iram00 iram01 iram02 iram03 iram10 iram11 iram12 iram13 iram20 iram21 iram22 iram23 iram30 iram31 iram32 iram33 spy0 spy4 stat; do 
    ./soap/soap -n doc/ai/cadr/$x.drw > $x.vhd
done
