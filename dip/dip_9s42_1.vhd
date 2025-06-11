library ieee;
use ieee.std_logic_1164.all;


entity dip_9s42_1 is
  port (
    p1  : in  std_logic;  -- g1a1
    p2  : in  std_logic;  -- g1b1
    p3  : in  std_logic;  -- g2a1
    p4  : in  std_logic;  -- g2b1
    p5  : in  std_logic;  -- g2c1
    p6  : in  std_logic;  -- g2d1
    p7  : out std_logic;  -- out1
    p9  : out std_logic;  -- out2
    p10 : in  std_logic;  -- g2d2
    p11 : in  std_logic;  -- g2c2
    p12 : in  std_logic;  -- g2b2
    p13 : in  std_logic;  -- g2a2
    p14 : in  std_logic;  -- g1b2
    p15 : in  std_logic   -- g1a2
    );
end entity;

architecture dip of dip_9s42_1 is
begin
  U_9s42_1 : entity work.dm942
    port map (
      g1a1 => p1,
      g1b1 => p2,
      g2a1 => p3,
      g2b1 => p4,
      g2c1 => p5,
      g2d1 => p6,
      out1 => p7,
      out2 => p9,
      g2d2 => p10,
      g2c2 => p11,
      g2b2 => p12,
      g2a2 => p13,
      g1b2 => p14,
      g1a2 => p15
      );
end architecture; 