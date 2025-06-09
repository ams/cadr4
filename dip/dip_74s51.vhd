library ieee;
use ieee.std_logic_1164.all;


entity dip_74s51 is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : in  std_logic;  -- g2a
    p3  : in  std_logic;  -- g2b
    p4  : in  std_logic;  -- g2c
    p5  : in  std_logic;  -- g2d
    p6  : out std_logic;  -- g2y
    p8  : out std_logic;  -- g1y
    p9  : in  std_logic;  -- g1c
    p10 : in  std_logic;  -- g1d
    p13 : in  std_logic   -- g1b
    );
end entity;

architecture dip of dip_74s51 is
begin
  U_74s51 : entity work.sn7451
    port map (
      g1a => p1,
      g1b => p13,
      g1c => p9,
      g1d => p10,
      g1y => p8,
      g2a => p2,
      g2b => p3,
      g2c => p4,
      g2d => p5,
      g2y => p6
      );
end architecture; 