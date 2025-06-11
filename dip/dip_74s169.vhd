library ieee;
use ieee.std_logic_1164.all;

use work.sn74;

entity dip_74s169 is
  port (
    p1  : in  std_logic;                -- up_dn
    p2  : in  std_logic;                -- clk
    p3  : in  std_logic;                -- i0
    p4  : in  std_logic;                -- i1
    p5  : in  std_logic;                -- i2
    p6  : in  std_logic;                -- i3
    p7  : in  std_logic;                -- enb_p_n
    p9  : in  std_logic;                -- load_n
    p10 : in  std_logic;                -- enb_t_n
    p11 : out std_logic;                -- o3
    p12 : out std_logic;                -- o2
    p13 : out std_logic;                -- o1
    p14 : out std_logic;                -- o0
    p15 : out std_logic                 -- co_n
    );
end entity;

architecture dip of dip_74s169 is
begin
  u_74s169 : entity work.sn74169
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