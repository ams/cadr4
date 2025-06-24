-- IRAM22 -- RAM8K-12K, 24-35

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram22 is
begin
iram22_2a01 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i31, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr31, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2a02 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i32, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr32, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2a03 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i33, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr33, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2a04 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i34, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr34, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2a05 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i35, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr35, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2b01 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i26, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr26, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2b02 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i27, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr27, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2b03 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i28, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr28, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2b04 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i29, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr29, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2b05 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i30, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr30, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2c02 : pc6k <= not \-pcc6\;
              pc7k <= not \-pcc7\;
              pc8k <= not \-pcc8\;
              pc9k <= not \-pcc9\;
              pc10k <= not \-pcc10\;
              pc11k <= not \-pcc11\;
iram22_2c03 : pc0k <= not \-pcc0\;
              pc1k <= not \-pcc1\;
              pc2k <= not \-pcc2\;
              pc3k <= not \-pcc3\;
              pc4k <= not \-pcc4\;
              pc5k <= not \-pcc5\;
iram22_2c04 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i24, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr24, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
iram22_2c05 : dip_2147 port map (p1 => pc0k, p2 => pc1k, p3 => pc2k, p4 => pc3k, p5 => pc4k, p6 => pc5k, p7 => i25, p8 => \-iwek\, p10 => \-ice2c\, p11 => iwr25, p12 => pc11k, p13 => pc10k, p14 => pc9k, p15 => pc8k, p16 => pc7k, p17 => pc6k);
end architecture;
