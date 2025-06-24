-- IRAM20 -- RAM 0K-4K, 24-35

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram20 is
begin
iram20_1a21 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i31, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr31, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1a22 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i32, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr32, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1a23 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i33, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr33, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1a24 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i34, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr34, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1a25 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i35, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr35, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1b21 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i26, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr26, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1b22 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i27, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr27, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1b23 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i28, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr28, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1b24 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i29, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr29, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1b25 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i30, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr30, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1c22 : pc6i <= not \-pcc6\;
              pc7i <= not \-pcc7\;
              pc8i <= not \-pcc8\;
              pc9i <= not \-pcc9\;
              pc10i <= not \-pcc10\;
              pc11i <= not \-pcc11\;
iram20_1c23 : pc0i <= not \-pcc0\;
              pc1i <= not \-pcc1\;
              pc2i <= not \-pcc2\;
              pc3i <= not \-pcc3\;
              pc4i <= not \-pcc4\;
              pc5i <= not \-pcc5\;
iram20_1c24 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i24, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr24, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1c25 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i25, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr25, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
end architecture;
