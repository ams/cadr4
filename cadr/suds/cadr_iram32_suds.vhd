-- IRAM32 -- RAM 8K-12K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram32 is
begin
iram32_2a21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i44, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr44, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2a22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i45, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr45, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2a23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i46, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr46, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2a24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i47, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr47, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2a25 : dip_2147 generic map (fn => ":1") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i48, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr48, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2b21 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i39, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr39, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2b22 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i40, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr40, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2b23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i41, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr41, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2b24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i42, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr42, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2b25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i43, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr43, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2c21 : dip_74s04 port map (p1 => \-pcc6\, p2 => pc6o, p3 => \-pcc7\, p4 => pc7o, p5 => \-pcc8\, p6 => pc8o, p8 => pc9o, p9 => \-pcc9\, p10 => pc10o, p11 => \-pcc10\, p12 => pc11o, p13 => \-pcc11\);
iram32_2c22 : dip_74s04 port map (p1 => \-pcc0\, p2 => pc0o, p3 => \-pcc1\, p4 => pc1o, p5 => \-pcc2\, p6 => pc2o, p8 => pc3o, p9 => \-pcc3\, p10 => pc4o, p11 => \-pcc4\, p12 => pc5o, p13 => \-pcc5\);
iram32_2c23 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i36, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr36, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2c24 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i37, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr37, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
iram32_2c25 : dip_2147 generic map (fn => ":0") port map (p1 => pc0o, p2 => pc1o, p3 => pc2o, p4 => pc3o, p5 => pc4o, p6 => pc5o, p7 => i38, p8 => \-iweo\, p10 => \-ice2d\, p11 => iwr38, p12 => pc11o, p13 => pc10o, p14 => pc9o, p15 => pc8o, p16 => pc7o, p17 => pc6o);
end architecture;
