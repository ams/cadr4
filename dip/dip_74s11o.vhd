library ieee;
use ieee.std_logic_1164.all;


entity dip_74s11o is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : in  std_logic;  -- g1b
    p3  : in  std_logic;  -- g2a
    p4  : in  std_logic;  -- g2b
    p5  : in  std_logic;  -- g2c
    p6  : out std_logic;  -- g2y
    p8  : out std_logic;  -- g3y
    p9  : in  std_logic;  -- g3a
    p10 : in  std_logic;  -- g3b
    p11 : in  std_logic;  -- g3c
    p12 : out std_logic;  -- g1y
    p13 : in  std_logic   -- g1c
    );
end entity;

architecture dip of dip_74s11o is
begin
  U_74s11o : entity work.sn7411
    port map (
      g1a => p1,
      g1b => p2,
      g1c => p13,
      g1y => p12,
      g2a => p3,
      g2b => p4,
      g2c => p5,
      g2y => p6,
      g3a => p9,
      g3b => p10,
      g3c => p11,
      g3y => p8
      );
end architecture; 