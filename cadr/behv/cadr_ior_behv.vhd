-- IOR -- INST. MODIFY OR

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_ior is
begin
ior_3c06 : iob12 <= i12 or ob12;
           iob13 <= i13 or ob13;
           iob14 <= i14 or ob14;
           iob15 <= i15 or ob15;
ior_3c07 : iob8  <= i8 or ob8;
           iob9  <= i9 or ob9;
           iob10 <= i10 or ob10;
           iob11 <= i11 or ob11;
ior_3c08 : iob4  <= i4 or ob4;
           iob5  <= i5 or ob5;
           iob6  <= i6 or ob6;
           iob7  <= i7 or ob7;
ior_3c09 : iob0  <= i0 or ob0;
           iob1  <= i1 or ob1;
           iob2  <= i2 or ob2;
           iob3  <= i3 or ob3;
ior_3c16 : iob20 <= i20 or ob20;
           iob21 <= i21 or ob21;
           iob22 <= i22 or ob22;
           iob23 <= i23 or ob23;
ior_3c18 : iob16 <= i16 or ob16;
           iob17 <= i17 or ob17;
           iob18 <= i18 or ob18;
           iob19 <= i19 or ob19;
ior_3d08 : iob44 <= i44 or ob18;
           iob45 <= i45 or ob19;
           iob46 <= i46 or ob20;
           iob47 <= i47 or ob21;
ior_3d09 : iob40 <= i40 or ob14;
           iob41 <= i41 or ob15;
           iob42 <= i42 or ob16;
           iob43 <= i43 or ob17;
ior_3d10 : iob36 <= i36 or ob10;
           iob37 <= i37 or ob11;
           iob38 <= i38 or ob12;
           iob39 <= i39 or ob13;
ior_3d13 : iob32 <= i32 or ob6;
           iob33 <= i33 or ob7;
           iob34 <= i34 or ob8;
           iob35 <= i35 or ob9;
ior_3d14 : iob28 <= i28 or ob2;
           iob29 <= i29 or ob3;
           iob30 <= i30 or ob4;
           iob31 <= i31 or ob5;
ior_3d15 : iob24 <= i24 or ob24;
           iob25 <= i25 or ob25;
           iob26 <= i26 or ob0;
           iob27 <= i27 or ob1;
end architecture;
