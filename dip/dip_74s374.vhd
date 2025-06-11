library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s374 is
  port (
    p1  : in  std_logic;  -- oenb_n
    p2  : out std_logic;  -- o0
    p3  : in  std_logic;  -- i0
    p4  : in  std_logic;  -- i1
    p5  : out std_logic;  -- o1
    p6  : out std_logic;  -- o2
    p7  : in  std_logic;  -- i2
    p8  : in  std_logic;  -- i3
    p9  : out std_logic;  -- o3
    p11 : in  std_logic;  -- clk
    p12 : out std_logic;  -- o4
    p13 : in  std_logic;  -- i4
    p14 : in  std_logic;  -- i5
    p15 : out std_logic;  -- o5
    p16 : out std_logic;  -- o6
    p17 : in  std_logic;  -- i6
    p18 : in  std_logic;  -- i7
    p19 : out std_logic   -- o7
    );
end entity;

architecture dip of dip_74s374 is
begin

  U_sn74374 : sn74374
    port map (
      oenb_n => p1,
      o0     => p2,
      i0     => p3,
      i1     => p4,
      o1     => p5,
      o2     => p6,
      i2     => p7,
      i3     => p8,
      o3     => p9,
      clk    => p11,
      o4     => p12,
      i4     => p13,
      i5     => p14,
      o5     => p15,
      o6     => p16,
      i6     => p17,
      i7     => p18,
      o7     => p19
      );

end architecture; 