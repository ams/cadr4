library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn7420;

entity dip_74s20 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s20 is
begin
  U1 : sn7420
    port map (
      g1a   => p1,
      g1b   => p2,
      g1c   => p4,
      g1d   => p5,
      g1y_n => p6,
      g2y_n => p8,
      g2a   => p9,
      g2b   => p10,
      g2c   => p12,
      g2d   => p13
      );
end architecture;
