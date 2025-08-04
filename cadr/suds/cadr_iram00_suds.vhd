-- IRAM00 -- RAM 0K-4K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram00 is
begin
iram00_1d21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i10, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr10, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1d22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i11, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr11, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1d23 : dip_74s04 port map (p1 => \-pcb6\, p2 => pc6a, p3 => \-pcb7\, p4 => pc7a, p5 => \-pcb8\, p6 => pc8a, p8 => pc9a, p9 => \-pcb9\, p10 => pc10a, p11 => \-pcb10\, p12 => pc11a, p13 => \-pcb11\);
iram00_1d24 : dip_74s04 port map (p1 => \-pcb0\, p2 => pc0a, p3 => \-pcb1\, p4 => pc1a, p5 => \-pcb2\, p6 => pc2a, p8 => pc3a, p9 => \-pcb3\, p10 => pc4a, p11 => \-pcb4\, p12 => pc5a, p13 => \-pcb5\);
iram00_1e21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i5, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr5, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i6, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr6, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i7, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr7, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i8, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr8, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i9, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr9, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i0, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr0, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i1, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr1, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i2, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr2, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i3, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr3, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i4, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr4, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
end architecture;
