library ieee;
use ieee.std_logic_1164.all;


entity dip_til309 is
  port (
    p1  : out std_logic;  -- l2
    p2  : out std_logic;  -- l4
    p3  : out std_logic;  -- l8
    p4  : out std_logic;  -- l1
    p5  : in std_logic;   -- latch
    p6  : in std_logic;   -- i4
    p7  : in std_logic;   -- i8
    p12 : in std_logic;   -- i2
    p13 : in std_logic;   -- blank_n
    p14 : in std_logic;   -- dp
    p15 : in std_logic;   -- test_n
    p16 : in std_logic;   -- ldp
    p17 : in std_logic    -- i1
    );
end entity;

architecture dip of dip_til309 is
begin
  U_til309 : entity work.til309
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
