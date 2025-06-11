library ieee;
use ieee.std_logic_1164.all;


entity dip_93425a is
  port (
    p1  : in  std_logic;  -- ce_n
    p2  : in  std_logic;  -- a0
    p3  : in  std_logic;  -- a1
    p4  : in  std_logic;  -- a2
    p5  : in  std_logic;  -- a3
    p6  : in  std_logic;  -- a4
    p7  : out std_logic;  -- do
    p9  : in  std_logic;  -- a5
    p10 : in  std_logic;  -- a6
    p11 : in  std_logic;  -- a7
    p12 : in  std_logic;  -- a8
    p13 : in  std_logic;  -- a9
    p14 : in  std_logic;  -- we_n
    p15 : in  std_logic   -- di
    );
end entity;

architecture dip of dip_93425a is
begin
  U_93425a : entity work.am93425a
    port map (
      ce_n => p1,
      a0   => p2,
      a1   => p3,
      a2   => p4,
      a3   => p5,
      a4   => p6,
      do   => p7,
      a5   => p9,
      a6   => p10,
      a7   => p11,
      a8   => p12,
      a9   => p13,
      we_n => p14,
      di   => p15
      );
end architecture; 