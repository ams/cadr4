-- IRAM31 -- RAM 4K-8K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram31 is
begin
iram31_2a16 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i44, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr44, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a17 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i45, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr45, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a18 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i46, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr46, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a19 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i47, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr47, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a20 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i48, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr48, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b16 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i39, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr39, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b17 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i40, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr40, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b18 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i41, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr41, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b19 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i42, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr42, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b20 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i43, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr43, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c16 : pc6n  <= not \-pcc6\;
              pc7n  <= not \-pcc7\;
              pc8n  <= not \-pcc8\;
              pc9n  <= not \-pcc9\;
              pc10n <= not \-pcc10\;
              pc11n <= not \-pcc11\;
iram31_2c17 : pc0n  <= not \-pcc0\;
              pc1n  <= not \-pcc1\;
              pc2n  <= not \-pcc2\;
              pc3n  <= not \-pcc3\;
              pc4n  <= not \-pcc4\;
              pc5n  <= not \-pcc5\;
iram31_2c18 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i36, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr36, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c19 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i37, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr37, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c20 : dip_2147 port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i38, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr38, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
end architecture;
