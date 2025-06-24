-- VMEMDR -- MAP OUTPUT DRIVE

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vmemdr is
signal net_0 : std_logic;
begin
vmemdr_1a01 : dip_74s240 port map (p1 => \-mapdrive\, p2 => \-pfw\, p3 => mf24, p4 => \-pfr\, p5 => mf25, p6 => hi12, p7 => mf26, p8 => \-vmap4\, p9 => mf27, p11 => \-vmap3\, p12 => mf28, p13 => \-vmap2\, p14 => mf29, p15 => \-vmap1\, p16 => mf30, p17 => \-vmap0\, p18 => mf31, p19 => \-mapdrive\);
vmemdr_1a03 : dip_74s240 port map (p1 => \-mapdrive\, p2 => \-vmo15\, p3 => mf8, p4 => \-vmo14\, p5 => mf9, p6 => \-vmo13\, p7 => mf10, p8 => \-vmo12\, p9 => mf11, p11 => \-vmo11\, p12 => mf12, p13 => \-vmo10\, p14 => mf13, p15 => \-vmo9\, p16 => mf14, p17 => \-vmo8\, p18 => mf15, p19 => \-mapdrive\);
vmemdr_1a07 : dip_74s240 port map (p1 => \-mapdrive\, p2 => \-vmo23\, p3 => mf16, p4 => \-vmo22\, p5 => mf17, p6 => \-vmo21\, p7 => mf18, p8 => \-vmo20\, p9 => mf19, p11 => \-vmo19\, p12 => mf20, p13 => \-vmo18\, p14 => mf21, p15 => \-vmo17\, p16 => mf22, p17 => \-vmo16\, p18 => mf23, p19 => \-mapdrive\);
vmemdr_1a08 : \-mapdrive\ <= tse1a nand srcmap;
vmemdr_1a13 : dip_74s240 port map (p1 => \-mapdrive\, p2 => \-vmo7\, p3 => mf0, p4 => \-vmo6\, p5 => mf1, p6 => \-vmo5\, p7 => mf2, p8 => \-vmo4\, p9 => mf3, p11 => \-vmo3\, p12 => mf4, p13 => \-vmo2\, p14 => mf5, p15 => \-vmo1\, p16 => mf6, p17 => \-vmo0\, p18 => mf7, p19 => \-mapdrive\);
vmemdr_1d14 : dip_74s373 port map (p1 => gnd, p2 => \-lvmo23\, p3 => \-vmo23\, p4 => \-vmo22\, p5 => \-lvmo22\, p6 => \-pma21\, p7 => \-vmo13\, p8 => \-vmo12\, p9 => \-pma20\, p11 => memstart, p12 => \-pma19\, p13 => \-vmo11\, p14 => \-vmo10\, p15 => \-pma18\, p16 => \-pma17\, p17 => \-vmo9\, p18 => \-vmo8\, p19 => \-pma16\);
vmemdr_1d15 : dip_74s373 port map (p1 => gnd, p2 => \-pma15\, p3 => \-vmo7\, p4 => \-vmo6\, p5 => \-pma14\, p6 => \-pma13\, p7 => \-vmo5\, p8 => \-vmo4\, p9 => \-pma12\, p11 => memstart, p12 => \-pma11\, p13 => \-vmo3\, p14 => \-vmo2\, p15 => \-pma10\, p16 => \-pma9\, p17 => \-vmo1\, p18 => \-vmo0\, p19 => \-pma8\);
vmemdr_1e17 : dip_93s48 port map (p1 => \-vma6\, p2 => \-vma5\, p3 => \-vma4\, p4 => \-vma3\, p5 => \-vma2\, p6 => \-vma1\, p7 => \-vma0\, p9 => net_0, p10 => open, p11 => \-pma11\, p12 => \-pma10\, p13 => \-pma9\, p14 => \-pma8\, p15 => \-vma7\);
vmemdr_1e18 : dip_93s48 port map (p1 => \-pma18\, p2 => \-pma17\, p3 => \-pma16\, p4 => \-pma15\, p5 => \-pma14\, p6 => \-pma13\, p7 => \-pma12\, p9 => \-adrpar\, p10 => open, p11 => net_0, p12 => gnd, p13 => \-pma21\, p14 => \-pma20\, p15 => \-pma19\);
vmemdr_2a05 : dip_74s04 port map (p1 => '0', p2 => open, p3 => '0', p4 => open, p5 => '0', p6 => open, p8 => srcmap, p9 => \-srcmap\, p10 => open, p11 => '0', p12 => open, p13 => '0');
end architecture;
