-- APAR -- A&M PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_apar is
begin
apar_3a28 : dip_93s48 port map (p1 => a26, p2 => a27, p3 => a28, p4 => a29, p5 => a30, p6 => a31b, p7 => aparity, p9 => aparok, p10 => open, p11 => aparl, p12 => aparm, p13 => gnd, p14 => a24, p15 => a25);
apar_3a29 : dip_93s48 port map (p1 => a17, p2 => a18, p3 => a19, p4 => a20, p5 => a21, p6 => a22, p7 => a23, p9 => aparm, p10 => open, p11 => a12, p12 => a13, p13 => a14, p14 => a15, p15 => a16);
apar_3a30 : dip_93s48 port map (p1 => a5, p2 => a6, p3 => a7, p4 => a8, p5 => a9, p6 => a10, p7 => a11, p9 => aparl, p10 => open, p11 => a0, p12 => a1, p13 => a2, p14 => a3, p15 => a4);
apar_4a12 : dip_93s48 port map (p1 => m17, p2 => m18, p3 => m19, p4 => m20, p5 => m21, p6 => m22, p7 => m23, p9 => mparm, p10 => open, p11 => m12, p12 => m13, p13 => m14, p14 => m15, p15 => m16);
apar_4a14 : dip_93s48 port map (p1 => m5, p2 => m6, p3 => m7, p4 => m8, p5 => m9, p6 => m10, p7 => m11, p9 => mparl, p10 => open, p11 => m0, p12 => m1, p13 => m2, p14 => m3, p15 => m4);
apar_4a17 : dip_74s00 port map (p1 => mpareven, p2 => srcm, p3 => mmemparok, p4 => mpareven, p5 => pdlenb, p6 => pdlparok, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
apar_4b15 : dip_93s48 port map (p1 => m26, p2 => m27, p3 => m28, p4 => m29, p5 => m30, p6 => m31, p7 => mparity, p9 => mparodd, p10 => mpareven, p11 => mparl, p12 => mparm, p13 => gnd, p14 => m24, p15 => m25);
end architecture;
