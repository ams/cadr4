library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_alatch is
  port (
    \-amemenb\  : in  std_logic;
    a23         : out std_logic;
    amem23      : in  std_logic;
    amem22      : in  std_logic;
    a22         : out std_logic;
    a21         : out std_logic;
    amem21      : in  std_logic;
    amem20      : in  std_logic;
    a20         : out std_logic;
    clk3e       : in  std_logic;
    a19         : out std_logic;
    amem19      : in  std_logic;
    amem18      : in  std_logic;
    a18         : out std_logic;
    a17         : out std_logic;
    amem17      : in  std_logic;
    amem16      : in  std_logic;
    a16         : out std_logic;
    \-apassenb\ : in  std_logic;
    l15         : in  std_logic;
    a8          : out std_logic;
    l14         : in  std_logic;
    a9          : out std_logic;
    l13         : in  std_logic;
    a10         : out std_logic;
    l12         : in  std_logic;
    a11         : out std_logic;
    l11         : in  std_logic;
    a12         : out std_logic;
    l10         : in  std_logic;
    a13         : out std_logic;
    l9          : in  std_logic;
    a14         : out std_logic;
    l8          : in  std_logic;
    a15         : out std_logic;
    apassenb    : in  std_logic;
    amem15      : in  std_logic;
    amem14      : in  std_logic;
    amem13      : in  std_logic;
    amem12      : in  std_logic;
    amem11      : in  std_logic;
    amem10      : in  std_logic;
    amem9       : in  std_logic;
    amem8       : in  std_logic;
    l7          : in  std_logic;
    a0          : out std_logic;
    l6          : in  std_logic;
    a1          : out std_logic;
    l5          : in  std_logic;
    a2          : out std_logic;
    l4          : in  std_logic;
    a3          : out std_logic;
    l3          : in  std_logic;
    a4          : out std_logic;
    l2          : in  std_logic;
    a5          : out std_logic;
    l1          : in  std_logic;
    a6          : out std_logic;
    l0          : in  std_logic;
    a7          : out std_logic;
    amem7       : in  std_logic;
    amem6       : in  std_logic;
    amem5       : in  std_logic;
    amem4       : in  std_logic;
    amem3       : in  std_logic;
    amem2       : in  std_logic;
    amem1       : in  std_logic;
    amem0       : in  std_logic;
    hi5         : in  std_logic;
    a31b        : out std_logic;
    aparity     : out std_logic;
    lparity     : in  std_logic;
    l31         : in  std_logic;
    amemparity  : in  std_logic;
    amem31      : in  std_logic;
    a24         : out std_logic;
    l30         : in  std_logic;
    a25         : out std_logic;
    l29         : in  std_logic;
    a26         : out std_logic;
    l28         : in  std_logic;
    a27         : out std_logic;
    l27         : in  std_logic;
    a28         : out std_logic;
    l26         : in  std_logic;
    a29         : out std_logic;
    l25         : in  std_logic;
    a30         : out std_logic;
    l24         : in  std_logic;
    a31a        : out std_logic;
    amem30      : in  std_logic;
    amem29      : in  std_logic;
    amem28      : in  std_logic;
    amem27      : in  std_logic;
    amem26      : in  std_logic;
    amem25      : in  std_logic;
    amem24      : in  std_logic;
    l23         : in  std_logic;
    l22         : in  std_logic;
    l21         : in  std_logic;
    l20         : in  std_logic;
    l19         : in  std_logic;
    l18         : in  std_logic;
    l17         : in  std_logic;
    l16         : in  std_logic);
end;

