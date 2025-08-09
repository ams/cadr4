-- RBUF -- READ BUFFER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_rbuf is
begin
rbuf_0c22 : dip_74ls244 port map (p1 => \-ub read buffer\, p2 => rbuf27, p3 => udo8, p4 => rbuf26, p5 => udo9, p6 => rbuf25, p7 => udo10, p8 => rbuf24, p9 => udo11, p11 => bus11, p12 => udo8, p13 => bus10, p14 => udo9, p15 => bus9, p16 => udo10, p17 => bus8, p18 => udo11, p19 => \-bus>ub\);
rbuf_0c23 : dip_74ls244 port map (p1 => \-ub read buffer\, p2 => rbuf31, p3 => udo12, p4 => rbuf30, p5 => udo13, p6 => rbuf29, p7 => udo14, p8 => rbuf28, p9 => udo15, p11 => bus15, p12 => udo12, p13 => bus14, p14 => udo13, p15 => bus13, p16 => udo14, p17 => bus12, p18 => udo15, p19 => \-bus>ub\);
rbuf_0d21 : dip_74ls244 port map (p1 => \-ub read buffer\, p2 => rbuf19, p3 => udo0, p4 => rbuf18, p5 => udo1, p6 => rbuf17, p7 => udo2, p8 => rbuf16, p9 => udo3, p11 => bus3, p12 => udo0, p13 => bus2, p14 => udo1, p15 => bus1, p16 => udo2, p17 => bus0, p18 => udo3, p19 => \-bus>ub\);
rbuf_0d22 : dip_74ls244 port map (p1 => \-ub read buffer\, p2 => rbuf23, p3 => udo4, p4 => rbuf22, p5 => udo5, p6 => rbuf21, p7 => udo6, p8 => rbuf20, p9 => udo7, p11 => bus7, p12 => udo4, p13 => bus6, p14 => udo5, p15 => bus5, p16 => udo6, p17 => bus4, p18 => udo7, p19 => \-bus>ub\);
rbuf_0d23 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-rbufwe\, p4 => bus19, p5 => rbuf19, p6 => bus18, p7 => rbuf18, p9 => rbuf17, p10 => bus17, p11 => rbuf16, p12 => bus16, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
rbuf_0d24 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-rbufwe\, p4 => bus23, p5 => rbuf23, p6 => bus22, p7 => rbuf22, p9 => rbuf21, p10 => bus21, p11 => rbuf20, p12 => bus20, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
rbuf_0d25 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-rbufwe\, p4 => bus27, p5 => rbuf27, p6 => bus26, p7 => rbuf26, p9 => rbuf25, p10 => bus25, p11 => rbuf24, p12 => bus24, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
rbuf_0d26 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-rbufwe\, p4 => bus31, p5 => rbuf31, p6 => bus30, p7 => rbuf30, p9 => rbuf29, p10 => bus29, p11 => rbuf28, p12 => bus28, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
end architecture;
