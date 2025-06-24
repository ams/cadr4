-- LC -- LOCATION COUNTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_lc is
begin
lc_1a16 : dip_74s241 port map (p1 => \-lcdrive\, p2 => needfetch, p3 => mf24, p4 => gnd, p5 => mf25, p6 => \lc byte mode\, p7 => mf26, p8 => \prog.unibus.reset\, p9 => mf27, p11 => \int.enable\, p12 => mf28, p13 => \sequence.break\, p14 => mf29, p15 => lc25, p16 => mf30, p17 => lc24, p18 => mf31, p19 => lcdrive);
lc_1a18 : \-lcdrive\ <= srclc nand tse1a;
lc_1a20 : dip_74s241 port map (p1 => \-lcdrive\, p2 => lc7, p3 => mf0, p4 => lc6, p5 => mf1, p6 => lc5, p7 => mf2, p8 => lc4, p9 => mf3, p11 => lc3, p12 => mf4, p13 => lc2, p14 => mf5, p15 => lc1, p16 => mf6, p17 => lc0b, p18 => mf7, p19 => lcdrive);
lc_1a22 : dip_74s241 port map (p1 => \-lcdrive\, p2 => lc23, p3 => mf16, p4 => lc22, p5 => mf17, p6 => lc21, p7 => mf18, p8 => lc20, p9 => mf19, p11 => lc19, p12 => mf20, p13 => lc18, p14 => mf21, p15 => lc17, p16 => mf22, p17 => lc16, p18 => mf23, p19 => lcdrive);
lc_1a24 : dip_74s241 port map (p1 => \-lcdrive\, p2 => lc15, p3 => mf8, p4 => lc14, p5 => mf9, p6 => lc13, p7 => mf10, p8 => lc12, p9 => mf11, p11 => lc11, p12 => mf12, p13 => lc10, p14 => mf13, p15 => lc9, p16 => mf14, p17 => lc8, p18 => mf15, p19 => lcdrive);
lc_1a26 : dip_74s169 port map (p1 => hi11, p2 => clk1a, p3 => ob20, p4 => ob21, p5 => ob22, p6 => ob23, p7 => gnd, p9 => \-destlc\, p10 => \-lcry19\, p11 => lc23, p12 => lc22, p13 => lc21, p14 => lc20, p15 => \-lcry23\);
lc_1b28 : dip_74s169 port map (p1 => hi11, p2 => clk1a, p3 => ob16, p4 => ob17, p5 => ob18, p6 => ob19, p7 => gnd, p9 => \-destlc\, p10 => \-lcry15\, p11 => lc19, p12 => lc18, p13 => lc17, p14 => lc16, p15 => \-lcry19\);
lc_1c30 : dip_74s169 port map (p1 => hi11, p2 => clk2a, p3 => ob12, p4 => ob13, p5 => ob14, p6 => ob15, p7 => gnd, p9 => \-destlc\, p10 => \-lcry11\, p11 => lc15, p12 => lc14, p13 => lc13, p14 => lc12, p15 => \-lcry15\);
lc_1d29 : dip_74s169 port map (p1 => hi11, p2 => clk2c, p3 => ob8, p4 => ob9, p5 => ob10, p6 => ob11, p7 => gnd, p9 => \-destlc\, p10 => \-lcry7\, p11 => lc11, p12 => lc10, p13 => lc9, p14 => lc8, p15 => \-lcry11\);
lc_2a04 : lcdrive <= tse1a and srclc;
lc_2a05 : srclc <= not \-srclc\;
lc_2b03 : dip_74s169 port map (p1 => hi11, p2 => clk1a, p3 => ob24, p4 => ob25, p5 => '0', p6 => '0', p7 => gnd, p9 => \-destlc\, p10 => \-lcry23\, p11 => open, p12 => open, p13 => lc25, p14 => lc24, p15 => open);
lc_2c05 : dip_74s169 port map (p1 => hi11, p2 => clk2a, p3 => ob4, p4 => ob5, p5 => ob6, p6 => ob7, p7 => gnd, p9 => \-destlc\, p10 => \-lcry3\, p11 => lc7, p12 => lc6, p13 => lc5, p14 => lc4, p15 => \-lcry7\);
end architecture;
