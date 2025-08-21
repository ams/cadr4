library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74133;

entity dip_74s133 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s133 is
begin
  U1 : sn74133
    port map (
      a   => p7,
      b   => p6,
      c   => p5,
      d   => p4,
      e   => p3,
      f   => p2,
      g   => p1,
      h   => p10,
      i   => p11,
      j   => p12,
      k   => p13,
      l   => p14,
      m   => p15,
      q_n => p9
      );
end architecture;
