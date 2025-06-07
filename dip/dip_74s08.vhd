library ieee;
use ieee.std_logic_1164.all;


entity dip_74s08 is
  port (
    p1  : in  std_logic;  -- g1b
    p2  : in  std_logic;  -- g1a
    p3  : out std_logic;  -- g1q
    p4  : in  std_logic;  -- g2b
    p5  : in  std_logic;  -- g2a
    p6  : out std_logic;  -- g2q
    p8  : out std_logic;  -- g3q
    p9  : in  std_logic;  -- g3a
    p10 : in  std_logic;  -- g3b
    p11 : out std_logic;  -- g4q
    p12 : in  std_logic;  -- g4a
    p13 : in  std_logic   -- g4b
    );
end entity;

architecture dip of dip_74s08 is
begin
  U_74s08 : entity work.sn7408
    port map (
      g1a => p2,
      g1b => p1,
      g1q => p3,
      g2a => p5,
      g2b => p4,
      g2q => p6,
      g3a => p9,
      g3b => p10,
      g3q => p8,
      g4a => p12,
      g4b => p13,
      g4q => p11
      );
end architecture; 