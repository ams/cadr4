-- L -- L REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_l is
begin
l_3c26 : dip_74s374 port map (p1 => gnd, p2 => l7, p3 => ob7, p4 => ob6, p5 => l6, p6 => l5, p7 => ob5, p8 => ob4, p9 => l4, p11 => clk3f, p12 => l3, p13 => ob3, p14 => ob2, p15 => l2, p16 => l1, p17 => ob1, p18 => ob0, p19 => l0);
l_3c27 : dip_74s374 port map (p1 => gnd, p2 => l15, p3 => ob15, p4 => ob14, p5 => l14, p6 => l13, p7 => ob13, p8 => ob12, p9 => l12, p11 => clk3f, p12 => l11, p13 => ob11, p14 => ob10, p15 => l10, p16 => l9, p17 => ob9, p18 => ob8, p19 => l8);
l_3c28 : dip_74s374 port map (p1 => gnd, p2 => l23, p3 => ob23, p4 => ob22, p5 => l22, p6 => l21, p7 => ob21, p8 => ob20, p9 => l20, p11 => clk3f, p12 => l19, p13 => ob19, p14 => ob18, p15 => l18, p16 => l17, p17 => ob17, p18 => ob16, p19 => l16);
l_3c29 : dip_74s374 port map (p1 => gnd, p2 => l31, p3 => ob31, p4 => ob30, p5 => l30, p6 => l29, p7 => ob29, p8 => ob28, p9 => l28, p11 => clk3f, p12 => l27, p13 => ob27, p14 => ob26, p15 => l26, p16 => l25, p17 => ob25, p18 => ob24, p19 => l24);
l_4c03 : dip_93s48 port map (p1 => l5, p2 => l6, p3 => l7, p4 => l8, p5 => l9, p6 => l10, p7 => l11, p9 => lparl, p10 => open, p11 => l0, p12 => l1, p13 => l2, p14 => l3, p15 => l4);
l_4c08 : dip_93s48 port map (p1 => l17, p2 => l18, p3 => l19, p4 => l20, p5 => l21, p6 => l22, p7 => l23, p9 => open, p10 => \-lparm\, p11 => l12, p12 => l13, p13 => l14, p14 => l15, p15 => l16);
l_4c09 : dip_93s48 port map (p1 => l25, p2 => l26, p3 => l27, p4 => l28, p5 => l29, p6 => l30, p7 => l31, p9 => lparity, p10 => \-lparity\, p11 => lparl, p12 => \-lparm\, p13 => gnd, p14 => gnd, p15 => l24);
end architecture;
