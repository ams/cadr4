-- PLATCH -- PDL BUFFER LATCH

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_platch is
begin
platch_4a02 : dip_74s373 port map (p1 => \-pdldrive\, p2 => m15, p3 => pdl15, p4 => pdl14, p5 => m14, p6 => m13, p7 => pdl13, p8 => pdl12, p9 => m12, p11 => clk4a, p12 => m11, p13 => pdl11, p14 => pdl10, p15 => m10, p16 => m9, p17 => pdl9, p18 => pdl8, p19 => m8);
platch_4a04 : dip_74s373 port map (p1 => \-pdldrive\, p2 => m7, p3 => pdl7, p4 => pdl6, p5 => m6, p6 => m5, p7 => pdl5, p8 => pdl4, p9 => m4, p11 => clk4a, p12 => m3, p13 => pdl3, p14 => pdl2, p15 => m2, p16 => m1, p17 => pdl1, p18 => pdl0, p19 => m0);
platch_4b03 : dip_74s373 port map (p1 => \-pdldrive\, p2 => m31, p3 => pdl31, p4 => pdl30, p5 => m30, p6 => m29, p7 => pdl29, p8 => pdl28, p9 => m28, p11 => clk4a, p12 => m27, p13 => pdl27, p14 => pdl26, p15 => m26, p16 => m25, p17 => pdl25, p18 => pdl24, p19 => m24);
platch_4b05 : dip_74s373 port map (p1 => \-pdldrive\, p2 => m23, p3 => pdl23, p4 => pdl22, p5 => m22, p6 => m21, p7 => pdl21, p8 => pdl20, p9 => m20, p11 => clk4a, p12 => m19, p13 => pdl19, p14 => pdl18, p15 => m18, p16 => m17, p17 => pdl17, p18 => pdl16, p19 => m16);
platch_4b08 : dip_74s373 port map (p1 => \-pdldrive\, p2 => open, p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p7 => 'Z', p8 => 'Z', p9 => open, p11 => clk4a, p12 => open, p13 => 'Z', p14 => 'Z', p15 => open, p16 => open, p17 => 'Z', p18 => pdlparity, p19 => mparity);
end architecture;
