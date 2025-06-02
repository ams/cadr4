library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_ior is
  port (
    i12   : in  std_logic;
    ob12  : in  std_logic;
    iob12 : out std_logic;
    i13   : in  std_logic;
    ob13  : in  std_logic;
    iob13 : out std_logic;
    iob14 : out std_logic;
    i14   : in  std_logic;
    ob14  : in  std_logic;
    iob15 : out std_logic;
    i15   : in  std_logic;
    ob15  : in  std_logic;
    i8    : in  std_logic;
    ob8   : in  std_logic;
    iob8  : out std_logic;
    i9    : in  std_logic;
    ob9   : in  std_logic;
    iob9  : out std_logic;
    iob10 : out std_logic;
    i10   : in  std_logic;
    ob10  : in  std_logic;
    iob11 : out std_logic;
    i11   : in  std_logic;
    ob11  : in  std_logic;
    i4    : in  std_logic;
    ob4   : in  std_logic;
    iob4  : out std_logic;
    i5    : in  std_logic;
    ob5   : in  std_logic;
    iob5  : out std_logic;
    iob6  : out std_logic;
    i6    : in  std_logic;
    ob6   : in  std_logic;
    iob7  : out std_logic;
    i7    : in  std_logic;
    ob7   : in  std_logic;
    i0    : in  std_logic;
    ob0   : in  std_logic;
    iob0  : out std_logic;
    i1    : in  std_logic;
    ob1   : in  std_logic;
    iob1  : out std_logic;
    iob2  : out std_logic;
    i2    : in  std_logic;
    ob2   : in  std_logic;
    iob3  : out std_logic;
    i3    : in  std_logic;
    ob3   : in  std_logic;
    i20   : in  std_logic;
    ob20  : in  std_logic;
    iob20 : out std_logic;
    i21   : in  std_logic;
    ob21  : in  std_logic;
    iob21 : out std_logic;
    iob22 : out std_logic;
    i22   : in  std_logic;
    ob22  : in  std_logic;
    iob23 : out std_logic;
    i23   : in  std_logic;
    ob23  : in  std_logic;
    i16   : in  std_logic;
    ob16  : in  std_logic;
    iob16 : out std_logic;
    i17   : in  std_logic;
    ob17  : in  std_logic;
    iob17 : out std_logic;
    iob18 : out std_logic;
    i18   : in  std_logic;
    ob18  : in  std_logic;
    iob19 : out std_logic;
    i19   : in  std_logic;
    ob19  : in  std_logic;
    i44   : in  std_logic;
    iob44 : out std_logic;
    i45   : in  std_logic;
    iob45 : out std_logic;
    iob46 : out std_logic;
    i46   : in  std_logic;
    iob47 : out std_logic;
    i47   : in  std_logic;
    i40   : in  std_logic;
    iob40 : out std_logic;
    i41   : in  std_logic;
    iob41 : out std_logic;
    iob42 : out std_logic;
    i42   : in  std_logic;
    iob43 : out std_logic;
    i43   : in  std_logic;
    i36   : in  std_logic;
    iob36 : out std_logic;
    i37   : in  std_logic;
    iob37 : out std_logic;
    iob38 : out std_logic;
    i38   : in  std_logic;
    iob39 : out std_logic;
    i39   : in  std_logic;
    i32   : in  std_logic;
    iob32 : out std_logic;
    i33   : in  std_logic;
    iob33 : out std_logic;
    iob34 : out std_logic;
    i34   : in  std_logic;
    iob35 : out std_logic;
    i35   : in  std_logic;
    i28   : in  std_logic;
    iob28 : out std_logic;
    i29   : in  std_logic;
    iob29 : out std_logic;
    iob30 : out std_logic;
    i30   : in  std_logic;
    iob31 : out std_logic;
    i31   : in  std_logic;
    i24   : in  std_logic;
    ob24  : in  std_logic;
    iob24 : out std_logic;
    i25   : in  std_logic;
    ob25  : in  std_logic;
    iob25 : out std_logic;
    iob26 : out std_logic;
    i26   : in  std_logic;
    iob27 : out std_logic;
    i27   : in  std_logic);
