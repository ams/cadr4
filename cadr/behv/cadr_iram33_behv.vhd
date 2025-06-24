-- IRAM33 -- RAM 12K-16K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram33 is
begin
iram33_2a26 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i44, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr44, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a27 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i45, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr45, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a28 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i46, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr46, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a29 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i47, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr47, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a30 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i48, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr48, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b26 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i39, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr39, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b27 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i40, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr40, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b28 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i41, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr41, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b29 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i42, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr42, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b30 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i43, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr43, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c26 : pc6p <= not \-pcc6\;
              pc7p <= not \-pcc7\;
              pc8p <= not \-pcc8\;
              pc9p <= not \-pcc9\;
              pc10p <= not \-pcc10\;
              pc11p <= not \-pcc11\;
iram33_2c27 : pc0p <= not \-pcc0\;
              pc1p <= not \-pcc1\;
              pc2p <= not \-pcc2\;
              pc3p <= not \-pcc3\;
              pc4p <= not \-pcc4\;
              pc5p <= not \-pcc5\;
iram33_2c28 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i36, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr36, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c29 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i37, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr37, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c30 : dip_2147 port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i38, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr38, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
end architecture;
