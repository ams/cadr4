library ieee;
use ieee.std_logic_1164.all;

library work;
use work.fairchild.dm93425a;

entity dip_93425a is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_93425a is
begin
  U1 : dm93425a
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
