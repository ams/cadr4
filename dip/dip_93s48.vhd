library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_93s48 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_93s48 is
begin
  U1 : am93s48
    port map (
      i0  => p7,
      i1  => p6,
      i2  => p5,
      i3  => p4,
      i4  => p3,
      i5  => p2,
      i6  => p1,
      i7  => p15,
      i8  => p14,
      i9  => p13,
      i10 => p12,
      i11 => p11,
      pe  => p10,
      po  => p9
      );
end architecture;
