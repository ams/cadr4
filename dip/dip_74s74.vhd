library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s74 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s74 is
begin
  U1 : sn74s74
    port map (
      g1r_n => p1,
      g1d   => p2,
      g1clk => p3,
      g1s_n => p4,
      g1q   => p5,
      g1q_n => p6,
      g2q_n => p8,
      g2q   => p9,
      g2s_n => p10,
      g2clk => p11,
      g2d   => p12,
      g2r_n => p13
      );
end architecture;
