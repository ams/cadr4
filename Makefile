PROJECT		= work
VCDFORMAT	= vcd

GHDLSTD		= 08
GHDLOPTIONS	= -Pttl -Pdip -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

CADR_PAGES	= actl alatch alu0 alu1 aluc4 amem0 amem1 apar bcterm clockd contrl dram0 dram1 dram2 dspctl flag ior ipar ireg iwr l lc lcc lpc mctl md mds mf mlatch mmem mo0 mo1 mskg4 npc opcd pdl0 pdl1 pdlctl pdlptr platch q qctl shift0 shift1 smctl source spc spclch spcpar spcw spy1 spy2 trap vctl1 vctl2 vma vmas vmem0 vmem1 vmem2 vmemdr

CADR_BOOK_SRCS	=								\
	cadr/cadr_book.vhd							\
	$(foreach page,$(CADR_PAGES),cadr/$(page).vhd cadr/$(page)_suds.vhd)

ICMEM_PAGES	= clock1 clock2 debug ictl iwrpar olord1 olord2 opcs pctl prom0 prom1 iram00 iram01 iram02 iram03 iram10 iram11 iram12 iram13 iram20 iram21 iram22 iram23 iram30 iram31 iram32 iram33 spy0 spy4 stat

ICMEM_BOOK_SRCS	=								\
	cadr/icmem_book.vhd							\
	$(foreach page,$(ICMEM_PAGES),cadr/$(page).vhd cadr/$(page)_suds.vhd)

#SRCS = $(CADR_BOOK_SRCS) $(ICMEM_BOOK_SRCS)

SRCS = cadr/actl.vhd cadr/actl_suds.vhd

.PHONY: books

include ghdl.mk

books: 
	make -C soap clean
	make -C soap all
	sh ./make-books.sh
