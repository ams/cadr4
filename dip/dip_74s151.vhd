library ieee;
use ieee.std_logic_1164.all;


entity dip_74s151 is
  port (
    p1  : in  std_logic;  -- i3
    p2  : in  std_logic;  -- i2
    p3  : in  std_logic;  -- i1
    p4  : in  std_logic;  -- i0
    p5  : out std_logic;  -- q
    p6  : out std_logic;  -- q_n
    p7  : in  std_logic;  -- ce_n
    p9  : in  std_logic;  -- sel2
    p10 : in  std_logic;  -- sel1
    p11 : in  std_logic;  -- sel0
    p12 : in  std_logic;  -- i7
    p13 : in  std_logic;  -- i6
    p14 : in  std_logic;  -- i5
    p15 : in  std_logic   -- i4
    );
end entity;

architecture dip of dip_74s151 is
begin
  U_74s151 : entity work.sn74151
    port map (
      i0   => p4,
      i1   => p3,
      i2   => p2,
      i3   => p1,
      i4   => p15,
      i5   => p14,
      i6   => p13,
      i7   => p12,
      sel0 => p11,
      sel1 => p10,
      sel2 => p9,
      ce_n => p7,
      q    => p5,
      q_n  => p6
      );
end architecture; 