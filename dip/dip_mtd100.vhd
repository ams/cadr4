library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.mtd100;

entity dip_mtd100 is port (
    p1 : in std_logic;
    p3 : in std_logic;
    p5 : in std_logic;
    p12 : out std_logic;
    p10 : out std_logic;
    p8 : out std_logic
  );
end entity;

architecture dip of dip_mtd100 is
begin
  U1 : mtd100
    port map (
      i0 => p1,
      i1 => p3,
      i2 => p5,
      o0 => p12,
      o1 => p10,
      o2 => p8
      );
end architecture;