library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_debug is
  port (
    \-idebug\  : in  std_logic;
    i39        : out std_logic;
    spy7       : in  std_logic;
    spy6       : in  std_logic;
    i38        : out std_logic;
    i37        : out std_logic;
    spy5       : in  std_logic;
    spy4       : in  std_logic;
    i36        : out std_logic;
    \-lddbirh\ : in  std_logic;
    i35        : out std_logic;
    spy3       : in  std_logic;
    spy2       : in  std_logic;
    i34        : out std_logic;
    i33        : out std_logic;
    spy1       : in  std_logic;
    spy0       : in  std_logic;
    i32        : out std_logic;
    i31        : out std_logic;
    spy15      : in  std_logic;
    spy14      : in  std_logic;
    i30        : out std_logic;
    i29        : out std_logic;
    spy13      : in  std_logic;
    spy12      : in  std_logic;
    i28        : out std_logic;
    \-lddbirm\ : in  std_logic;
    i27        : out std_logic;
    spy11      : in  std_logic;
    spy10      : in  std_logic;
    i26        : out std_logic;
    i25        : out std_logic;
    spy9       : in  std_logic;
    spy8       : in  std_logic;
    i24        : out std_logic;
    i23        : out std_logic;
    i22        : out std_logic;
    i21        : out std_logic;
    i20        : out std_logic;
    i19        : out std_logic;
    i18        : out std_logic;
    i17        : out std_logic;
    i16        : out std_logic;
    i15        : out std_logic;
    i14        : out std_logic;
    i13        : out std_logic;
    i12        : out std_logic;
    \-lddbirl\ : in  std_logic;
    i11        : out std_logic;
    i10        : out std_logic;
    i9         : out std_logic;
    i8         : out std_logic;
    i7         : out std_logic;
    i6         : out std_logic;
    i5         : out std_logic;
    i4         : out std_logic;
    i3         : out std_logic;
    i2         : out std_logic;
    i1         : out std_logic;
    i0         : out std_logic;
    i47        : out std_logic;
    i46        : out std_logic;
    i45        : out std_logic;
    i44        : out std_logic;
    i43        : out std_logic;
    i42        : out std_logic;
    i41        : out std_logic;
    i40        : out std_logic);
end;

architecture ttl of cadr_debug is
begin
  debug_1e11 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i39, -- p2 (I39)
    i0 => spy7, -- p3 (SPY7)
    i1 => spy6, -- p4 (SPY6)
    o1 => i38, -- p5 (I38)
    o2 => i37, -- p6 (I37)
    i2 => spy5, -- p7 (SPY5)
    i3 => spy4, -- p8 (SPY4)
    o3 => i36, -- p9 (I36)
    clk => \-lddbirh\, -- p11 (-LDDBIRH)
    o4 => i35, -- p12 (I35)
    i4 => spy3, -- p13 (SPY3)
    i5 => spy2, -- p14 (SPY2)
    o5 => i34, -- p15 (I34)
    o6 => i33, -- p16 (I33)
    i6 => spy1, -- p17 (SPY1)
    i7 => spy0, -- p18 (SPY0)
    o7 => i32 -- p19 (I32)
  );
  debug_1e12 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i31, -- p2 (I31)
    i0 => spy15, -- p3 (SPY15)
    i1 => spy14, -- p4 (SPY14)
    o1 => i30, -- p5 (I30)
    o2 => i29, -- p6 (I29)
    i2 => spy13, -- p7 (SPY13)
    i3 => spy12, -- p8 (SPY12)
    o3 => i28, -- p9 (I28)
    clk => \-lddbirm\, -- p11 (-LDDBIRM)
    o4 => i27, -- p12 (I27)
    i4 => spy11, -- p13 (SPY11)
    i5 => spy10, -- p14 (SPY10)
    o5 => i26, -- p15 (I26)
    o6 => i25, -- p16 (I25)
    i6 => spy9, -- p17 (SPY9)
    i7 => spy8, -- p18 (SPY8)
    o7 => i24 -- p19 (I24)
  );
  debug_1e13 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i23, -- p2 (I23)
    i0 => spy7, -- p3 (SPY7)
    i1 => spy6, -- p4 (SPY6)
    o1 => i22, -- p5 (I22)
    o2 => i21, -- p6 (I21)
    i2 => spy5, -- p7 (SPY5)
    i3 => spy4, -- p8 (SPY4)
    o3 => i20, -- p9 (I20)
    clk => \-lddbirm\, -- p11 (-LDDBIRM)
    o4 => i19, -- p12 (I19)
    i4 => spy3, -- p13 (SPY3)
    i5 => spy2, -- p14 (SPY2)
    o5 => i18, -- p15 (I18)
    o6 => i17, -- p16 (I17)
    i6 => spy1, -- p17 (SPY1)
    i7 => spy0, -- p18 (SPY0)
    o7 => i16 -- p19 (I16)
  );
  debug_1e14 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i15, -- p2 (I15)
    i0 => spy15, -- p3 (SPY15)
    i1 => spy14, -- p4 (SPY14)
    o1 => i14, -- p5 (I14)
    o2 => i13, -- p6 (I13)
    i2 => spy13, -- p7 (SPY13)
    i3 => spy12, -- p8 (SPY12)
    o3 => i12, -- p9 (I12)
    clk => \-lddbirl\, -- p11 (-LDDBIRL)
    o4 => i11, -- p12 (I11)
    i4 => spy11, -- p13 (SPY11)
    i5 => spy10, -- p14 (SPY10)
    o5 => i10, -- p15 (I10)
    o6 => i9, -- p16 (I9)
    i6 => spy9, -- p17 (SPY9)
    i7 => spy8, -- p18 (SPY8)
    o7 => i8 -- p19 (I8)
  );
  debug_1e15 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i7, -- p2 (I7)
    i0 => spy7, -- p3 (SPY7)
    i1 => spy6, -- p4 (SPY6)
    o1 => i6, -- p5 (I6)
    o2 => i5, -- p6 (I5)
    i2 => spy5, -- p7 (SPY5)
    i3 => spy4, -- p8 (SPY4)
    o3 => i4, -- p9 (I4)
    clk => \-lddbirl\, -- p11 (-LDDBIRL)
    o4 => i3, -- p12 (I3)
    i4 => spy3, -- p13 (SPY3)
    i5 => spy2, -- p14 (SPY2)
    o5 => i2, -- p15 (I2)
    o6 => i1, -- p16 (I1)
    i6 => spy1, -- p17 (SPY1)
    i7 => spy0, -- p18 (SPY0)
    o7 => i0 -- p19 (I0)
  );
  debug_1f15 : sn74s374 port map(
    oenb_n => \-idebug\, -- p1 (-IDEBUG)
    o0 => i47, -- p2 (I47)
    i0 => spy15, -- p3 (SPY15)
    i1 => spy14, -- p4 (SPY14)
    o1 => i46, -- p5 (I46)
    o2 => i45, -- p6 (I45)
    i2 => spy13, -- p7 (SPY13)
    i3 => spy12, -- p8 (SPY12)
    o3 => i44, -- p9 (I44)
    clk => \-lddbirh\, -- p11 (-LDDBIRH)
    o4 => i43, -- p12 (I43)
    i4 => spy11, -- p13 (SPY11)
    i5 => spy10, -- p14 (SPY10)
    o5 => i42, -- p15 (I42)
    o6 => i41, -- p16 (I41)
    i6 => spy9, -- p17 (SPY9)
    i7 => spy8, -- p18 (SPY8)
    o7 => i40 -- p19 (I40)
  );
end architecture;
