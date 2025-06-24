-- PDLPTR -- PDL INDEX AND POINTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_pdlptr is
begin
pdlptr_3c21 : dip_74s169 port map (p1 => \-srcpdlpop\, p2 => clk3f, p3 => ob8, p4 => ob9, p5 => '0', p6 => '0', p7 => gnd, p9 => \-destpdlp\, p10 => \-pdlcry7\, p11 => open, p12 => open, p13 => pdlptr9, p14 => pdlptr8, p15 => open);
pdlptr_3c22 : dip_25s07 port map (p1 => \-destpdlx\, p2 => pdlidx6, p3 => ob6, p4 => ob7, p5 => pdlidx7, p6 => ob8, p7 => pdlidx8, p9 => clk3f, p10 => pdlidx9, p11 => ob9, p12 => open, p13 => '0', p14 => '0', p15 => open);
pdlptr_3d24 : dip_74s169 port map (p1 => \-srcpdlpop\, p2 => clk3f, p3 => ob4, p4 => ob5, p5 => ob6, p6 => ob7, p7 => gnd, p9 => \-destpdlp\, p10 => \-pdlcry3\, p11 => pdlptr7, p12 => pdlptr6, p13 => pdlptr5, p14 => pdlptr4, p15 => \-pdlcry7\);
pdlptr_3d25 : dip_25s07 port map (p1 => \-destpdlx\, p2 => pdlidx0, p3 => ob0, p4 => ob1, p5 => pdlidx1, p6 => ob2, p7 => pdlidx2, p9 => clk3f, p10 => pdlidx3, p11 => ob3, p12 => pdlidx4, p13 => ob4, p14 => ob5, p15 => pdlidx5);
pdlptr_3d30 : dip_74s169 port map (p1 => \-srcpdlpop\, p2 => clk3f, p3 => ob0, p4 => ob1, p5 => ob2, p6 => ob3, p7 => gnd, p9 => \-destpdlp\, p10 => \-pdlcnt\, p11 => pdlptr3, p12 => pdlptr2, p13 => pdlptr1, p14 => pdlptr0, p15 => \-pdlcry3\);
pdlptr_4c01 : dip_74s241 port map (p1 => \-ppdrive\, p2 => pdlptr3, p3 => mf0, p4 => pdlptr2, p5 => mf1, p6 => pdlptr1, p7 => mf2, p8 => pdlptr0, p9 => mf3, p11 => pdlidx3, p12 => mf0, p13 => pdlidx2, p14 => mf1, p15 => pdlidx1, p16 => mf2, p17 => pdlidx0, p18 => mf3, p19 => pidrive);
pdlptr_4d04 : dip_74s241 port map (p1 => \-ppdrive\, p2 => gnd, p3 => mf8, p4 => gnd, p5 => mf9, p6 => pdlptr9, p7 => mf10, p8 => pdlptr8, p9 => mf11, p11 => gnd, p12 => mf8, p13 => gnd, p14 => mf9, p15 => pdlidx9, p16 => mf10, p17 => pdlidx8, p18 => mf11, p19 => pidrive);
pdlptr_4d05 : dip_74s241 port map (p1 => \-ppdrive\, p2 => pdlptr7, p3 => mf4, p4 => pdlptr6, p5 => mf5, p6 => pdlptr5, p7 => mf6, p8 => pdlptr4, p9 => mf7, p11 => pdlidx7, p12 => mf4, p13 => pdlidx6, p14 => mf5, p15 => pdlidx5, p16 => mf6, p17 => pdlidx4, p18 => mf7, p19 => pidrive);
pdlptr_4d06 : dip_74s08 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => pidrive, p9 => srcpdlidx, p10 => tse4b, p11 => open, p12 => '0', p13 => '0');
pdlptr_4d08 : dip_74s00 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => \-ppdrive\, p9 => srcpdlptr, p10 => tse4b, p11 => open, p12 => '0', p13 => '0');
end architecture;
