-- BUSSEL -- BUS FROM UNIBUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_bussel is
begin
bussel_0b23 : dip_74ls244 port map (p1 => \-ub16>bus\, p2 => udi3, p3 => bus0, p4 => udi2, p5 => bus1, p6 => udi1, p7 => bus2, p8 => udi0, p9 => bus3, p11 => wbuf3, p12 => bus0, p13 => wbuf2, p14 => bus1, p15 => wbuf1, p16 => bus2, p17 => wbuf0, p18 => bus3, p19 => \-ub32>bus\);
bussel_0b24 : dip_74ls244 port map (p1 => \-ub16>bus\, p2 => udi7, p3 => bus4, p4 => udi6, p5 => bus5, p6 => udi5, p7 => bus6, p8 => udi4, p9 => bus7, p11 => wbuf7, p12 => bus4, p13 => wbuf6, p14 => bus5, p15 => wbuf5, p16 => bus6, p17 => wbuf4, p18 => bus7, p19 => \-ub32>bus\);
bussel_0b25 : dip_74ls244 port map (p1 => \-ub16>bus\, p2 => udi11, p3 => bus8, p4 => udi10, p5 => bus9, p6 => udi9, p7 => bus10, p8 => udi8, p9 => bus11, p11 => wbuf11, p12 => bus8, p13 => wbuf10, p14 => bus9, p15 => wbuf9, p16 => bus10, p17 => wbuf8, p18 => bus11, p19 => \-ub32>bus\);
bussel_0b26 : dip_74ls244 port map (p1 => \-ub16>bus\, p2 => udi15, p3 => bus12, p4 => udi14, p5 => bus13, p6 => udi13, p7 => bus14, p8 => udi12, p9 => bus15, p11 => wbuf15, p12 => bus12, p13 => wbuf14, p14 => bus13, p15 => wbuf13, p16 => bus14, p17 => wbuf12, p18 => bus15, p19 => \-ub32>bus\);
bussel_0c19 : dip_74ls244 port map (p1 => \-ub32>bus\, p2 => udi7, p3 => bus20, p4 => udi6, p5 => bus21, p6 => udi5, p7 => bus22, p8 => udi4, p9 => bus23, p11 => gnd, p12 => bus20, p13 => gnd, p14 => bus21, p15 => gnd, p16 => bus22, p17 => gnd, p18 => bus23, p19 => \-ub16>bus\);
bussel_0c20 : dip_74ls244 port map (p1 => \-ub32>bus\, p2 => udi11, p3 => bus24, p4 => udi10, p5 => bus25, p6 => udi9, p7 => bus26, p8 => udi8, p9 => bus27, p11 => gnd, p12 => bus24, p13 => gnd, p14 => bus25, p15 => gnd, p16 => bus26, p17 => gnd, p18 => bus27, p19 => \-ub16>bus\);
bussel_0c21 : dip_74ls244 port map (p1 => \-ub32>bus\, p2 => udi15, p3 => bus28, p4 => udi14, p5 => bus29, p6 => udi13, p7 => bus30, p8 => udi12, p9 => bus31, p11 => gnd, p12 => bus28, p13 => gnd, p14 => bus29, p15 => gnd, p16 => bus30, p17 => gnd, p18 => bus31, p19 => \-ub16>bus\);
bussel_0d19 : dip_74ls244 port map (p1 => \-ub32>bus\, p2 => udi3, p3 => bus16, p4 => udi2, p5 => bus17, p6 => udi1, p7 => bus18, p8 => udi0, p9 => bus19, p11 => gnd, p12 => bus16, p13 => gnd, p14 => bus17, p15 => gnd, p16 => bus18, p17 => gnd, p18 => bus19, p19 => \-ub16>bus\);
end architecture;