architecture ttl of cadr4_alatch is
begin
  alatch_3a01 : sn74s373 port map(
    oenb_n => \-amemenb\, -- p1 (-AMEMENB)
    o0     => a23,       -- p2 (A23)
    i0     => amem23,    -- p3 (AMEM23)
    i1     => amem22,    -- p4 (AMEM22)
    o1     => a22,       -- p5 (A22)
    o2     => a21,       -- p6 (A21)
    i2     => amem21,    -- p7 (AMEM21)
    i3     => amem20,    -- p8 (AMEM20)
    o3     => a20,       -- p9 (A20)
    hold_n => clk3e,     -- p11 (CLK3E)
    o4     => a19,       -- p12 (A19)
    i4     => amem19,    -- p13 (AMEM19)
    i5     => amem18,    -- p14 (AMEM18)
    o5     => a18,       -- p15 (A18)
    o6     => a17,       -- p16 (A17)
    i6     => amem17,    -- p17 (AMEM17)
    i7     => amem16,    -- p18 (AMEM16)
    o7     => a16        -- p19 (A16)
  );
  alatch_3a02 : sn74s241 port map(
    aenb_n => \-apassenb\, -- p1 (-APASSENB)
    ain0   => l15,         -- p2 (L15)
    bout3  => a8,          -- p3 (A8)
    ain1   => l14,         -- p4 (L14)
    bout2  => a9,          -- p5 (A9)
    ain2   => l13,         -- p6 (L13)
    bout1  => a10,         -- p7 (A10)
    ain3   => l12,         -- p8 (L12)
    bout0  => a11,         -- p9 (A11)
    bin0   => l11,         -- p11 (L11)
    aout3  => a12,         -- p12 (A12)
    bin1   => l10,         -- p13 (L10)
    aout2  => a13,         -- p14 (L13)
    bin2   => l9,          -- p15 (L9)
    aout1  => a14,         -- p16 (A14)
    bin3   => l8,          -- p17 (L8)
    aout0  => a15,         -- p18 (A15)
    benb   => apassenb     -- p19 (APASSENB)
  );
  alatch_3a03 : sn74s373 port map(
    oenb_n => \-amemenb\, -- p1 (-AMEMENB)
    o0     => a15,       -- p2 (A15)
    i0     => amem15,    -- p3 (AMEM15)
    i1     => amem14,    -- p4 (AMEM14)
    o1     => a14,       -- p5 (A14)
    o2     => a13,       -- p6 (A13)
    i2     => amem13,    -- p7 (AMEM13)
    i3     => amem12,    -- p8 (AMEM12)
    o3     => a12,       -- p9 (A12)
    hold_n => clk3e,     -- p11 (CLK3E)
    o4     => a11,       -- p12 (A11)
    i4     => amem11,    -- p13 (AMEM11)
    i5     => amem10,    -- p14 (AMEM10)
    o5     => a10,       -- p15 (A10)
    o6     => a9,        -- p16 (A9)
    i6     => amem9,     -- p17 (AMEM9)
    i7     => amem8,     -- p18 (AMEM8)
    o7     => a8         -- p19 (A8)
  );
  alatch_3a04 : sn74s241 port map(
    aenb_n => \-apassenb\, -- p1 (-APASSENB)
    ain0   => l7,          -- p2 (L7)
    bout3  => a0,          -- p3 (A0)
    ain1   => l6,          -- p4 (L6)
    bout2  => a1,          -- p5 (A1)
    ain2   => l5,          -- p6 (L5)
    bout1  => a2,          -- p7 (A2)
    ain3   => l4,          -- p8 (L4)
    bout0  => a3,          -- p9 (A3)
    bin0   => l3,          -- p11 (L3)
    aout3  => a4,          -- p12 (A4)
    bin1   => l2,          -- p13 (L2)
    aout2  => a5,          -- p14 (L5)
    bin2   => l1,          -- p15 (L1)
    aout1  => a6,          -- p16 (A6)
    bin3   => l0,          -- p17 (L0)
    aout0  => a7,          -- p18 (A7)
    benb   => apassenb     -- p19 (APASSENB)
  );
  alatch_3a05 : sn74s373 port map(
    oenb_n => \-amemenb\, -- p1 (-AMEMENB)
    o0     => a7,        -- p2 (A7)
    i0     => amem7,     -- p3 (AMEM7)
    i1     => amem6,     -- p4 (AMEM6)
    o1     => a6,        -- p5 (A6)
    o2     => a5,        -- p6 (A5)
    i2     => amem5,     -- p7 (AMEM5)
    i3     => amem4,     -- p8 (AMEM4)
    o3     => a4,        -- p9 (A4)
    hold_n => clk3e,     -- p11 (CLK3E)
    o4     => a3,        -- p12 (A3)
    i4     => amem3,     -- p13 (AMEM3)
    i5     => amem2,     -- p14 (AMEM2)
    o5     => a2,        -- p15 (A2)
    o6     => a1,        -- p16 (A1)
    i6     => amem1,     -- p17 (AMEM1)
    i7     => amem0,     -- p18 (AMEM0)
    o7     => a0         -- p19 (A0)
  );
  alatch_3b01 : sn74s241 port map(
    aenb_n => hi5,         -- p1 (HI5)
    ain0   => '0',       -- p2 (NC)
    bout3  => a31b,        -- p3 (A31B)
    ain1   => '0',       -- p4 (NC)
    bout2  => aparity,     -- p5 (APARITY)
    ain2   => '0',       -- p6 (NC)
    bout1  => open,       -- p7 (NC)
    ain3   => '0',       -- p8 (NC)
    bout0  => open,       -- p9 (NC)
    bin0   => '0',       -- p11 (NC)
    aout3  => open,       -- p12 (NC)
    bin1   => '0',       -- p13 (NC)
    aout2  => open,       -- p14 (NC)
    bin2   => lparity,     -- p15 (LPARITY)
    aout1  => open,       -- p16 (NC)
    bin3   => l31,         -- p17 (L31)
    aout0  => open,       -- p18 (NC)
    benb   => apassenb     -- p19 (APASSENB)
  );
  alatch_3b02 : sn74s373 port map(
    oenb_n => \-amemenb\, -- p1 (-AMEMENB)
    o0     => open,     -- p2 (NC)
    i0     => '0',     -- p3 (NC)
    i1     => '0',     -- p4 (NC)
    o1     => open,     -- p5 (NC)
    o2     => open,     -- p6 (NC)
    i2     => '0',     -- p7 (NC)
    i3     => '0',     -- p8 (NC)
    o3     => open,     -- p9 (NC)
    hold_n => clk3e,     -- p11 (CLK3E)
    o4     => open,     -- p12 (NC)
    i4     => '0',     -- p13 (NC)
    i5     => '0',     -- p14 (NC)
    o5     => open,     -- p15 (NC)
    o6     => aparity,   -- p16 (APARITY)
    i6     => amemparity, -- p17 (AMEMPARITY)
    i7     => amem31,    -- p18 (AMEM31)
    o7     => a31b       -- p19 (A31B)
  );
  alatch_3b03 : sn74s241 port map(
    aenb_n => \-apassenb\, -- p1 (-APASSENB)
    ain0   => l31,         -- p2 (L31)
    bout3  => a24,         -- p3 (A24)
    ain1   => l30,         -- p4 (L30)
    bout2  => a25,         -- p5 (A25)
    ain2   => l29,         -- p6 (L29)
    bout1  => a26,         -- p7 (A26)
    ain3   => l28,         -- p8 (L28)
    bout0  => a27,         -- p9 (A27)
    bin0   => l27,         -- p11 (L27)
    aout3  => a28,         -- p12 (A28)
    bin1   => l26,         -- p13 (L26)
    aout2  => a29,         -- p14 (L29)
    bin2   => l25,         -- p15 (L25)
    aout1  => a30,         -- p16 (A30)
    bin3   => l24,         -- p17 (L24)
    aout0  => a31a,        -- p18 (A31A)
    benb   => apassenb     -- p19 (APASSENB)
  );
  alatch_3b04 : sn74s373 port map(
    oenb_n => \-amemenb\, -- p1 (-AMEMENB)
    o0     => a31a,      -- p2 (A31A)
    i0     => amem31,    -- p3 (AMEM31)
    i1     => amem30,    -- p4 (AMEM30)
    o1     => a30,       -- p5 (A30)
    o2     => a29,       -- p6 (A29)
    i2     => amem29,    -- p7 (AMEM29)
    i3     => amem28,    -- p8 (AMEM28)
    o3     => a28,       -- p9 (A28)
    hold_n => clk3e,     -- p11 (CLK3E)
    o4     => a27,       -- p12 (A27)
    i4     => amem27,    -- p13 (AMEM27)
    i5     => amem26,    -- p14 (AMEM26)
    o5     => a26,       -- p15 (A26)
    o6     => a25,       -- p16 (A25)
    i6     => amem25,    -- p17 (AMEM25)
    i7     => amem24,    -- p18 (AMEM24)
    o7     => a24        -- p19 (A24)
  );
  alatch_3b05 : sn74s241 port map(
    aenb_n => \-apassenb\, -- p1 (-APASSENB)
    ain0   => l23,         -- p2 (L23)
    bout3  => a16,         -- p3 (A16)
    ain1   => l22,         -- p4 (L22)
    bout2  => a17,         -- p5 (A17)
    ain2   => l21,         -- p6 (L21)
    bout1  => a18,         -- p7 (A18)
    ain3   => l20,         -- p8 (L20)
    bout0  => a19,         -- p9 (A19)
    bin0   => l19,         -- p11 (L19)
    aout3  => a20,         -- p12 (A20)
    bin1   => l18,         -- p13 (L18)
    aout2  => a21,         -- p14 (L17)
    bin2   => l17,         -- p15 (L17)
    aout1  => a22,         -- p16 (A22)
    bin3   => l16,         -- p17 (L16)
    aout0  => a23,         -- p18 (A23)
    benb   => apassenb     -- p19 (APASSENB)
  );
end architecture;
