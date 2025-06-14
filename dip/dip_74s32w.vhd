library ieee;
use ieee.std_logic_1164.all;

entity dip_74s32w is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s32w is
begin
  U1 : sn7432
    port map (
      g1a => p1,
      g1b => p2,
      g1y => p3,
      g2a => p4,
      g2b => p5,
      g2y => p6,
      g3y => p8,
      g3b => p9,
      g3a => p10,
      g4y => p11,
      g4b => p12,
      g4a => p13
      );
end architecture;
