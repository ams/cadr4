-- IRAM31 -- RAM 4K-8K, 36-48

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iram31 is
begin
iram31_2a16 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i44, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr44, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a17 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i45, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr45, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a18 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i46, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr46, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a19 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i47, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr47, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2a20 : dip_2147 generic map (fn => ":1") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i48, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr48, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b16 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i39, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr39, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b17 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i40, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr40, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b18 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i41, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr41, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b19 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i42, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr42, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2b20 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i43, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr43, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c16 : dip_74s04 port map (p1 => \-pcc6\, p2 => pc6n, p3 => \-pcc7\, p4 => pc7n, p5 => \-pcc8\, p6 => pc8n, p8 => pc9n, p9 => \-pcc9\, p10 => pc10n, p11 => \-pcc10\, p12 => pc11n, p13 => \-pcc11\);
iram31_2c17 : dip_74s04 port map (p1 => \-pcc0\, p2 => pc0n, p3 => \-pcc1\, p4 => pc1n, p5 => \-pcc2\, p6 => pc2n, p8 => pc3n, p9 => \-pcc3\, p10 => pc4n, p11 => \-pcc4\, p12 => pc5n, p13 => \-pcc5\);
iram31_2c18 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i36, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr36, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c19 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i37, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr37, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
iram31_2c20 : dip_2147 generic map (fn => ":0") port map (p1 => pc0n, p2 => pc1n, p3 => pc2n, p4 => pc3n, p5 => pc4n, p6 => pc5n, p7 => i38, p8 => \-iwen\, p10 => \-ice1d\, p11 => iwr38, p12 => pc11n, p13 => pc10n, p14 => pc9n, p15 => pc8n, p16 => pc7n, p17 => pc6n);
end architecture;
