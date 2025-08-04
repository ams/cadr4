-- IRAM12 -- RAM 8K-12K, 12-23

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram12 is
begin
iram12_2d21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i22, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr22, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2d22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i23, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr23, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2d23 : dip_74s04a port map (p1 => \-pcb6\, p2 => pc6g, p3 => \-pcb7\, p4 => pc7g, p5 => \-pcb8\, p6 => pc8g, p8 => pc9g, p9 => \-pcb9\, p10 => pc10g, p11 => \-pcb10\, p12 => pc11g, p13 => \-pcb11\);
iram12_2d24 : dip_74s04a port map (p1 => \-pcb0\, p2 => pc0g, p3 => \-pcb1\, p4 => pc1g, p5 => \-pcb2\, p6 => pc2g, p8 => pc3g, p9 => \-pcb3\, p10 => pc4g, p11 => \-pcb4\, p12 => pc5g, p13 => \-pcb5\);
iram12_2e21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i17, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr17, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2e22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i18, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr18, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2e23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i19, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr19, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2e24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i20, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr20, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2e25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i21, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr21, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2f21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i12, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr12, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2f22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i13, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr13, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2f23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i14, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr14, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2f24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i15, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr15, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
iram12_2f25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0g, p2 => pc1g, p3 => pc2g, p4 => pc3g, p5 => pc4g, p6 => pc5g, p7 => i16, p8 => \-iweg\, p10 => \-ice2b\, p11 => iwr16, p12 => pc11g, p13 => pc10g, p14 => pc9g, p15 => pc8g, p16 => pc7g, p17 => pc6g);
end architecture;
