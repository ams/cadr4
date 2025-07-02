library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am25s07;

entity dip_25s07 is
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

architecture dip of dip_25s07 is
begin
  U1 : am25s07
    port map (
      i0    => p3,
      i1    => p4,
      i2    => p6,
      i3    => p11,
      i4    => p13,
      i5    => p14,

      d0    => p2,
      d1    => p5,
      d2    => p7,
      d3    => p10,
      d4    => p12,
      d5    => p15,

      clk   => p9,
      enb_n => p1
      );
end architecture;
