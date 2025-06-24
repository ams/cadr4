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
iram20_1c22 : dip_74s04a port map (p1 => \-pcc6\, p2 => pc6i, p3 => \-pcc7\, p4 => pc7i, p5 => \-pcc8\, p6 => pc8i, p8 => pc9i, p9 => \-pcc9\, p10 => pc10i, p11 => \-pcc10\, p12 => pc11i, p13 => \-pcc11\);
iram20_1c23 : dip_74s04a port map (p1 => \-pcc0\, p2 => pc0i, p3 => \-pcc1\, p4 => pc1i, p5 => \-pcc2\, p6 => pc2i, p8 => pc3i, p9 => \-pcc3\, p10 => pc4i, p11 => \-pcc4\, p12 => pc5i, p13 => \-pcc5\);
iram20_1c24 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i24, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr24, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
iram20_1c25 : dip_2147 port map (p1 => pc0i, p2 => pc1i, p3 => pc2i, p4 => pc3i, p5 => pc4i, p6 => pc5i, p7 => i25, p8 => \-iwei\, p10 => \-ice0c\, p11 => iwr25, p12 => pc11i, p13 => pc10i, p14 => pc9i, p15 => pc8i, p16 => pc7i, p17 => pc6i);
end architecture;
