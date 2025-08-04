-- SHIFT1 -- SHIFTER LEFT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_shift1 is
begin
shift1_2c01 : dip_25s10 port map (p1 => m21, p2 => m22, p3 => m23, p4 => m24, p5 => m25, p6 => m26, p7 => m27, p9 => s1, p10 => s0, p11 => sa27, p12 => sa26, p13 => gnd, p14 => sa25, p15 => sa24);
shift1_2c06 : dip_25s10 port map (p1 => m13, p2 => m14, p3 => m15, p4 => m16, p5 => m17, p6 => m18, p7 => m19, p9 => s1, p10 => s0, p11 => sa19, p12 => sa18, p13 => gnd, p14 => sa17, p15 => sa16);
shift1_2d05 : dip_25s10 port map (p1 => m25, p2 => m26, p3 => m27, p4 => m28, p5 => m29, p6 => m30, p7 => m31, p9 => s1, p10 => s0, p11 => sa31, p12 => sa30, p13 => gnd, p14 => sa29, p15 => sa28);
shift1_2d10 : dip_25s10 port map (p1 => m17, p2 => m18, p3 => m19, p4 => m20, p5 => m21, p6 => m22, p7 => m23, p9 => s1, p10 => s0, p11 => sa23, p12 => sa22, p13 => gnd, p14 => sa21, p15 => sa20);
shift1_2e01 : dip_25s10 port map (p1 => sa22, p2 => sa26, p3 => sa30, p4 => sa2, p5 => sa6, p6 => sa10, p7 => sa14, p9 => s3b, p10 => s2b, p11 => r30, p12 => r26, p13 => \-s4\, p14 => r22, p15 => r18);
shift1_2e02 : dip_25s10 port map (p1 => sa6, p2 => sa10, p3 => sa14, p4 => sa18, p5 => sa22, p6 => sa26, p7 => sa30, p9 => s3b, p10 => s2b, p11 => r30, p12 => r26, p13 => s4, p14 => r22, p15 => r18);
shift1_2e03 : dip_25s10 port map (p1 => sa23, p2 => sa27, p3 => sa31, p4 => sa3, p5 => sa7, p6 => sa11, p7 => sa15, p9 => s3b, p10 => s2b, p11 => r31, p12 => r27, p13 => \-s4\, p14 => r23, p15 => r19);
shift1_2e04 : dip_25s10 port map (p1 => sa7, p2 => sa11, p3 => sa15, p4 => sa19, p5 => sa23, p6 => sa27, p7 => sa31, p9 => s3b, p10 => s2b, p11 => r31, p12 => r27, p13 => s4, p14 => r23, p15 => r19);
shift1_2e06 : dip_25s10 port map (p1 => sa20, p2 => sa24, p3 => sa28, p4 => sa0, p5 => sa4, p6 => sa8, p7 => sa12, p9 => s3b, p10 => s2b, p11 => r28, p12 => r24, p13 => \-s4\, p14 => r20, p15 => r16);
shift1_2e07 : dip_25s10 port map (p1 => sa4, p2 => sa8, p3 => sa12, p4 => sa16, p5 => sa20, p6 => sa24, p7 => sa28, p9 => s3b, p10 => s2b, p11 => r28, p12 => r24, p13 => s4, p14 => r20, p15 => r16);
shift1_2e08 : dip_25s10 port map (p1 => sa21, p2 => sa25, p3 => sa29, p4 => sa1, p5 => sa5, p6 => sa9, p7 => sa13, p9 => s3b, p10 => s2b, p11 => r29, p12 => r25, p13 => \-s4\, p14 => r21, p15 => r17);
shift1_2e09 : dip_25s10 port map (p1 => sa5, p2 => sa9, p3 => sa13, p4 => sa17, p5 => sa21, p6 => sa25, p7 => sa29, p9 => s3b, p10 => s2b, p11 => r29, p12 => r25, p13 => s4, p14 => r21, p15 => r17);
end architecture;
