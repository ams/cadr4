-- IRAM01 -- RAM 4K-8K, 0-11

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iram01 is
begin
iram01_1d26 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i10, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr10, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1d27 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i11, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr11, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1d28 : dip_74s04 port map (p1 => \-pcb6\, p2 => pcb6, p3 => \-pcb7\, p4 => pcb7, p5 => \-pcb8\, p6 => pcb8, p8 => pcb9, p9 => \-pcb9\, p10 => pcb10, p11 => \-pcb10\, p12 => pcb11, p13 => \-pcb11\);
iram01_1d29 : dip_74s04 port map (p1 => \-pcb0\, p2 => pcb0, p3 => \-pcb1\, p4 => pcb1, p5 => \-pcb2\, p6 => pcb2, p8 => pcb3, p9 => \-pcb3\, p10 => pcb4, p11 => \-pcb4\, p12 => pcb5, p13 => \-pcb5\);
iram01_1e26 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i5, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr5, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1e27 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i6, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr6, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1e28 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i7, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr7, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1e29 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i8, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr8, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1e30 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i9, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr9, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1f26 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i0, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr0, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1f27 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i1, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr1, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1f28 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i2, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr2, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1f29 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i3, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr3, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
iram01_1f30 : dip_2147 generic map (fn => ":0") port map (p1 => pcb0, p2 => pcb1, p3 => pcb2, p4 => pcb3, p5 => pcb4, p6 => pcb5, p7 => i4, p8 => \-iweb\, p10 => \-ice1a\, p11 => iwr4, p12 => pcb11, p13 => pcb10, p14 => pcb9, p15 => pcb8, p16 => pcb7, p17 => pcb6);
end architecture;
