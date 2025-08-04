-- MF -- DRIVE MF ONTO M

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_mf is
signal net_0 : std_logic;
begin
mf_1a18 : dip_74s00 port map (p1 => tse1a, p2 => mfenb, p3 => \-mfdrive\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
mf_1a21 : dip_74s241 port map (p1 => \-mfdrive\, p2 => mf23, p3 => m16, p4 => mf22, p5 => m17, p6 => mf21, p7 => m18, p8 => mf20, p9 => m19, p11 => mf19, p12 => m20, p13 => mf18, p14 => m21, p15 => mf17, p16 => m22, p17 => mf16, p18 => m23, p19 => mfdrive);
mf_1a23 : dip_74s241 port map (p1 => \-mfdrive\, p2 => mf15, p3 => m8, p4 => mf14, p5 => m9, p6 => mf13, p7 => m10, p8 => mf12, p9 => m11, p11 => mf11, p12 => m12, p13 => mf10, p14 => m13, p15 => mf9, p16 => m14, p17 => mf8, p18 => m15, p19 => mfdrive);
mf_1a25 : dip_74s241 port map (p1 => \-mfdrive\, p2 => mf7, p3 => m0, p4 => mf6, p5 => m1, p6 => mf5, p7 => m2, p8 => mf4, p9 => m3, p11 => mf3, p12 => m4, p13 => mf2, p14 => m5, p15 => mf1, p16 => m6, p17 => mf0, p18 => m7, p19 => mfdrive);
mf_1b24 : dip_74s241 port map (p1 => \-mfdrive\, p2 => mf31, p3 => m24, p4 => mf30, p5 => m25, p6 => mf29, p7 => m26, p8 => mf28, p9 => m27, p11 => mf27, p12 => m28, p13 => mf26, p14 => m29, p15 => mf25, p16 => m30, p17 => mf24, p18 => m31, p19 => mfdrive);
mf_2a04 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => tse1a, p5 => mfenb, p6 => mfdrive, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
mf_3f14 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => pdlenb, p9 => spcenb, p10 => net_0, p11 => 'Z', p12 => 'Z', p13 => open);
mf_4d06 : dip_74s08o port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => mfenb, p12 => net_0, p13 => \-srcm\);
mf_4d08 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \-srcm\, p12 => \-ir31\, p13 => \-mpass\);
end architecture;
