-- IRAM00 -- RAM 0K-4K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram00 is
begin
iram00_1d21 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i10, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr10, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1d22 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i11, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr11, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1d23 : pc6a  <= not \-pcb6\;
              pc7a  <= not \-pcb7\;
              pc8a  <= not \-pcb8\;
              pc9a  <= not \-pcb9\;
              pc10a <= not \-pcb10\;
              pc11a <= not \-pcb11\;
iram00_1d24 : pc0a  <= not \-pcb0\;
              pc1a  <= not \-pcb1\;
              pc2a  <= not \-pcb2\;
              pc3a  <= not \-pcb3\;
              pc4a  <= not \-pcb4\;
              pc5a  <= not \-pcb5\;
iram00_1e21 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i5, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr5, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e22 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i6, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr6, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e23 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i7, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr7, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e24 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i8, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr8, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1e25 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i9, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr9, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f21 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i0, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr0, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f22 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i1, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr1, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f23 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i2, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr2, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f24 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i3, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr3, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
iram00_1f25 : dip_2147 port map (p1 => pc0a, p2 => pc1a, p3 => pc2a, p4 => pc3a, p5 => pc4a, p6 => pc5a, p7 => i4, p8 => \-iwea\, p10 => \-ice0a\, p11 => iwr4, p12 => pc11a, p13 => pc10a, p14 => pc9a, p15 => pc8a, p16 => pc7a, p17 => pc6a);
end architecture;
