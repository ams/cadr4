library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74258;

entity dip_74s258 is
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

architecture dip of dip_74s258 is
begin
  U1 : sn74258
    port map (
      sel   => p1,
      d0    => p2,
      d1    => p3,
      dy    => p4,
      c0    => p5,
      c1    => p6,
      cy    => p7,
      by    => p9,
      b1    => p10,
      b0    => p11,
      ay    => p12,
      a1    => p13,
      a0    => p14,
      enb_n => p15
      );
end architecture;
