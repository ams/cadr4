library ieee;
use ieee.std_logic_1164.all;

entity dip_74s51 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s51 is
begin
  U1 : sn7451
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
