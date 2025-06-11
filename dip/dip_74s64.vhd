library ieee;
use ieee.std_logic_1164.all;


entity dip_74s64 is
  port (
    p1  : in  std_logic;  -- d4
    p2  : in  std_logic;  -- b2
    p3  : in  std_logic;  -- a2
    p4  : in  std_logic;  -- c3
    p5  : in  std_logic;  -- b3
    p6  : in  std_logic;  -- a3
    p8  : out std_logic;  -- \out\
    p9  : in  std_logic;  -- a1
    p10 : in  std_logic;  -- b1
    p11 : in  std_logic;  -- c4
    p12 : in  std_logic;  -- b4
    p13 : in  std_logic   -- a4
    );
end entity;

architecture dip of dip_74s64 is
begin
  U_74s64 : entity work.sn7464
    port map (
      a1 => p9,
      b1 => p10,
      a2 => p3,
      b2 => p2,
      a3 => p6,
      b3 => p5,
      c3 => p4,
      a4 => p13,
      b4 => p12,
      c4 => p11,
      d4 => p1,
      \out\ => p8
      );
end architecture; 