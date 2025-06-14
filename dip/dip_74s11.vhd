library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s11 is
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
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s11 is
begin
  U1 : sn7411
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
