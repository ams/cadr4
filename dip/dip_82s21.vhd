library ieee;
use ieee.std_logic_1164.all;


entity dip_82s21 is
  port (
    p1  : in  std_logic;  -- wclk_n
    p2  : in  std_logic;  -- we0_n
    p3  : in  std_logic;  -- i0
    p4  : in  std_logic;  -- a4
    p5  : in  std_logic;  -- ce
    p6  : in  std_logic;  -- strobe
    p7  : out std_logic;  -- d0
    p9  : out std_logic;  -- d1
    p10 : in  std_logic;  -- a3
    p11 : in  std_logic;  -- a2
    p12 : in  std_logic;  -- a1
    p13 : in  std_logic;  -- a0
    p14 : in  std_logic;  -- i1
    p15 : in  std_logic   -- we1_n
    );
end entity;

architecture dip of dip_82s21 is
begin
  U_82s21 : entity work.dm8221
    port map (
      wclk_n => p1,
      we0_n  => p2,
      i0     => p3,
      a4     => p4,
      ce     => p5,
      strobe => p6,
      d0     => p7,
      d1     => p9,
      a3     => p10,
      a2     => p11,
      a1     => p12,
      a0     => p13,
      i1     => p14,
      we1_n  => p15
      );
end architecture; 