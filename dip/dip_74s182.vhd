library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s182 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s182 is
begin
  U1 : sn74182
    port map (
      y1      => p1,
      x1      => p2,
      y0      => p3,
      x0      => p4,
      y3      => p5,
      x3      => p6,
      xout    => p7,
      cout2_n => p9,
      yout    => p10,
      cout1_n => p11,
      cout0_n => p12,
      cin_n   => p13,
      y2      => p14,
      x2      => p15
      );
end architecture;
