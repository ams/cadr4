-- UBINTC -- UNIBUS INTERRUPT CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubintc is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
begin
ubintc_0d05 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => net_00, p12 => \-load int ctl2 reg\, p13 => \-intr ssyn\);
ubintc_0d13 : dip_74ls74 port map (p1 => \intr in\, p2 => \intr in\, p3 => \-clk\, p4 => \hi 15-30\, p5 => net_03, p6 => open, p8 => \-intr ssyn\, p9 => \intr ssyn\, p10 => \hi 15-30\, p11 => \-clk\, p12 => net_03, p13 => \intr in\);
ubintc_0d14 : dip_74ls74 port map (p1 => \-reset\, p2 => udi0, p3 => \-load int ctl reg\, p4 => net_02, p5 => \disable int grant\, p6 => \-disable int grant\, p8 => net_02, p9 => open, p10 => \hi 15-30\, p11 => \intr ssyn\, p12 => \int stops grants\, p13 => \-disable int grant\);
ubintc_0d15 : dip_74ls74 port map (p1 => \-reset\, p2 => udi15, p3 => \-load int ctl2 reg\, p4 => net_01, p5 => \ub int\, p6 => \-ub int\, p8 => net_01, p9 => open, p10 => \hi 15-30\, p11 => \intr ssyn\, p12 => \enable ub ints\, p13 => \-ub int\);
ubintc_0d16 : dip_25ls2519 port map (p1 => udi13, p2 => level1, p3 => udo13, p4 => udi12, p5 => level0, p6 => udo12, p7 => gnd, p8 => \-intc drive\, p9 => \-load int ctl reg\, p11 => udo11, p12 => \int stops grants\, p13 => udi11, p14 => udo10, p15 => \enable ub ints\, p16 => udi10, p17 => gnd, p18 => gnd, p19 => \hi 15-30\);
ubintc_0d17 : dip_74ls374 port map (p1 => \-intc drive\, p2 => udo9, p3 => udi9, p4 => udi8, p5 => udo8, p6 => udo7, p7 => udi7, p8 => udi6, p9 => udo6, p11 => net_00, p12 => udo5, p13 => udi5, p14 => udi4, p15 => udo4, p16 => udo3, p17 => udi3, p18 => udi2, p19 => udo2);
ubintc_0d18 : dip_74ls240 port map (p1 => \-lmadr>xbus\, p2 => 'Z', p3 => udo1, p4 => 'Z', p5 => udo0, p6 => \-adr21\, p7 => udo15, p8 => \-adr20\, p9 => udo14, p11 => \-xbus intr in\, p12 => xao20, p13 => \-ub int\, p14 => xao21, p15 => \-disable int grant\, p16 => open, p17 => \-local enable\, p18 => open, p19 => \-intc drive\);
ubintc_0e02 : dip_74s08 port map (p1 => \local enable\, p2 => \unibus intr in\, p3 => \intr in\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
ubintc_0e04 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \lm int\, p9 => \ub int\, p10 => \xbus intr in\, p11 => open, p12 => 'Z', p13 => 'Z');
ubintc_0e05 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => \-xbus intr in\, p11 => \xbus intr in\, p12 => open, p13 => 'Z');
end architecture;
