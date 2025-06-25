library ieee;
use ieee.std_logic_1164.all;

library work;
use work.signetics.n82s21;

entity dip_82s21 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_82s21 is
begin
  U1 : n82s21
    port map (
      i1     => p14,
      we1_n  => p15,
      d1     => p9,

      i0     => p3,
      we0_n  => p2,
      d0     => p7,

      a0     => p13,
      a1     => p12,
      a2     => p11,
      a3     => p10,
      a4     => p4,

      latch_n=> p6,
      wclk_n => p1,           
      ce     => p5
      
      );
end architecture;
