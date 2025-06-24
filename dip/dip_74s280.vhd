library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s280 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s280 is
begin
  U1 : sn74s280
    port map (
      i0   => p1,
      i1   => p2,
      i2   => p4,
      even => p5,
      odd  => p6,
      i3   => p8,
      i4   => p9,
      i5   => p10,
      i6   => p11,
      i7   => p12,
      i8   => p13
      );
end architecture;
