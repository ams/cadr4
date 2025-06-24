library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s194 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_74s194 is
begin
  U1 : sn74s194
    port map (
      clr_n => p1,
      sir   => p2,
      i0    => p3,
      i1    => p4,
      i2    => p5,
      i3    => p6,
      sil   => p7,
      s0    => p9,
      s1    => p10,
      clk   => p11,
      q3    => p12,
      q2    => p13,
      q1    => p14,
      q0    => p15
      );
end architecture;
