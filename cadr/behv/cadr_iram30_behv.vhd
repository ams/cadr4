-- IRAM30 -- RAM 0K-4K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram30 is
begin
iram30_2a11 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i44, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr44, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2a12 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i45, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr45, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2a13 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i46, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr46, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2a14 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i47, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr47, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2a15 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i48, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr48, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2b11 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i39, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr39, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2b12 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i40, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr40, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2b13 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i41, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr41, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2b14 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i42, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr42, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2b15 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i43, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr43, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2c11 : pc6m  <= not \-pcc6\;
              pc7m  <= not \-pcc7\;
              pc8m  <= not \-pcc8\;
              pc9m  <= not \-pcc9\;
              pc10m <= not \-pcc10\;
              pc11m <= not \-pcc11\;
iram30_2c12 : pc0m  <= not \-pcc0\;
              pc1m  <= not \-pcc1\;
              pc2m  <= not \-pcc2\;
              pc3m  <= not \-pcc3\;
              pc4m  <= not \-pcc4\;
              pc5m  <= not \-pcc5\;
iram30_2c13 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i36, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr36, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2c14 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i37, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr37, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
iram30_2c15 : dip_2147 port map (p1 => pc0m, p2 => pc1m, p3 => pc2m, p4 => pc3m, p5 => pc4m, p6 => pc5m, p7 => i38, p8 => \-iwem\, p10 => \-ice0d\, p11 => iwr38, p12 => pc11m, p13 => pc10m, p14 => pc9m, p15 => pc8m, p16 => pc7m, p17 => pc6m);
end architecture;
