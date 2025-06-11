library ieee;
use ieee.std_logic_1164.all;


entity dip_74s139 is
  port (
    p1  : in  std_logic;  -- g1
    p2  : in  std_logic;  -- a1
    p3  : in  std_logic;  -- b1
    p4  : out std_logic;  -- g1y0
    p5  : out std_logic;  -- g1y1
    p6  : out std_logic;  -- g1y2
    p7  : out std_logic;  -- g1y3
    p9  : out std_logic;  -- g2y3
    p10 : out std_logic;  -- g2y2
    p11 : out std_logic;  -- g2y1
    p12 : out std_logic;  -- g2y0
    p13 : in  std_logic;  -- b2
    p14 : in  std_logic;  -- a2
    p15 : in  std_logic   -- g2
    );
end entity;

architecture dip of dip_74s139 is
begin
  U_74s139 : entity work.sn74139
    port map (
      g1   => p1,
      a1   => p2,
      b1   => p3,
      g1y0 => p4,
      g1y1 => p5,
      g1y2 => p6,
      g1y3 => p7,
      g2y3 => p9,
      g2y2 => p10,
      g2y1 => p11,
      g2y0 => p12,
      b2   => p13,
      a2   => p14,
      g2   => p15
      );
end architecture; 