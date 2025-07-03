-- IRAM02 -- RAM 8K-12K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram02 is
begin
iram02_2d01 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i10, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr10, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2d02 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i11, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr11, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2d03 : dip_74s04a port map (p1 => \-pcb6\, p2 => pc6c, p3 => \-pcb7\, p4 => pc7c, p5 => \-pcb8\, p6 => pc8c, p8 => pc9c, p9 => \-pcb9\, p10 => pc10c, p11 => \-pcb10\, p12 => pc11c, p13 => \-pcb11\);
iram02_2d04 : dip_74s04a port map (p1 => \-pcb0\, p2 => pc0c, p3 => \-pcb1\, p4 => pc1c, p5 => \-pcb2\, p6 => pc2c, p8 => pc3c, p9 => \-pcb3\, p10 => pc4c, p11 => \-pcb4\, p12 => pc5c, p13 => \-pcb5\);
iram02_2e01 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i5, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr5, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2e02 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i6, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr6, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2e03 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i7, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr7, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2e04 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i8, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr8, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2e05 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i9, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr9, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2f01 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i0, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr0, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2f02 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i1, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr1, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2f03 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i2, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr2, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2f04 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i3, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr3, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
iram02_2f05 : dip_2147 generic map (fn => ":0") port map (p1 => pc0c, p2 => pc1c, p3 => pc2c, p4 => pc3c, p5 => pc4c, p6 => pc5c, p7 => i4, p8 => \-iwec\, p10 => \-ice2a\, p11 => iwr4, p12 => pc11c, p13 => pc10c, p14 => pc9c, p15 => pc8c, p16 => pc7c, p17 => pc6c);
end architecture;
