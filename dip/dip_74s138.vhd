library ieee;
use ieee.std_logic_1164.all;


entity dip_74s138 is
  port (
    p1  : in  std_logic;  -- a
    p2  : in  std_logic;  -- b
    p3  : in  std_logic;  -- c
    p4  : in  std_logic;  -- g2a
    p5  : in  std_logic;  -- g2b
    p6  : in  std_logic;  -- g1
    p7  : out std_logic;  -- y7
    p9  : out std_logic;  -- y6
    p10 : out std_logic;  -- y5
    p11 : out std_logic;  -- y4
    p12 : out std_logic;  -- y3
    p13 : out std_logic;  -- y2
    p14 : out std_logic;  -- y1
    p15 : out std_logic   -- y0
    );
end entity;

architecture dip of dip_74s138 is
begin
  U_74s138 : entity work.sn74138
    port map (
      a   => p1,
      b   => p2,
      c   => p3,
      g1  => p6,
      g2a => p4,
      g2b => p5,
      y0  => p15,
      y1  => p14,
      y2  => p13,
      y3  => p12,
      y4  => p11,
      y5  => p10,
      y6  => p9,
      y7  => p7
      );
end architecture; 