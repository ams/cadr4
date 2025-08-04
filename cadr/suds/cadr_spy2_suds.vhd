-- SPY2 -- PDP11 EXAMINE (A, M, FLAG2)

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_spy2 is
begin
spy2_1f11 : dip_74ls244 port map (p1 => \-spy.al\, p2 => aa15, p3 => spy8, p4 => aa14, p5 => spy9, p6 => aa13, p7 => spy10, p8 => aa12, p9 => spy11, p11 => aa11, p12 => spy12, p13 => aa10, p14 => spy13, p15 => aa9, p16 => spy14, p17 => aa8, p18 => spy15, p19 => \-spy.al\);
spy2_1f13 : dip_74ls244 port map (p1 => \-spy.al\, p2 => aa7, p3 => spy0, p4 => aa6, p5 => spy1, p6 => aa5, p7 => spy2, p8 => aa4, p9 => spy3, p11 => aa3, p12 => spy4, p13 => aa2, p14 => spy5, p15 => aa1, p16 => spy6, p17 => aa0, p18 => spy7, p19 => \-spy.al\);
spy2_3a26 : dip_74ls244 port map (p1 => \-spy.ah\, p2 => a31a, p3 => spy8, p4 => a30, p5 => spy9, p6 => a29, p7 => spy10, p8 => a28, p9 => spy11, p11 => a27, p12 => spy12, p13 => a26, p14 => spy13, p15 => a25, p16 => spy14, p17 => a24, p18 => spy15, p19 => \-spy.ah\);
spy2_3a27 : dip_74ls244 port map (p1 => \-spy.ah\, p2 => a23, p3 => spy0, p4 => a22, p5 => spy1, p6 => a21, p7 => spy2, p8 => a20, p9 => spy3, p11 => a19, p12 => spy4, p13 => a18, p14 => spy5, p15 => a17, p16 => spy6, p17 => a16, p18 => spy7, p19 => \-spy.ah\);
spy2_3e16 : dip_74ls244 port map (p1 => \-spy.flag2\, p2 => 'Z', p3 => spy0, p4 => 'Z', p5 => spy1, p6 => ir48, p7 => spy2, p8 => nop, p9 => spy3, p11 => \-vmaok\, p12 => spy4, p13 => jcond, p14 => spy5, p15 => pcs1, p16 => spy6, p17 => pcs0, p18 => spy7, p19 => \-spy.flag2\);
spy2_3f15 : dip_74ls244 port map (p1 => \-spy.flag2\, p2 => 'Z', p3 => spy8, p4 => 'Z', p5 => spy9, p6 => wmapd, p7 => spy10, p8 => destspcd, p9 => spy11, p11 => iwrited, p12 => spy12, p13 => imodd, p14 => spy13, p15 => pdlwrited, p16 => spy14, p17 => spushd, p18 => spy15, p19 => \-spy.flag2\);
spy2_4a13 : dip_74ls244 port map (p1 => \-spy.ml\, p2 => m15, p3 => spy8, p4 => m14, p5 => spy9, p6 => m13, p7 => spy10, p8 => m12, p9 => spy11, p11 => m11, p12 => spy12, p13 => m10, p14 => spy13, p15 => m9, p16 => spy14, p17 => m8, p18 => spy15, p19 => \-spy.ml\);
spy2_4a15 : dip_74ls244 port map (p1 => \-spy.ml\, p2 => m7, p3 => spy0, p4 => m6, p5 => spy1, p6 => m5, p7 => spy2, p8 => m4, p9 => spy3, p11 => m3, p12 => spy4, p13 => m2, p14 => spy5, p15 => m1, p16 => spy6, p17 => m0, p18 => spy7, p19 => \-spy.ml\);
spy2_4b13 : dip_74ls244 port map (p1 => \-spy.mh\, p2 => m23, p3 => spy0, p4 => m22, p5 => spy1, p6 => m21, p7 => spy2, p8 => m20, p9 => spy3, p11 => m19, p12 => spy4, p13 => m18, p14 => spy5, p15 => m17, p16 => spy6, p17 => m16, p18 => spy7, p19 => \-spy.mh\);
spy2_4b17 : dip_74ls244 port map (p1 => \-spy.mh\, p2 => m31, p3 => spy8, p4 => m30, p5 => spy9, p6 => m29, p7 => spy10, p8 => m28, p9 => spy11, p11 => m27, p12 => spy12, p13 => m26, p14 => spy13, p15 => m25, p16 => spy14, p17 => m24, p18 => spy15, p19 => \-spy.mh\);
end architecture;
