-- SPY1 -- PDP11 EXAMINE (IR, OB)

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_spy1 is
begin
spy1_2c17 : dip_74ls244 port map (p1 => \-spy.obl\, p2 => ob7, p3 => spy0, p4 => ob6, p5 => spy1, p6 => ob5, p7 => spy2, p8 => ob4, p9 => spy3, p11 => ob3, p12 => spy4, p13 => ob2, p14 => spy5, p15 => ob1, p16 => spy6, p17 => ob0, p18 => spy7, p19 => \-spy.obl\);
spy1_2c18 : dip_74ls244 port map (p1 => \-spy.obl\, p2 => ob15, p3 => spy8, p4 => ob14, p5 => spy9, p6 => ob13, p7 => spy10, p8 => ob12, p9 => spy11, p11 => ob11, p12 => spy12, p13 => ob10, p14 => spy13, p15 => ob9, p16 => spy14, p17 => ob8, p18 => spy15, p19 => \-spy.obl\);
spy1_3c23 : dip_74ls244 port map (p1 => \-spy.obh\, p2 => ob23, p3 => spy0, p4 => ob22, p5 => spy1, p6 => ob21, p7 => spy2, p8 => ob20, p9 => spy3, p11 => ob19, p12 => spy4, p13 => ob18, p14 => spy5, p15 => ob17, p16 => spy6, p17 => ob16, p18 => spy7, p19 => \-spy.obh\);
spy1_3c24 : dip_74ls244 port map (p1 => \-spy.obh\, p2 => ob31, p3 => spy8, p4 => ob30, p5 => spy9, p6 => ob29, p7 => spy10, p8 => ob28, p9 => spy11, p11 => ob27, p12 => spy12, p13 => ob26, p14 => spy13, p15 => ob25, p16 => spy14, p17 => ob24, p18 => spy15, p19 => \-spy.obh\);
spy1_3e01 : dip_74ls244 port map (p1 => \-spy.irl\, p2 => ir7, p3 => spy0, p4 => ir6, p5 => spy1, p6 => ir5, p7 => spy2, p8 => ir4, p9 => spy3, p11 => ir3, p12 => spy4, p13 => ir2, p14 => spy5, p15 => ir1, p16 => spy6, p17 => ir0, p18 => spy7, p19 => \-spy.irl\);
spy1_3e03 : dip_74ls244 port map (p1 => \-spy.irl\, p2 => ir15, p3 => spy8, p4 => ir14, p5 => spy9, p6 => ir13, p7 => spy10, p8 => ir12, p9 => spy11, p11 => ir11, p12 => spy12, p13 => ir10, p14 => spy13, p15 => ir9, p16 => spy14, p17 => ir8, p18 => spy15, p19 => \-spy.irl\);
spy1_3e06 : dip_74ls244 port map (p1 => \-spy.irh\, p2 => ir47, p3 => spy8, p4 => ir46, p5 => spy9, p6 => ir45, p7 => spy10, p8 => ir44, p9 => spy11, p11 => ir43, p12 => spy12, p13 => ir42, p14 => spy13, p15 => ir41, p16 => spy14, p17 => ir40, p18 => spy15, p19 => \-spy.irh\);
spy1_3f21 : dip_74ls244 port map (p1 => \-spy.irh\, p2 => ir39, p3 => spy0, p4 => ir38, p5 => spy1, p6 => ir37, p7 => spy2, p8 => ir36, p9 => spy3, p11 => ir35, p12 => spy4, p13 => ir34, p14 => spy5, p15 => ir33, p16 => spy6, p17 => ir32, p18 => spy7, p19 => \-spy.irh\);
spy1_3f23 : dip_74ls244 port map (p1 => \-spy.irm\, p2 => ir31, p3 => spy8, p4 => ir30, p5 => spy9, p6 => ir29, p7 => spy10, p8 => ir28, p9 => spy11, p11 => ir27, p12 => spy12, p13 => ir26, p14 => spy13, p15 => ir25, p16 => spy14, p17 => ir24, p18 => spy15, p19 => \-spy.irm\);
spy1_3f25 : dip_74ls244 port map (p1 => \-spy.irm\, p2 => ir23, p3 => spy0, p4 => ir22, p5 => spy1, p6 => ir21, p7 => spy2, p8 => ir20, p9 => spy3, p11 => ir19, p12 => spy4, p13 => ir18, p14 => spy5, p15 => ir17, p16 => spy6, p17 => ir16, p18 => spy7, p19 => \-spy.irm\);
end architecture;
