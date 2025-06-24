-- IWR -- INSTRUCTION WRITE REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iwr is
begin
iwr_1f12 : dip_74s374 port map (p1 => gnd, p2 => iwr47, p3 => aa15, p4 => aa14, p5 => iwr46, p6 => iwr45, p7 => aa13, p8 => aa12, p9 => iwr44, p11 => clk2c, p12 => iwr43, p13 => aa11, p14 => aa10, p15 => iwr42, p16 => iwr41, p17 => aa9, p18 => aa8, p19 => iwr40);
iwr_1f14 : dip_74s374 port map (p1 => gnd, p2 => iwr39, p3 => aa7, p4 => aa6, p5 => iwr38, p6 => iwr37, p7 => aa5, p8 => aa4, p9 => iwr36, p11 => clk2c, p12 => iwr35, p13 => aa3, p14 => aa2, p15 => iwr34, p16 => iwr33, p17 => aa1, p18 => aa0, p19 => iwr32);
iwr_4b01 : dip_74s374 port map (p1 => gnd, p2 => iwr15, p3 => m15, p4 => m14, p5 => iwr14, p6 => iwr13, p7 => m13, p8 => m12, p9 => iwr12, p11 => clk4c, p12 => iwr11, p13 => m11, p14 => m10, p15 => iwr10, p16 => iwr9, p17 => m9, p18 => m8, p19 => iwr8);
iwr_4b06 : dip_74s374 port map (p1 => gnd, p2 => iwr7, p3 => m7, p4 => m6, p5 => iwr6, p6 => iwr5, p7 => m5, p8 => m4, p9 => iwr4, p11 => clk4c, p12 => iwr3, p13 => m3, p14 => m2, p15 => iwr2, p16 => iwr1, p17 => m1, p18 => m0, p19 => iwr0);
iwr_4c04 : dip_74s374 port map (p1 => gnd, p2 => iwr31, p3 => m31, p4 => m30, p5 => iwr30, p6 => iwr29, p7 => m29, p8 => m28, p9 => iwr28, p11 => clk4c, p12 => iwr27, p13 => m27, p14 => m26, p15 => iwr26, p16 => iwr25, p17 => m25, p18 => m24, p19 => iwr24);
iwr_4c05 : dip_74s374 port map (p1 => gnd, p2 => iwr23, p3 => m23, p4 => m22, p5 => iwr22, p6 => iwr21, p7 => m21, p8 => m20, p9 => iwr20, p11 => clk4c, p12 => iwr19, p13 => m19, p14 => m18, p15 => iwr18, p16 => iwr17, p17 => m17, p18 => m16, p19 => iwr16);
end architecture;
