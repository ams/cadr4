-- IRAM33 -- RAM 12K-16K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iram33 is
begin
iram33_2a26 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i44, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr44, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a27 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i45, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr45, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a28 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i46, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr46, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a29 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i47, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr47, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2a30 : dip_2147 generic map (fn => ":1") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i48, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr48, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b26 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i39, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr39, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b27 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i40, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr40, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b28 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i41, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr41, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b29 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i42, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr42, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2b30 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i43, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr43, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c26 : dip_74s04 port map (p1 => \-pcc6\, p2 => pc6p, p3 => \-pcc7\, p4 => pc7p, p5 => \-pcc8\, p6 => pc8p, p8 => pc9p, p9 => \-pcc9\, p10 => pc10p, p11 => \-pcc10\, p12 => pc11p, p13 => \-pcc11\);
iram33_2c27 : dip_74s04 port map (p1 => \-pcc0\, p2 => pc0p, p3 => \-pcc1\, p4 => pc1p, p5 => \-pcc2\, p6 => pc2p, p8 => pc3p, p9 => \-pcc3\, p10 => pc4p, p11 => \-pcc4\, p12 => pc5p, p13 => \-pcc5\);
iram33_2c28 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i36, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr36, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c29 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i37, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr37, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
iram33_2c30 : dip_2147 generic map (fn => ":0") port map (p1 => pc0p, p2 => pc1p, p3 => pc2p, p4 => pc3p, p5 => pc4p, p6 => pc5p, p7 => i38, p8 => \-iwep\, p10 => \-ice3d\, p11 => iwr38, p12 => pc11p, p13 => pc10p, p14 => pc9p, p15 => pc8p, p16 => pc7p, p17 => pc6p);
end architecture;
