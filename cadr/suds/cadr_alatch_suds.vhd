-- ALATCH -- A MEMORY LATCH

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_alatch is
begin
alatch_3a01 : dip_74s373 port map (p1 => \-amemenb\, p2 => a23, p3 => amem23, p4 => amem22, p5 => a22, p6 => a21, p7 => amem21, p8 => amem20, p9 => a20, p11 => clk3e, p12 => a19, p13 => amem19, p14 => amem18, p15 => a18, p16 => a17, p17 => amem17, p18 => amem16, p19 => a16);
alatch_3a02 : dip_74s241 port map (p1 => \-apassenb\, p2 => l15, p3 => a8, p4 => l14, p5 => a9, p6 => l13, p7 => a10, p8 => l12, p9 => a11, p11 => l11, p12 => a12, p13 => l10, p14 => a13, p15 => l9, p16 => a14, p17 => l8, p18 => a15, p19 => apassenb);
alatch_3a03 : dip_74s373 port map (p1 => \-amemenb\, p2 => a15, p3 => amem15, p4 => amem14, p5 => a14, p6 => a13, p7 => amem13, p8 => amem12, p9 => a12, p11 => clk3e, p12 => a11, p13 => amem11, p14 => amem10, p15 => a10, p16 => a9, p17 => amem9, p18 => amem8, p19 => a8);
alatch_3a04 : dip_74s241 port map (p1 => \-apassenb\, p2 => l7, p3 => a0, p4 => l6, p5 => a1, p6 => l5, p7 => a2, p8 => l4, p9 => a3, p11 => l3, p12 => a4, p13 => l2, p14 => a5, p15 => l1, p16 => a6, p17 => l0, p18 => a7, p19 => apassenb);
alatch_3a05 : dip_74s373 port map (p1 => \-amemenb\, p2 => a7, p3 => amem7, p4 => amem6, p5 => a6, p6 => a5, p7 => amem5, p8 => amem4, p9 => a4, p11 => clk3e, p12 => a3, p13 => amem3, p14 => amem2, p15 => a2, p16 => a1, p17 => amem1, p18 => amem0, p19 => a0);
alatch_3b01 : dip_74s241 port map (p1 => hi5, p2 => 'Z', p3 => a31b, p4 => 'Z', p5 => aparity, p6 => 'Z', p7 => open, p8 => 'Z', p9 => open, p11 => 'Z', p12 => open, p13 => 'Z', p14 => open, p15 => lparity, p16 => open, p17 => l31, p18 => open, p19 => apassenb);
alatch_3b02 : dip_74s373 port map (p1 => \-amemenb\, p2 => open, p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p7 => 'Z', p8 => 'Z', p9 => open, p11 => clk3e, p12 => open, p13 => 'Z', p14 => 'Z', p15 => open, p16 => aparity, p17 => amemparity, p18 => amem31, p19 => a31b);
alatch_3b03 : dip_74s241 port map (p1 => \-apassenb\, p2 => l31, p3 => a24, p4 => l30, p5 => a25, p6 => l29, p7 => a26, p8 => l28, p9 => a27, p11 => l27, p12 => a28, p13 => l26, p14 => a29, p15 => l25, p16 => a30, p17 => l24, p18 => a31a, p19 => apassenb);
alatch_3b04 : dip_74s373 port map (p1 => \-amemenb\, p2 => a31a, p3 => amem31, p4 => amem30, p5 => a30, p6 => a29, p7 => amem29, p8 => amem28, p9 => a28, p11 => clk3e, p12 => a27, p13 => amem27, p14 => amem26, p15 => a26, p16 => a25, p17 => amem25, p18 => amem24, p19 => a24);
alatch_3b05 : dip_74s241 port map (p1 => \-apassenb\, p2 => l23, p3 => a16, p4 => l22, p5 => a17, p6 => l21, p7 => a18, p8 => l20, p9 => a19, p11 => l19, p12 => a20, p13 => l18, p14 => a21, p15 => l17, p16 => a22, p17 => l16, p18 => a23, p19 => apassenb);
end architecture;
