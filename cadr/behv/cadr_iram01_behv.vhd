-- IRAM01 -- RAM 4K-8K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram01 is
begin
iram01_1d26 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i10, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr10, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1d27 : dip_2147 port map (p1 => pc0b, p2 => pc1b, p3 => pc2b, p4 => pc3b, p5 => pc4b, p6 => pc5b, p7 => i11, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr11, p12 => pc11b, p13 => pc10b, p14 => pc9b, p15 => pc8b, p16 => pc7b, p17 => pc6b);
iram01_1d28 : pc6b <= not \-pcb6\;
              pc7b <= not \-pcb7\;
              pc8b <= not \-pcb8\;
              pc9b <= not \-pcb9\;
              pc10b <= not \-pcb10\;
              pc11b <= not \-pcb11\;
iram01_1d29 : pc0b <= not \-pcb0\;
              pc1b <= not \-pcb1\;
              pc2b <= not \-pcb2\;
              pc3b <= not \-pcb3\;
              pc4b <= not \-pcb4\;
              pc5b <= not \-pcb5\;
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
