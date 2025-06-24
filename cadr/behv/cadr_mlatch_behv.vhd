-- MLATCH -- M MEMORY LATCH

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_mlatch is
begin
mlatch_4a01 : dip_74s373 port map (p1 => \-mpassm\, p2 => m23, p3 => mmem23, p4 => mmem22, p5 => m22, p6 => m21, p7 => mmem21, p8 => mmem20, p9 => m20, p11 => clk4a, p12 => m19, p13 => mmem19, p14 => mmem18, p15 => m18, p16 => m17, p17 => mmem17, p18 => mmem16, p19 => m16);
mlatch_4a03 : dip_74s373 port map (p1 => \-mpassm\, p2 => m15, p3 => mmem15, p4 => mmem14, p5 => m14, p6 => m13, p7 => mmem13, p8 => mmem12, p9 => m12, p11 => clk4a, p12 => m11, p13 => mmem11, p14 => mmem10, p15 => m10, p16 => m9, p17 => mmem9, p18 => mmem8, p19 => m8);
mlatch_4a05 : dip_74s373 port map (p1 => \-mpassm\, p2 => m7, p3 => mmem7, p4 => mmem6, p5 => m6, p6 => m5, p7 => mmem5, p8 => mmem4, p9 => m4, p11 => clk4a, p12 => m3, p13 => mmem3, p14 => mmem2, p15 => m2, p16 => m1, p17 => mmem1, p18 => mmem0, p19 => m0);
mlatch_4a06 : dip_74s241 port map (p1 => \-mpassl\, p2 => l15, p3 => mf8, p4 => l14, p5 => mf9, p6 => l13, p7 => mf10, p8 => l12, p9 => mf11, p11 => l11, p12 => mf12, p13 => l10, p14 => mf13, p15 => l9, p16 => mf14, p17 => l8, p18 => mf15, p19 => mpassl);
mlatch_4a08 : dip_74s241 port map (p1 => \-mpassl\, p2 => l7, p3 => mf0, p4 => l6, p5 => mf1, p6 => l5, p7 => mf2, p8 => l4, p9 => mf3, p11 => l3, p12 => mf4, p13 => l2, p14 => mf5, p15 => l1, p16 => mf6, p17 => l0, p18 => mf7, p19 => mpassl);
mlatch_4b02 : dip_74s373 port map (p1 => \-mpassm\, p2 => open, p3 => '0', p4 => '0', p5 => open, p6 => open, p7 => '0', p8 => '0', p9 => open, p11 => clk4a, p12 => open, p13 => '0', p14 => '0', p15 => open, p16 => open, p17 => '0', p18 => mmemparity, p19 => mparity);
mlatch_4b04 : dip_74s373 port map (p1 => \-mpassm\, p2 => m31, p3 => mmem31, p4 => mmem30, p5 => m30, p6 => m29, p7 => mmem29, p8 => mmem28, p9 => m28, p11 => clk4a, p12 => m27, p13 => mmem27, p14 => mmem26, p15 => m26, p16 => m25, p17 => mmem25, p18 => mmem24, p19 => m24);
mlatch_4b07 : dip_74s241 port map (p1 => \-mpassl\, p2 => l31, p3 => mf24, p4 => l30, p5 => mf25, p6 => l29, p7 => mf26, p8 => l28, p9 => mf27, p11 => l27, p12 => mf28, p13 => l26, p14 => mf29, p15 => l25, p16 => mf30, p17 => l24, p18 => mf31, p19 => mpassl);
mlatch_4b09 : dip_74s241 port map (p1 => \-mpassl\, p2 => l23, p3 => mf16, p4 => l22, p5 => mf17, p6 => l21, p7 => mf18, p8 => l20, p9 => mf19, p11 => l19, p12 => mf20, p13 => l18, p14 => mf21, p15 => l17, p16 => mf22, p17 => l16, p18 => mf23, p19 => mpassl);
end architecture;
