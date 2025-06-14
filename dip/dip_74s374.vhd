library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s374 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : out std_logic
    );
end entity;

architecture dip of dip_74s374 is
begin
  U1 : sn74374
    port map (
      oenb_n => p1,
      o0     => p2,
      i0     => p3,
      i1     => p4,
      o1     => p5,
      o2     => p6,
      i2     => p7,
      i3     => p8,
      o3     => p9,
      clk    => p11,
      o4     => p12,
      i4     => p13,
      i5     => p14,
      o5     => p15,
      o6     => p16,
      i6     => p17,
      i7     => p18,
      o7     => p19
      );
end architecture;
