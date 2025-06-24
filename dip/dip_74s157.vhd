library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s157 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s157 is
begin
  U1 : sn74s157
    port map (
      sel   => p1,
      a1    => p14,
      b1    => p13,
      y1    => p12,
      a2    => p11,
      b2    => p10,
      y2    => p9,
      a3    => p5,
      b3    => p6,
      y3    => p7,
      a4    => p2,
      b4    => p3,
      y4    => p4,
      enb_n => p15
      );
end architecture;
