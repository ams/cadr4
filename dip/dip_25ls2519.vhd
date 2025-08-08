library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am25ls2519;

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
  U1 : am25ls2519
    port map (
      -- w section
      oe_w_n => p7,
      pol    => p18,
      w0     => p2,
      w1     => p5,
      w2     => p12,
      w3     => p15,
      -- data inputs
      d0     => p1,
      d1     => p4,
      d2     => p13,
      d3     => p16,
      -- y section
      oe_y_n => p8,
      y0     => p3,
      y1     => p6,
      y2     => p11,
      y3     => p14,
      -- control section
      cp     => p9,
      e_n    => p17,
      clr_n  => p19
      );
end architecture;
