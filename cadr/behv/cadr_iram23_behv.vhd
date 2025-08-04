-- IRAM23 -- RAM 12K-16K, 24-35

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_iram23 is
begin
iram23_2a06 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i31, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr31, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a07 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i32, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr32, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a08 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i33, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr33, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a09 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i34, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr34, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a10 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i35, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr35, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b06 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i26, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr26, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b07 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i27, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr27, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b08 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i28, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr28, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b09 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i29, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr29, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b10 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i30, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr30, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2c07 : pc6l  <= not \-pcc6\;
              pc7l  <= not \-pcc7\;
              pc8l  <= not \-pcc8\;
              pc9l  <= not \-pcc9\;
              pc10l <= not \-pcc10\;
              pc11l <= not \-pcc11\;
iram23_2c08 : pc0l  <= not \-pcc0\;
              pc1l  <= not \-pcc1\;
              pc2l  <= not \-pcc2\;
              pc3l  <= not \-pcc3\;
              pc4l  <= not \-pcc4\;
              pc5l  <= not \-pcc5\;
iram23_2c09 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i24, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr24, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2c10 : dip_2147 port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i25, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr25, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
end architecture;
