-- dip_74ls27.vhd -- 74LS27 Triple 3-Input NOR Gate

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn7427;

entity dip_74ls27 is
  port (
    p1  : in  std_logic; -- 1A
    p2  : in  std_logic; -- 1B
    p3  : in  std_logic; -- 2A
    p4  : in  std_logic; -- 2B
    p5  : in  std_logic; -- 2C
    p6  : out std_logic; -- 2Y
    p8  : out std_logic; -- 3Y
    p9  : in  std_logic; -- 3A
    p10 : in  std_logic; -- 3B
    p11 : in  std_logic; -- 3C
    p12 : out std_logic; -- 1Y
    p13 : in  std_logic  -- 1C
    );
end entity;

architecture dip of dip_74ls27 is
begin
  U1 : sn7427
    port map (
      g1a   => p1,
      g1b   => p2,
      g1c   => p13,
      g1y_n => p12,
      g2a   => p3,
      g2b   => p4,
      g2c   => p5,
      g2y_n => p6,
      g3a   => p9,
      g3b   => p10,
      g3c   => p11,
      g3y_n => p8
      );
end architecture;