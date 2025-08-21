library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74169;

entity dip_74s169 is
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
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_74s169 is
begin
  U1 : sn74169
    port map (
      up_dn   => p1,
      clk     => p2,
      i0      => p3,
      i1      => p4,
      i2      => p5,
      i3      => p6,
      enb_p_n => p7,
      load_n  => p9,
      enb_t_n => p10,
      o3      => p11,
      o2      => p12,
      o1      => p13,
      o0      => p14,
      co_n    => p15
      );
end architecture;