end;

architecture ttl of cadr_ior is
begin
  ior_3c06 : sn74s32 port map(
    g1a => i12,  -- p1 (I12)
    g1b => ob12, -- p2 (OB12)
    g1y => iob12, -- p3 (IOB12)
    g2a => i13,  -- p4 (I13)
    g2b => ob13, -- p5 (OB13)
    g2y => iob13, -- p6 (IOB13)
    g3a => i14,  -- p9 (I14)
    g3b => ob14, -- p10 (OB14)
    g3y => iob14, -- p8 (IOB14)
    g4a => i15,  -- p12 (I15)
    g4b => ob15, -- p13 (OB15)
    g4y => iob15  -- p11 (IOB15)
  );
  ior_3c07 : sn74s32 port map(
    g1a => i8,  -- p1 (I8)
    g1b => ob8, -- p2 (OB8)
    g1y => iob8, -- p3 (IOB8)
    g2a => i9,  -- p4 (I9)
    g2b => ob9, -- p5 (OB9)
    g2y => iob9, -- p6 (IOB9)
    g3a => i10,  -- p9 (I10)
    g3b => ob10, -- p10 (OB10)
    g3y => iob10, -- p8 (IOB10)
    g4a => i11,  -- p12 (I11)
    g4b => ob11, -- p13 (OB11)
    g4y => iob11  -- p11 (IOB11)
  );
  ior_3c08 : sn74s32 port map(
    g1a => i4,  -- p1 (I4)
    g1b => ob4, -- p2 (OB4)
    g1y => iob4, -- p3 (IOB4)
    g2a => i5,  -- p4 (I5)
    g2b => ob5, -- p5 (OB5)
    g2y => iob5, -- p6 (IOB5)
    g3a => i6,  -- p9 (I6)
    g3b => ob6, -- p10 (OB6)
    g3y => iob6, -- p8 (IOB6)
    g4a => i7,  -- p12 (I7)
    g4b => ob7, -- p13 (OB7)
    g4y => iob7  -- p11 (IOB7)
  );
  ior_3c09 : sn74s32 port map(
    g1a => i0,  -- p1 (I0)
    g1b => ob0, -- p2 (OB0)
    g1y => iob0, -- p3 (IOB0)
    g2a => i1,  -- p4 (I1)
    g2b => ob1, -- p5 (OB1)
    g2y => iob1, -- p6 (IOB1)
    g3a => i2,  -- p9 (I2)
    g3b => ob2, -- p10 (OB2)
    g3y => iob2, -- p8 (IOB2)
    g4a => i3,  -- p12 (I3)
    g4b => ob3, -- p13 (OB3)
    g4y => iob3  -- p11 (IOB3)
  );
  ior_3c16 : sn74s32 port map(
    g1a => i20,  -- p1 (I20)
    g1b => ob20, -- p2 (OB20)
    g1y => iob20, -- p3 (IOB20)
    g2a => i21,  -- p4 (I21)
    g2b => ob21, -- p5 (OB21)
    g2y => iob21, -- p6 (IOB21)
    g3a => i22,  -- p9 (I22)
    g3b => ob22, -- p10 (OB22)
    g3y => iob22, -- p8 (IOB22)
    g4a => i23,  -- p12 (I23)
    g4b => ob23, -- p13 (OB23)
    g4y => iob23  -- p11 (IOB23)
  );
  ior_3c18 : sn74s32 port map(
    g1a => i16,  -- p1 (I16)
    g1b => ob16, -- p2 (OB16)
    g1y => iob16, -- p3 (IOB16)
    g2a => i17,  -- p4 (I17)
    g2b => ob17, -- p5 (OB17)
    g2y => iob17, -- p6 (IOB17)
    g3a => i18,  -- p9 (I18)
    g3b => ob18, -- p10 (OB18)
    g3y => iob18, -- p8 (IOB18)
    g4a => i19,  -- p12 (I19)
    g4b => ob19, -- p13 (OB19)
    g4y => iob19  -- p11 (IOB19)
  );
  ior_3d08 : sn74s32 port map(
    g1a => i44,  -- p1 (I44)
    g1b => ob18, -- p2 (OB18)
    g1y => iob44, -- p3 (IOB44)
    g2a => i45,  -- p4 (I45)
    g2b => ob19, -- p5 (OB19)
    g2y => iob45, -- p6 (IOB45)
    g3a => i46,  -- p9 (I46)
    g3b => ob20, -- p10 (OB20)
    g3y => iob46, -- p8 (IOB46)
    g4a => i47,  -- p12 (I47)
    g4b => ob21, -- p13 (OB21)
    g4y => iob47  -- p11 (IOB47)
  );
  ior_3d09 : sn74s32 port map(
    g1a => i40,  -- p1 (I40)
    g1b => ob14, -- p2 (OB14)
    g1y => iob40, -- p3 (IOB40)
    g2a => i41,  -- p4 (I41)
    g2b => ob15, -- p5 (OB15)
    g2y => iob41, -- p6 (IOB41)
    g3a => i42,  -- p9 (I42)
    g3b => ob16, -- p10 (OB16)
    g3y => iob42, -- p8 (IOB42)
    g4a => i43,  -- p12 (I43)
    g4b => ob17, -- p13 (OB17)
    g4y => iob43  -- p11 (IOB43)
  );
  ior_3d10 : sn74s32 port map(
    g1a => i36,  -- p1 (I36)
    g1b => ob10, -- p2 (OB10)
    g1y => iob36, -- p3 (IOB36)
    g2a => i37,  -- p4 (I37)
    g2b => ob11, -- p5 (OB11)
    g2y => iob37, -- p6 (IOB37)
    g3a => i38,  -- p9 (I38)
    g3b => ob12, -- p10 (OB12)
    g3y => iob38, -- p8 (IOB38)
    g4a => i39,  -- p12 (I39)
    g4b => ob13, -- p13 (OB13)
    g4y => iob39  -- p11 (IOB39)
  );
  ior_3d13 : sn74s32 port map(
    g1a => i32,  -- p1 (I32)
    g1b => ob6, -- p2 (OB6)
    g1y => iob32, -- p3 (IOB32)
    g2a => i33,  -- p4 (I33)
    g2b => ob7, -- p5 (OB7)
    g2y => iob33, -- p6 (IOB33)
    g3a => i34,  -- p9 (I34)
    g3b => ob8, -- p10 (OB8)
    g3y => iob34, -- p8 (IOB34)
    g4a => i35,  -- p12 (I35)
    g4b => ob9, -- p13 (OB9)
    g4y => iob35  -- p11 (IOB35)
  );
  ior_3d14 : sn74s32 port map(
    g1a => i28,  -- p1 (I28)
    g1b => ob2, -- p2 (OB2)
    g1y => iob28, -- p3 (IOB28)
    g2a => i29,  -- p4 (I29)
    g2b => ob3, -- p5 (OB3)
    g2y => iob29, -- p6 (IOB29)
    g3a => i30,  -- p9 (I30)
    g3b => ob4, -- p10 (OB4)
    g3y => iob30, -- p8 (IOB30)
    g4a => i31,  -- p12 (I31)
    g4b => ob5, -- p13 (OB5)
    g4y => iob31  -- p11 (IOB31)
  );
  ior_3d15 : sn74s32 port map(
    g1a => i24,  -- p1 (I24)
    g1b => ob24, -- p2 (OB24)
    g1y => iob24, -- p3 (IOB24)
    g2a => i25,  -- p4 (I25)
    g2b => ob25, -- p5 (OB25)
    g2y => iob25, -- p6 (IOB25)
    g3a => i26,  -- p9 (I26)
    g3b => ob0, -- p10 (OB0)
    g3y => iob26, -- p8 (IOB26)
    g4a => i27,  -- p12 (I27)
    g4b => ob1, -- p13 (OB1)
    g4y => iob27  -- p11 (IOB27)
  );
end architecture;
