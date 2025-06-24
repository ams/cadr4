-- IRAM21 -- RAM 4K-8K, 24-35

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram21 is
begin
iram21_1a26 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i31, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr31, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1a27 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i32, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr32, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1a28 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i33, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr33, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1a29 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i34, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr34, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1a30 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i35, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr35, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1b26 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i26, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr26, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1b27 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i27, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr27, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1b28 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i28, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr28, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1b29 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i29, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr29, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1b30 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i30, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr30, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1c27 : pc6j <= not \-pcc6\;
              pc7j <= not \-pcc7\;
              pc8j <= not \-pcc8\;
              pc9j <= not \-pcc9\;
              pc10j <= not \-pcc10\;
              pc11j <= not \-pcc11\;
iram21_1c28 : pc0j <= not \-pcc0\;
              pc1j <= not \-pcc1\;
              pc2j <= not \-pcc2\;
              pc3j <= not \-pcc3\;
              pc4j <= not \-pcc4\;
              pc5j <= not \-pcc5\;
iram21_1c29 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i24, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr24, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
iram21_1c30 : dip_2147 port map (p1 => pc0j, p2 => pc1j, p3 => pc2j, p4 => pc3j, p5 => pc4j, p6 => pc5j, p7 => i25, p8 => \-iwej\, p10 => \-ice1c\, p11 => iwr25, p12 => pc11j, p13 => pc10j, p14 => pc9j, p15 => pc8j, p16 => pc7j, p17 => pc6j);
end architecture;
