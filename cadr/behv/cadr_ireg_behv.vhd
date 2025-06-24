-- IREG -- INSTRUCTION REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_ireg is
begin
ireg_3c01 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir15, p3 => iob15, p4 => i15, p5 => i14, p6 => iob14, p7 => ir14, p9 => clk3a, p10 => ir13, p11 => iob13, p12 => i13, p13 => i12, p14 => iob12, p15 => ir12);
ireg_3c02 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir11, p3 => iob11, p4 => i11, p5 => i10, p6 => iob10, p7 => ir10, p9 => clk3a, p10 => ir9, p11 => iob9, p12 => i9, p13 => i8, p14 => iob8, p15 => ir8);
ireg_3c03 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir7, p3 => iob7, p4 => i7, p5 => i6, p6 => iob6, p7 => ir6, p9 => clk3a, p10 => ir5, p11 => iob5, p12 => i5, p13 => i4, p14 => iob4, p15 => ir4);
ireg_3c04 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir3, p3 => iob3, p4 => i3, p5 => i2, p6 => iob2, p7 => ir2, p9 => clk3a, p10 => ir1, p11 => iob1, p12 => i1, p13 => i0, p14 => iob0, p15 => ir0);
ireg_3c17 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir23, p3 => iob23, p4 => i23, p5 => i22, p6 => iob22, p7 => ir22, p9 => clk3b, p10 => ir21, p11 => iob21, p12 => i21, p13 => i20, p14 => iob20, p15 => ir20);
ireg_3c19 : dip_25s09 port map (p1 => \-destimod0\, p2 => ir19, p3 => iob19, p4 => i19, p5 => i18, p6 => iob18, p7 => ir18, p9 => clk3b, p10 => ir17, p11 => iob17, p12 => i17, p13 => i16, p14 => iob16, p15 => ir16);
ireg_3d06 : dip_25s09 port map (p1 => \-destimod1\, p2 => open, p3 => '0', p4 => '0', p5 => i48, p6 => gnd, p7 => ir48, p9 => clk3a, p10 => ir47, p11 => iob47, p12 => i47, p13 => i46, p14 => iob46, p15 => ir46);
ireg_3d07 : dip_25s09 port map (p1 => \-destimod1\, p2 => ir45, p3 => iob45, p4 => i45, p5 => i44, p6 => iob44, p7 => ir44, p9 => clk3a, p10 => ir43, p11 => iob43, p12 => i43, p13 => i42, p14 => iob42, p15 => ir42);
ireg_3d16 : dip_25s09 port map (p1 => \-destimod1\, p2 => ir41, p3 => iob41, p4 => i41, p5 => i40, p6 => iob40, p7 => ir40, p9 => clk3b, p10 => ir39, p11 => iob39, p12 => i39, p13 => i38, p14 => iob38, p15 => ir38);
ireg_3d17 : dip_25s09 port map (p1 => \-destimod1\, p2 => ir37, p3 => iob37, p4 => i37, p5 => i36, p6 => iob36, p7 => ir36, p9 => clk3b, p10 => ir35, p11 => iob35, p12 => i35, p13 => i34, p14 => iob34, p15 => ir34);
ireg_3d18 : dip_25s09 port map (p1 => \-destimod1\, p2 => ir33, p3 => iob33, p4 => i33, p5 => i32, p6 => iob32, p7 => ir32, p9 => clk3b, p10 => ir31, p11 => iob31, p12 => i31, p13 => i30, p14 => iob30, p15 => ir30);
ireg_3d19 : dip_25s09 port map (p1 => \-destimod1\, p2 => ir29, p3 => iob29, p4 => i29, p5 => i28, p6 => iob28, p7 => ir28, p9 => clk3b, p10 => ir27, p11 => iob27, p12 => i27, p13 => i26, p14 => iob26, p15 => ir26);
ireg_3d20 : dip_25s09 port map (p1 => \-destimod0\, p2 => open, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => clk3b, p10 => ir25, p11 => iob25, p12 => i25, p13 => i24, p14 => iob24, p15 => ir24);
end architecture;
