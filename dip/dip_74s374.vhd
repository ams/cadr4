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
  U1 : sn74s374
    port map (
      i7     => p3,
      i6     => p4,
      i5     => p7,
      i4     => p8,
      i3     => p13,
      i2     => p14,
      i1     => p17,
      i0     => p18,

      o7     => p2,
      o6     => p5,
      o5     => p6,
      o4     => p9,
      o3     => p12,
      o2     => p15,
      o1     => p16,
      o0     => p19,

      clk    => p11,
      oenb_n => p1
      
      );
end architecture;
