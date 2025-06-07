library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

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

  U_am252519 : am252519
    port map (
      i0         => p1,
      q0a        => p2,
      q0b        => p3,
      i1         => p4,
      q1a        => p5,
      q1b        => p6,
      o_enb_n    => p7,
      out_enb_n  => p8,
      clk        => p9,
      q2b        => p11,
      q2a        => p12,
      i2         => p13,
      q3b        => p14,
      q3a        => p15,
      i3         => p16,
      clk_enb_n  => p17,
      inv        => p18,
      asyn_clr_n => p19
    );

end architecture; 