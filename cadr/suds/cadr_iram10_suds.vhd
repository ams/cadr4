-- IRAM10 -- RAM 0K-4K, 12-24

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram10 is
begin
iram10_2d11 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i22, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr22, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2d12 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i23, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr23, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2d13 : dip_74s04a port map (p1 => \-pcb6\, p2 => pc6e, p3 => \-pcb7\, p4 => pc7e, p5 => \-pcb8\, p6 => pc8e, p8 => pc9e, p9 => \-pcb9\, p10 => pc10e, p11 => \-pcb10\, p12 => pc11e, p13 => \-pcb11\);
iram10_2d14 : dip_74s04a port map (p1 => \-pcb0\, p2 => pc0e, p3 => \-pcb1\, p4 => pc1e, p5 => \-pcb2\, p6 => pc2e, p8 => pc3e, p9 => \-pcb3\, p10 => pc4e, p11 => \-pcb4\, p12 => pc5e, p13 => \-pcb5\);
iram10_2e11 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i17, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr17, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e12 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i18, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr18, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e13 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i19, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr19, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e14 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i20, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr20, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e15 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i21, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr21, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f11 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i12, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr12, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f12 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i13, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr13, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f13 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i14, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr14, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f14 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i15, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr15, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f15 : dip_2147 generic map (fn => ":0") port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i16, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr16, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
end architecture;
