-- IRAM13

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram13 is
begin
iram13_2d26 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i22, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr22, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2d27 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i23, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr23, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2d28 : pc6h  <= not \-pcb6\;
              pc7h  <= not \-pcb7\;
              pc8h  <= not \-pcb8\;
              pc9h  <= not \-pcb9\;
              pc10h <= not \-pcb10\;
              pc11h <= not \-pcb11\;
iram13_2d29 : pc0h  <= not \-pcb0\;
              pc1h  <= not \-pcb1\;
              pc2h  <= not \-pcb2\;
              pc3h  <= not \-pcb3\;
              pc4h  <= not \-pcb4\;
              pc5h  <= not \-pcb5\;
iram13_2e26 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i17, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr17, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2e27 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i18, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr18, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2e28 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i19, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr19, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2e29 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i20, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr20, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2e30 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i21, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr21, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2f26 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i12, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr12, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2f27 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i13, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr13, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2f28 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i14, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr14, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2f29 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i15, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr15, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
iram13_2f30 : dip_2147 port map (p1 => pc0h, p2 => pc1h, p3 => pc2h, p4 => pc3h, p5 => pc4h, p6 => pc5h, p7 => i16, p8 => \-iweh\, p10 => \-ice3b\, p11 => iwr16, p12 => pc11h, p13 => pc10h, p14 => pc9h, p15 => pc8h, p16 => pc7h, p17 => pc6h);
end architecture;
