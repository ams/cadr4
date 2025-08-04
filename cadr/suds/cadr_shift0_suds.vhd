-- SHIFT0 -- SHIFTER RIGHT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_shift0 is
begin
shift0_2c21 : dip_25s10 port map (p1 => m5, p2 => m6, p3 => m7, p4 => m8, p5 => m9, p6 => m10, p7 => m11, p9 => s1, p10 => s0, p11 => sa11, p12 => sa10, p13 => gnd, p14 => sa9, p15 => sa8);
shift0_2c26 : dip_25s10 port map (p1 => m29, p2 => m30, p3 => m31, p4 => m0, p5 => m1, p6 => m2, p7 => m3, p9 => s1, p10 => s0, p11 => sa3, p12 => sa2, p13 => gnd, p14 => sa1, p15 => sa0);
shift0_2d25 : dip_25s10 port map (p1 => m9, p2 => m10, p3 => m11, p4 => m12, p5 => m13, p6 => m14, p7 => m15, p9 => s1, p10 => s0, p11 => sa15, p12 => sa14, p13 => gnd, p14 => sa13, p15 => sa12);
shift0_2d30 : dip_25s10 port map (p1 => m1, p2 => m2, p3 => m3, p4 => m4, p5 => m5, p6 => m6, p7 => m7, p9 => s1, p10 => s0, p11 => sa7, p12 => sa6, p13 => gnd, p14 => sa5, p15 => sa4);
shift0_2e21 : dip_25s10 port map (p1 => sa6, p2 => sa10, p3 => sa14, p4 => sa18, p5 => sa22, p6 => sa26, p7 => sa30, p9 => s3a, p10 => s2a, p11 => r14, p12 => r10, p13 => \-s4\, p14 => r6, p15 => r2);
shift0_2e22 : dip_25s10 port map (p1 => sa22, p2 => sa26, p3 => sa30, p4 => sa2, p5 => sa6, p6 => sa10, p7 => sa14, p9 => s3a, p10 => s2a, p11 => r14, p12 => r10, p13 => s4, p14 => r6, p15 => r2);
shift0_2e23 : dip_25s10 port map (p1 => sa7, p2 => sa11, p3 => sa15, p4 => sa19, p5 => sa23, p6 => sa27, p7 => sa31, p9 => s3a, p10 => s2a, p11 => r15, p12 => r11, p13 => \-s4\, p14 => r7, p15 => r3);
shift0_2e24 : dip_25s10 port map (p1 => sa23, p2 => sa27, p3 => sa31, p4 => sa3, p5 => sa7, p6 => sa11, p7 => sa15, p9 => s3a, p10 => s2a, p11 => r15, p12 => r11, p13 => s4, p14 => r7, p15 => r3);
shift0_2e26 : dip_25s10 port map (p1 => sa4, p2 => sa8, p3 => sa12, p4 => sa16, p5 => sa20, p6 => sa24, p7 => sa28, p9 => s3a, p10 => s2a, p11 => r12, p12 => r8, p13 => \-s4\, p14 => r4, p15 => r0);
shift0_2e27 : dip_25s10 port map (p1 => sa20, p2 => sa24, p3 => sa28, p4 => sa0, p5 => sa4, p6 => sa8, p7 => sa12, p9 => s3a, p10 => s2a, p11 => r12, p12 => r8, p13 => s4, p14 => r4, p15 => r0);
shift0_2e28 : dip_25s10 port map (p1 => sa5, p2 => sa9, p3 => sa13, p4 => sa17, p5 => sa21, p6 => sa25, p7 => sa29, p9 => s3a, p10 => s2a, p11 => r13, p12 => r9, p13 => \-s4\, p14 => r5, p15 => r1);
shift0_2e29 : dip_25s10 port map (p1 => sa21, p2 => sa25, p3 => sa29, p4 => sa1, p5 => sa5, p6 => sa9, p7 => sa13, p9 => s3a, p10 => s2a, p11 => r13, p12 => r9, p13 => s4, p14 => r5, p15 => r1);
end architecture;
