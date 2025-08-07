library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74273;

entity dip_74ls273 is 
  port (
    p3 : in std_logic; -- d0
    p4 : in std_logic; -- d1
    p7 : in std_logic; -- d2
    p8 : in std_logic; -- d3
    p13 : in std_logic; -- d4
    p14 : in std_logic; -- d5
    p17 : in std_logic; -- d6
    p18 : in std_logic; -- d7

    p2 : out std_logic; -- q0
    p5 : out std_logic; -- q1
    p6 : out std_logic; -- q2
    p9 : out std_logic; -- q3
    p12 : out std_logic; -- q4
    p15 : out std_logic; -- q5
    p16 : out std_logic; -- q6
    p19 : out std_logic; -- q7

    p11 : in  std_logic; -- clk
    p1 : in  std_logic -- clr_n
  );
end entity;

architecture dip of dip_74ls273 is
begin
  U1 : sn74273
    port map (
      clr_n => p1,
      clk   => p11,
      d0    => p3,
      d1    => p4,
      d2    => p7,
      d3    => p8,
      d4    => p13,
      d5    => p14,
      d6    => p17,
      d7    => p18,
      q0    => p2,
      q1    => p5,
      q2    => p6,
      q3    => p9,
      q4    => p12,
      q5    => p15,
      q6    => p16,
      q7    => p19
      );
end architecture;