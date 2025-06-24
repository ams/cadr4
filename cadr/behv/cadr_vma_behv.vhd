-- VMA -- VMA REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vma is
begin
vma_1a06 : dip_74s240 port map (p1 => \-vmadrive\, p2 => \-vma31\, p3 => mf24, p4 => \-vma30\, p5 => mf25, p6 => \-vma29\, p7 => mf26, p8 => \-vma28\, p9 => mf27, p11 => \-vma27\, p12 => mf28, p13 => \-vma26\, p14 => mf29, p15 => \-vma25\, p16 => mf30, p17 => \-vma24\, p18 => mf31, p19 => \-vmadrive\);
vma_1a10 : dip_74s240 port map (p1 => \-vmadrive\, p2 => \-vma7\, p3 => mf0, p4 => \-vma6\, p5 => mf1, p6 => \-vma5\, p7 => mf2, p8 => \-vma4\, p9 => mf3, p11 => \-vma3\, p12 => mf4, p13 => \-vma2\, p14 => mf5, p15 => \-vma1\, p16 => mf6, p17 => \-vma0\, p18 => mf7, p19 => \-vmadrive\);
vma_1a12 : dip_74s240 port map (p1 => \-vmadrive\, p2 => \-vma23\, p3 => mf16, p4 => \-vma22\, p5 => mf17, p6 => \-vma21\, p7 => mf18, p8 => \-vma20\, p9 => mf19, p11 => \-vma19\, p12 => mf20, p13 => \-vma18\, p14 => mf21, p15 => \-vma17\, p16 => mf22, p17 => \-vma16\, p18 => mf23, p19 => \-vmadrive\);
vma_1a14 : dip_74s240 port map (p1 => \-vmadrive\, p2 => \-vma15\, p3 => mf8, p4 => \-vma14\, p5 => mf9, p6 => \-vma13\, p7 => mf10, p8 => \-vma12\, p9 => mf11, p11 => \-vma11\, p12 => mf12, p13 => \-vma10\, p14 => mf13, p15 => \-vma9\, p16 => mf14, p17 => \-vma8\, p18 => mf15, p19 => \-vmadrive\);
vma_1a18 : \-vmadrive\ <= tse2 nand srcvma;
vma_1b22 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma24\, p3 => \-vmas24\, p4 => \-vmas25\, p5 => \-vma25\, p6 => \-vmas26\, p7 => \-vma26\, p9 => clk1a, p10 => \-vma27\, p11 => \-vmas27\, p12 => \-vma28\, p13 => \-vmas28\, p14 => \-vmas29\, p15 => \-vma29\);
vma_1b23 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma30\, p3 => \-vmas30\, p4 => \-vmas31\, p5 => \-vma31\, p6 => '0', p7 => open, p9 => clk1a, p10 => open, p11 => '0', p12 => open, p13 => '0', p14 => '0', p15 => open);
vma_1c22 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma0\, p3 => \-vmas0\, p4 => \-vmas1\, p5 => \-vma1\, p6 => \-vmas2\, p7 => \-vma2\, p9 => clk2a, p10 => \-vma3\, p11 => \-vmas3\, p12 => \-vma4\, p13 => \-vmas4\, p14 => \-vmas5\, p15 => \-vma5\);
vma_1c24 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma12\, p3 => \-vmas12\, p4 => \-vmas13\, p5 => \-vma13\, p6 => \-vmas14\, p7 => \-vma14\, p9 => clk2a, p10 => \-vma15\, p11 => \-vmas15\, p12 => \-vma16\, p13 => \-vmas16\, p14 => \-vmas17\, p15 => \-vma17\);
vma_1c25 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma18\, p3 => \-vmas18\, p4 => \-vmas19\, p5 => \-vma19\, p6 => \-vmas20\, p7 => \-vma20\, p9 => clk2a, p10 => \-vma21\, p11 => \-vmas21\, p12 => \-vma22\, p13 => \-vmas22\, p14 => \-vmas23\, p15 => \-vma23\);
vma_1d25 : dip_25s07 port map (p1 => \-vmaenb\, p2 => \-vma6\, p3 => \-vmas6\, p4 => \-vmas7\, p5 => \-vma7\, p6 => \-vmas8\, p7 => \-vma8\, p9 => clk2c, p10 => \-vma9\, p11 => \-vmas9\, p12 => \-vma10\, p13 => \-vmas10\, p14 => \-vmas11\, p15 => \-vma11\);
vma_2a05 : dip_74s04 port map (p1 => '0', p2 => open, p3 => '0', p4 => open, p5 => \-srcvma\, p6 => srcvma, p8 => open, p9 => '0', p10 => open, p11 => '0', p12 => open, p13 => '0');
end architecture;
