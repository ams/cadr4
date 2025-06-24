-- IRAM10 -- RAM 0K-4K, 12-24

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram10 is
begin
iram10_2d11 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i22, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr22, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2d12 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i23, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr23, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2d13 : pc6e <= not \-pcb6\;
              pc7e <= not \-pcb7\;
              pc8e <= not \-pcb8\;
              pc9e <= not \-pcb9\;
              pc10e <= not \-pcb10\;
              pc11e <= not \-pcb11\;
iram10_2d14 : pc0e <= not \-pcb0\;
              pc1e <= not \-pcb1\;
              pc2e <= not \-pcb2\;
              pc3e <= not \-pcb3\;
              pc4e <= not \-pcb4\;
              pc5e <= not \-pcb5\;
iram10_2e11 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i17, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr17, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e12 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i18, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr18, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e13 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i19, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr19, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e14 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i20, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr20, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2e15 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i21, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr21, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f11 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i12, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr12, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f12 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i13, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr13, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f13 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i14, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr14, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f14 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i15, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr15, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
iram10_2f15 : dip_2147 port map (p1 => pc0e, p2 => pc1e, p3 => pc2e, p4 => pc3e, p5 => pc4e, p6 => pc5e, p7 => i16, p8 => \-iwee\, p10 => \-ice0b\, p11 => iwr16, p12 => pc11e, p13 => pc10e, p14 => pc9e, p15 => pc8e, p16 => pc7e, p17 => pc6e);
end architecture;
