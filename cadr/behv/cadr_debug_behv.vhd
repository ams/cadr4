-- DEBUG -- PDP11 DEBUG INSTRUCTION

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_debug is
begin
debug_1e11 : dip_74s374 port map (p1 => \-idebug\, p2 => i39, p3 => spy7, p4 => spy6, p5 => i38, p6 => i37, p7 => spy5, p8 => spy4, p9 => i36, p11 => \-lddbirh\, p12 => i35, p13 => spy3, p14 => spy2, p15 => i34, p16 => i33, p17 => spy1, p18 => spy0, p19 => i32);
debug_1e12 : dip_74s374 port map (p1 => \-idebug\, p2 => i31, p3 => spy15, p4 => spy14, p5 => i30, p6 => i29, p7 => spy13, p8 => spy12, p9 => i28, p11 => \-lddbirm\, p12 => i27, p13 => spy11, p14 => spy10, p15 => i26, p16 => i25, p17 => spy9, p18 => spy8, p19 => i24);
debug_1e13 : dip_74s374 port map (p1 => \-idebug\, p2 => i23, p3 => spy7, p4 => spy6, p5 => i22, p6 => i21, p7 => spy5, p8 => spy4, p9 => i20, p11 => \-lddbirm\, p12 => i19, p13 => spy3, p14 => spy2, p15 => i18, p16 => i17, p17 => spy1, p18 => spy0, p19 => i16);
debug_1e14 : dip_74s374 port map (p1 => \-idebug\, p2 => i15, p3 => spy15, p4 => spy14, p5 => i14, p6 => i13, p7 => spy13, p8 => spy12, p9 => i12, p11 => \-lddbirl\, p12 => i11, p13 => spy11, p14 => spy10, p15 => i10, p16 => i9, p17 => spy9, p18 => spy8, p19 => i8);
debug_1e15 : dip_74s374 port map (p1 => \-idebug\, p2 => i7, p3 => spy7, p4 => spy6, p5 => i6, p6 => i5, p7 => spy5, p8 => spy4, p9 => i4, p11 => \-lddbirl\, p12 => i3, p13 => spy3, p14 => spy2, p15 => i2, p16 => i1, p17 => spy1, p18 => spy0, p19 => i0);
debug_1f15 : dip_74s374 port map (p1 => \-idebug\, p2 => i47, p3 => spy15, p4 => spy14, p5 => i46, p6 => i45, p7 => spy13, p8 => spy12, p9 => i44, p11 => \-lddbirh\, p12 => i43, p13 => spy11, p14 => spy10, p15 => i42, p16 => i41, p17 => spy9, p18 => spy8, p19 => i40);
end architecture;
