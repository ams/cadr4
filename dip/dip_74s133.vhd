library ieee;
use ieee.std_logic_1164.all;


entity dip_74s133 is
  port (
    p1  : in  std_logic;  -- g
    p2  : in  std_logic;  -- f
    p3  : in  std_logic;  -- e
    p4  : in  std_logic;  -- d
    p5  : in  std_logic;  -- c
    p6  : in  std_logic;  -- b
    p7  : in  std_logic;  -- a
    p9  : out std_logic;  -- q_n
    p10 : in  std_logic;  -- h
    p11 : in  std_logic;  -- i
    p12 : in  std_logic;  -- j
    p13 : in  std_logic;  -- k
    p14 : in  std_logic;  -- l
    p15 : in  std_logic   -- m
    );
end entity;

architecture dip of dip_74s133 is
begin
  U_74s133 : entity work.sn74133
    port map (
      a   => p7,
      b   => p6,
      c   => p5,
      d   => p4,
      e   => p3,
      f   => p2,
      g   => p1,
      h   => p10,
      i   => p11,
      j   => p12,
      k   => p13,
      l   => p14,
      m   => p15,
      q_n => p9
      );
end architecture; 