-- PROM1 -- PROM 512-1023

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_prom1 is
begin
prom1_1b16 : dip_74s472 generic map (fn => ":0") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i24, p7 => i25, p8 => i26, p9 => i27, p11 => i28, p12 => i29, p13 => i30, p14 => i31, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
prom1_1b18 : dip_74s472 generic map (fn => ":0") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i32, p7 => i33, p8 => i34, p9 => i35, p11 => i36, p12 => i37, p13 => i38, p14 => i39, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
prom1_1b20 : dip_74s472 generic map (fn => ":80") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i40, p7 => i41, p8 => i42, p9 => i43, p11 => i44, p12 => i45, p13 => i47, p14 => i48, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
prom1_1d17 : dip_74s472 generic map (fn => ":0") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i16, p7 => i17, p8 => i18, p9 => i19, p11 => i20, p12 => i21, p13 => i22, p14 => i23, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
prom1_1e18 : dip_74s472 generic map (fn => ":0") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i0, p7 => i1, p8 => i2, p9 => i3, p11 => i4, p12 => i5, p13 => i6, p14 => i7, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
prom1_1e20 : dip_74s472 generic map (fn => ":0") port map (p1 => \-prompc0\, p2 => \-prompc1\, p3 => \-prompc2\, p4 => \-prompc3\, p5 => \-prompc4\, p6 => i8, p7 => i9, p8 => i10, p9 => i11, p11 => i12, p12 => i13, p13 => i14, p14 => i15, p15 => \-promce1\, p16 => \-prompc5\, p17 => \-prompc6\, p18 => \-prompc7\, p19 => \-prompc8\);
end architecture;
