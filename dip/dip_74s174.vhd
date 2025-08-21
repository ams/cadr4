library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74174;

entity dip_74s174 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_74s174 is
begin
  U1 : sn74174
    port map (
      clr_n => p1,
      q1    => p2,
      d1    => p3,
      d2    => p4,
      q2    => p5,
      d3    => p6,
      q3    => p7,
      clk   => p9,
      q4    => p10,
      d4    => p11,
      q5    => p12,
      d5    => p13,
      d6    => p14,
      q6    => p15
      );
end architecture;
