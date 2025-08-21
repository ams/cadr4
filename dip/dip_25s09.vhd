library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am25s09;

entity dip_25s09 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic
    );
end entity;

architecture behavioral of dip_25s09 is
begin
  U1 : am25s09
    port map(
      sel => p1,
      aq  => p2,
      a0  => p3,
      a1  => p4,
      b1  => p5,
      b0  => p6,
      bq  => p7,
      clk => p9,
      cq  => p10,
      c0  => p11,
      c1  => p12,
      d1  => p13,
      d0  => p14,
      dq  => p15
      );
end architecture;
