library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s153 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s153 is
begin
  U1 : sn74s153
    port map (
      g1c0   => p6,
      g1c1   => p5,
      g1c2   => p4,
      g1c3   => p3,
      enb1_n => p1,
      g1y    => p7,

      g2c0   => p10,
      g2c1   => p11,
      g2c2   => p12,
      g2c3   => p13,
      enb2_n => p15,
      g2y    => p9,

      sela   => p14,
      selb   => p2
      );
end architecture;
