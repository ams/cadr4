library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn7451;

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
      g1a => p2,
      g1b => p3,
      g1c => p4,
      g1d => p5,
      g1y => p6,

      g2a => p9,
      g2b => p10,
      g2c => p13,
      g2d => p1,
      g2y => p8

      );
end architecture;
