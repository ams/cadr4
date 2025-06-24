-- IRAM01 -- RAM 4K-8K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram01 is
begin
iram01_1d26 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i10, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr10, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1d27 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i11, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr11, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1d28 : dip_74s04a port map (p1 => \-pcb6\, p2 => pc6b, p3 => \-pcb7\, p4 => pc7b, p5 => \-pcb8\, p6 => pc8b, p8 => pc9b, p9 => \-pcb9\, p10 => pc10b, p11 => \-pcb10\, p12 => pc11b, p13 => \-pcb11\);
iram01_1d29 : dip_74s04a port map (p1 => \-pcb0\, p2 => pc0b, p3 => \-pcb1\, p4 => pc1b, p5 => \-pcb2\, p6 => pc2b, p8 => pc3b, p9 => \-pcb3\, p10 => pc4b, p11 => \-pcb4\, p12 => pc5b, p13 => \-pcb5\);
iram01_1e26 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i5, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr5, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1e27 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i6, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr6, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1e28 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i7, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr7, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1e29 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i8, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr8, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1e30 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i9, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr9, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1f26 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i0, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr0, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1f27 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i1, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr1, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1f28 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i2, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr2, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1f29 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i3, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr3, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1f30 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i4, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr4, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
end architecture;
