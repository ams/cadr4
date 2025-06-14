library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_25ls2519 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : in  std_logic
    );
end entity;

architecture dip of dip_25ls2519 is
begin
  U1 : am252519
    port map (
      d0     => p1,
      w0     => p2,
      y0     => p3,
      d1     => p4,
      w1     => p5,
      y1     => p6,
      oe_w_n => p7,
      oe_y_n => p8,
      cp     => p9,
      w2     => p11,
      y2     => p12,
      d2     => p13,
      w3     => p14,
      y3     => p15,
      d3     => p16,
      e_n    => p17,
      pol    => p18,
      clr_n  => p19
      );
end architecture;
