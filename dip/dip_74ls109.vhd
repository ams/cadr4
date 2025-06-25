library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74ls109 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end dip_74ls109;

architecture dip of dip_74ls109 is
begin
  U1 : sn74ls109
    port map (
      clr1_n => p1,
      j1     => p2,
      k1_n   => p3,
      clk1   => p4,
      pre1_n => p5,
      q1     => p6,
      q1_n   => p7,
      q2_n   => p9,
      q2     => p10,
      pre2_n => p11,
      clk2   => p12,
      k2_n   => p13,
      j2     => p14,
      clr2_n => p15
      );
end architecture;
