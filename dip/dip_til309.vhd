library ieee;
use ieee.std_logic_1164.all;


entity dip_til309 is
  port (
    p1  : in std_logic;  -- l2
    p2  : in std_logic;  -- l4
    p3  : in std_logic;  -- l8
    p4  : in std_logic;  -- l1
    p5  : in std_logic;  -- latch
    p6  : in std_logic;  -- i4
    p7  : in std_logic;  -- i8
    p10 : in std_logic;  -- i2
    p11 : in std_logic;  -- blank_n
    p12 : in std_logic;  -- dp
    p13 : in std_logic;  -- test_n
    p14 : in std_logic;  -- ldp
    p15 : in std_logic   -- i1
    );
end entity;

architecture dip of dip_til309 is
begin
  U_til309 : entity work.til309
    port map (
      i1      => p15,
      i2      => p10,
      i4      => p6,
      i8      => p7,
      dp      => p12,
      latch   => p5,
      blank_n => p11,
      ldp     => p14,
      test_n  => p13,
      l1      => p4,
      l2      => p1,
      l4      => p2,
      l8      => p3
      );
end architecture; 