-- IRAM11 -- RAM 4K-8K 12-23

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram11 is
begin
iram11_2d16 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i22, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr22, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2d17 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i23, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr23, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2d18 : pc6f <= not \-pcb6\;
              pc7f <= not \-pcb7\;
              pc8f <= not \-pcb8\;
              pc9f <= not \-pcb9\;
              pc10f <= not \-pcb10\;
              pc11f <= not \-pcb11\;
iram11_2d19 : pc0f <= not \-pcb0\;
              pc1f <= not \-pcb1\;
              pc2f <= not \-pcb2\;
              pc3f <= not \-pcb3\;
              pc4f <= not \-pcb4\;
              pc5f <= not \-pcb5\;
iram11_2e16 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i17, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr17, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e17 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i18, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr18, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e18 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i19, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr19, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e19 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i20, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr20, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e20 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i21, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr21, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f16 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i12, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr12, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f17 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i13, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr13, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f18 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i14, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr14, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f19 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i15, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr15, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f20 : dip_2147 port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i16, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr16, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
end architecture;
