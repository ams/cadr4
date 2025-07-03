-- IOR -- INST. MODIFY OR

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_ior is
begin
ior_3c06 : dip_74s32w port map (p1 => i12, p2 => ob12, p3 => iob12, p4 => i13, p5 => ob13, p6 => iob13, p8 => iob14, p9 => i14, p10 => ob14, p11 => iob15, p12 => i15, p13 => ob15);
ior_3c07 : dip_74s32w port map (p1 => i8, p2 => ob8, p3 => iob8, p4 => i9, p5 => ob9, p6 => iob9, p8 => iob10, p9 => i10, p10 => ob10, p11 => iob11, p12 => i11, p13 => ob11);
ior_3c08 : dip_74s32w port map (p1 => i4, p2 => ob4, p3 => iob4, p4 => i5, p5 => ob5, p6 => iob5, p8 => iob6, p9 => i6, p10 => ob6, p11 => iob7, p12 => i7, p13 => ob7);
ior_3c09 : dip_74s32w port map (p1 => i0, p2 => ob0, p3 => iob0, p4 => i1, p5 => ob1, p6 => iob1, p8 => iob2, p9 => i2, p10 => ob2, p11 => iob3, p12 => i3, p13 => ob3);
ior_3c16 : dip_74s32w port map (p1 => i20, p2 => ob20, p3 => iob20, p4 => i21, p5 => ob21, p6 => iob21, p8 => iob22, p9 => i22, p10 => ob22, p11 => iob23, p12 => i23, p13 => ob23);
ior_3c18 : dip_74s32w port map (p1 => i16, p2 => ob16, p3 => iob16, p4 => i17, p5 => ob17, p6 => iob17, p8 => iob18, p9 => i18, p10 => ob18, p11 => iob19, p12 => i19, p13 => ob19);
ior_3d08 : dip_74s32w port map (p1 => i44, p2 => ob18, p3 => iob44, p4 => i45, p5 => ob19, p6 => iob45, p8 => iob46, p9 => i46, p10 => ob20, p11 => iob47, p12 => i47, p13 => ob21);
ior_3d09 : dip_74s32w port map (p1 => i40, p2 => ob14, p3 => iob40, p4 => i41, p5 => ob15, p6 => iob41, p8 => iob42, p9 => i42, p10 => ob16, p11 => iob43, p12 => i43, p13 => ob17);
ior_3d10 : dip_74s32w port map (p1 => i36, p2 => ob10, p3 => iob36, p4 => i37, p5 => ob11, p6 => iob37, p8 => iob38, p9 => i38, p10 => ob12, p11 => iob39, p12 => i39, p13 => ob13);
ior_3d13 : dip_74s32w port map (p1 => i32, p2 => ob6, p3 => iob32, p4 => i33, p5 => ob7, p6 => iob33, p8 => iob34, p9 => i34, p10 => ob8, p11 => iob35, p12 => i35, p13 => ob9);
ior_3d14 : dip_74s32w port map (p1 => i28, p2 => ob2, p3 => iob28, p4 => i29, p5 => ob3, p6 => iob29, p8 => iob30, p9 => i30, p10 => ob4, p11 => iob31, p12 => i31, p13 => ob5);
ior_3d15 : dip_74s32w port map (p1 => i24, p2 => ob24, p3 => iob24, p4 => i25, p5 => ob25, p6 => iob25, p8 => iob26, p9 => i26, p10 => ob0, p11 => iob27, p12 => i27, p13 => ob1);
end architecture;
