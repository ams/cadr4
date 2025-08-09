-- IRAM11 -- RAM 4K-8K 12-23

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iram11 is
begin
iram11_2d16 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i22, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr22, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2d17 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i23, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr23, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2d18 : dip_74s04 port map (p1 => \-pcb6\, p2 => pc6f, p3 => \-pcb7\, p4 => pc7f, p5 => \-pcb8\, p6 => pc8f, p8 => pc9f, p9 => \-pcb9\, p10 => pc10f, p11 => \-pcb10\, p12 => pc11f, p13 => \-pcb11\);
iram11_2d19 : dip_74s04 port map (p1 => \-pcb0\, p2 => pc0f, p3 => \-pcb1\, p4 => pc1f, p5 => \-pcb2\, p6 => pc2f, p8 => pc3f, p9 => \-pcb3\, p10 => pc4f, p11 => \-pcb4\, p12 => pc5f, p13 => \-pcb5\);
iram11_2e16 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i17, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr17, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e17 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i18, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr18, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e18 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i19, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr19, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e19 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i20, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr20, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2e20 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i21, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr21, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f16 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i12, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr12, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f17 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i13, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr13, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f18 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i14, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr14, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f19 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i15, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr15, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
iram11_2f20 : dip_2147 generic map (fn => ":0") port map (p1 => pc0f, p2 => pc1f, p3 => pc2f, p4 => pc3f, p5 => pc4f, p6 => pc5f, p7 => i16, p8 => \-iwef\, p10 => \-ice1b\, p11 => iwr16, p12 => pc11f, p13 => pc10f, p14 => pc9f, p15 => pc8f, p16 => pc7f, p17 => pc6f);
end architecture;
