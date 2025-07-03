-- SPCLCH -- SPC MEMORY LATCH

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_spclch is
begin
spclch_4a07 : dip_74s373 port map (p1 => \-spcdrive\, p2 => m23, p3 => gnd, p4 => gnd, p5 => m22, p6 => m21, p7 => gnd, p8 => gnd, p9 => m20, p11 => clk4c, p12 => m19, p13 => gnd, p14 => spco18, p15 => m18, p16 => m17, p17 => spco17, p18 => spco16, p19 => m16);
spclch_4a09 : dip_74s373 port map (p1 => \-spcdrive\, p2 => m15, p3 => spco15, p4 => spco14, p5 => m14, p6 => m13, p7 => spco13, p8 => spco12, p9 => m12, p11 => clk4c, p12 => m11, p13 => spco11, p14 => spco10, p15 => m10, p16 => m9, p17 => spco9, p18 => spco8, p19 => m8);
spclch_4a10 : dip_74s373 port map (p1 => \-spcdrive\, p2 => m7, p3 => spco7, p4 => spco6, p5 => m6, p6 => m5, p7 => spco5, p8 => spco4, p9 => m4, p11 => clk4c, p12 => m3, p13 => spco3, p14 => spco2, p15 => m2, p16 => m1, p17 => spco1, p18 => spco0, p19 => m0);
spclch_4b10 : dip_74s241 port map (p1 => \-spcdrive\, p2 => gnd, p3 => m24, p4 => gnd, p5 => m25, p6 => gnd, p7 => m26, p8 => spcptr4, p9 => m27, p11 => spcptr3, p12 => m28, p13 => spcptr2, p14 => m29, p15 => spcptr1, p16 => m30, p17 => spcptr0, p18 => m31, p19 => spcdrive);
spclch_4e16 : dip_74s241 port map (p1 => hi1, p2 => 'Z', p3 => spc16, p4 => 'Z', p5 => spc17, p6 => 'Z', p7 => spc18, p8 => 'Z', p9 => spcpar, p11 => spcwpar, p12 => open, p13 => spcw18, p14 => open, p15 => spcw17, p16 => open, p17 => spcw16, p18 => open, p19 => spcwpass);
spclch_4e17 : dip_74s241 port map (p1 => \-spcwpass\, p2 => spcw15, p3 => spc8, p4 => spcw14, p5 => spc9, p6 => spcw13, p7 => spc10, p8 => spcw12, p9 => spc11, p11 => spcw11, p12 => spc12, p13 => spcw10, p14 => spc13, p15 => spcw9, p16 => spc14, p17 => spcw8, p18 => spc15, p19 => spcwpass);
spclch_4e18 : dip_74s241 port map (p1 => \-spcwpass\, p2 => spcw7, p3 => spc0, p4 => spcw6, p5 => spc1, p6 => spcw5, p7 => spc2, p8 => spcw4, p9 => spc3, p11 => spcw3, p12 => spc4, p13 => spcw2, p14 => spc5, p15 => spcw1, p16 => spc6, p17 => spcw0, p18 => spc7, p19 => spcwpass);
spclch_4f18 : dip_74s373 port map (p1 => \-spcpass\, p2 => open, p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p7 => 'Z', p8 => 'Z', p9 => open, p11 => clk4d, p12 => spcpar, p13 => spcopar, p14 => spco18, p15 => spc18, p16 => spc17, p17 => spco17, p18 => spco16, p19 => spc16);
spclch_4f19 : dip_74s373 port map (p1 => \-spcpass\, p2 => spc15, p3 => spco15, p4 => spco14, p5 => spc14, p6 => spc13, p7 => spco13, p8 => spco12, p9 => spc12, p11 => clk4d, p12 => spc11, p13 => spco11, p14 => spco10, p15 => spc10, p16 => spc9, p17 => spco9, p18 => spco8, p19 => spc8);
spclch_4f20 : dip_74s373 port map (p1 => \-spcpass\, p2 => spc7, p3 => spco7, p4 => spco6, p5 => spc6, p6 => spc5, p7 => spco5, p8 => spco4, p9 => spc4, p11 => clk4d, p12 => spc3, p13 => spco3, p14 => spco2, p15 => spc2, p16 => spc1, p17 => spco1, p18 => spco0, p19 => spc0);
end architecture;
