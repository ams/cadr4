library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s175 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_74s175 is
begin
  U1 : sn74s175
    port map (
      clr_n => p1,
      q0    => p2,
      q0_n  => p3,
      d0    => p4,
      d1    => p5,
      q1_n  => p6,
      q1    => p7,
      clk   => p9,
      q2    => p10,
      q2_n  => p11,
      d2    => p12,
      d3    => p13,
      q3_n  => p14,
      q3    => p15
      );
end architecture;
