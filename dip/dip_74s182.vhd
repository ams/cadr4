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
  U1 : sn74s182
    port map (
      xout    => p7,
      yout    => p10,
      x3      => p6,
      y3      => p5,

      cout2_n => p9,
      x2      => p15,
      y2      => p14,
    
      cout1_n => p11,
      x1      => p2,
      y1      => p1,
    
      cout0_n => p12,
      x0      => p4,
      y0      => p3,

      cin_n   => p13
      );
end architecture;
