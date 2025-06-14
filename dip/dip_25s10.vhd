library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_25s10 is
  -- p8 and p16 are gnd and vcc, am2510(ttl) doesn't have gnd and vcc
  -- so they are not mapped.
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end dip_25s10;

architecture dip of dip_25s10 is
begin
  U1 : am2510
    port map (
      i_3  => p1,
      i_2  => p2,
      i_1  => p3,
      i0   => p4,
      i1   => p5,
      i2   => p6,
      i3   => p7,
      sel1 => p9,
      sel0 => p10,
      o3   => p11,
      o2   => p12,
      ce_n => p13,
      o1   => p14,
      o0   => p15
      );
end architecture;
