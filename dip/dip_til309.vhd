library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_til309 is
  port (
    p1  : out std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic
    );
end entity;

architecture dip of dip_til309 is
begin
  U1 : til309
    port map (
      i1      => p17,
      i2      => p12,
      i4      => p6,
      i8      => p7,
      dp      => p14,
      latch   => p5,
      blank_n => p13,
      ldp     => p16,
      test_n  => p15,
      l1      => p4,
      l2      => p1,
      l4      => p2,
      l8      => p3
      );
end architecture;
