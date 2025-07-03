-- IRAM23 -- RAM 12K-16K, 24-35

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_iram23 is
begin
iram23_2a06 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i31, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr31, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a07 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i32, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr32, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a08 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i33, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr33, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a09 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i34, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr34, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2a10 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i35, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr35, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b06 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i26, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr26, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b07 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i27, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr27, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b08 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i28, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr28, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b09 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i29, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr29, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2b10 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i30, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr30, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2c07 : dip_74s04a port map (p1 => \-pcc6\, p2 => pc6l, p3 => \-pcc7\, p4 => pc7l, p5 => \-pcc8\, p6 => pc8l, p8 => pc9l, p9 => \-pcc9\, p10 => pc10l, p11 => \-pcc10\, p12 => pc11l, p13 => \-pcc11\);
iram23_2c08 : dip_74s04a port map (p1 => \-pcc0\, p2 => pc0l, p3 => \-pcc1\, p4 => pc1l, p5 => \-pcc2\, p6 => pc2l, p8 => pc3l, p9 => \-pcc3\, p10 => pc4l, p11 => \-pcc4\, p12 => pc5l, p13 => \-pcc5\);
iram23_2c09 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i24, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr24, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
iram23_2c10 : dip_2147 generic map (fn => ":0") port map (p1 => pc0l, p2 => pc1l, p3 => pc2l, p4 => pc3l, p5 => pc4l, p6 => pc5l, p7 => i25, p8 => \-iwel\, p10 => \-ice3c\, p11 => iwr25, p12 => pc11l, p13 => pc10l, p14 => pc9l, p15 => pc8l, p16 => pc7l, p17 => pc6l);
end architecture;
