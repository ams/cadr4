-- IRAM03 -- RAM 12K-16K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iram03 is
begin
iram03_2d06 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i10, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr10, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2d07 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i11, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr11, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2d08 : dip_74s04 port map (p1 => \-pcb6\, p2 => pc6d, p3 => \-pcb7\, p4 => pc7d, p5 => \-pcb8\, p6 => pc8d, p8 => pc9d, p9 => \-pcb9\, p10 => pc10d, p11 => \-pcb10\, p12 => pc11d, p13 => \-pcb11\);
iram03_2d09 : dip_74s04 port map (p1 => \-pcb0\, p2 => pc0d, p3 => \-pcb1\, p4 => pc1d, p5 => \-pcb2\, p6 => pc2d, p8 => pc3d, p9 => \-pcb3\, p10 => pc4d, p11 => \-pcb4\, p12 => pc5d, p13 => \-pcb5\);
iram03_2e06 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i5, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr5, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2e07 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i6, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr6, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2e08 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i7, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr7, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2e09 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i8, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr8, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2e10 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i9, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr9, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2f06 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i0, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr0, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2f07 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i1, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr1, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2f08 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i2, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr2, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2f09 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i3, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr3, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
iram03_2f10 : dip_2147 generic map (fn => ":0") port map (p1 => pc0d, p2 => pc1d, p3 => pc2d, p4 => pc3d, p5 => pc4d, p6 => pc5d, p7 => i4, p8 => \-iwed\, p10 => \-ice3a\, p11 => iwr4, p12 => pc11d, p13 => pc10d, p14 => pc9d, p15 => pc8d, p16 => pc7d, p17 => pc6d);
end architecture;
