-- DIAG -- DIAGNOSTIC BUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_diag is
begin
diag_0a11 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-spy read\, p9 => ubrd, p10 => \select spy\, p11 => open, p12 => 'Z', p13 => 'Z');
diag_0a13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => \select spy\, p11 => \-select spy\, p12 => open, p13 => 'Z');
diag_0a14 : dip_74s10 port map (p1 => 'Z', p2 => 'Z', p3 => \select spy\, p4 => ubwr, p5 => \ub reg write pulse\, p6 => \-spy write\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => open, p13 => 'Z');
diag_0a20 : dip_8304 port map (p1 => udo7, p2 => udo6, p3 => udo5, p4 => udo4, p5 => udo3, p6 => udo2, p7 => udo1, p8 => udo0, p9 => \-select spy\, p11 => ubwr, p12 => spy0, p13 => spy1, p14 => spy2, p15 => spy3, p16 => spy4, p17 => spy5, p18 => spy6, p19 => spy7);
diag_0a21 : dip_8304 port map (p1 => udo15, p2 => udo14, p3 => udo13, p4 => udo12, p5 => udo11, p6 => udo10, p7 => udo9, p8 => udo8, p9 => \-select spy\, p11 => ubwr, p12 => spy8, p13 => spy9, p14 => spy10, p15 => spy11, p16 => spy12, p17 => spy13, p18 => spy14, p19 => spy15);
end architecture;
