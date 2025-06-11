library ieee;
use ieee.std_logic_1164.all;


entity dip_74s74 is
  port (
    p1  : in  std_logic;  -- g1r_n
    p2  : in  std_logic;  -- g1d
    p3  : in  std_logic;  -- g1clk
    p4  : in  std_logic;  -- g1s_n
    p5  : out std_logic;  -- g1q
    p6  : out std_logic;  -- g1q_n
    p8  : out std_logic;  -- g2q_n
    p9  : out std_logic;  -- g2q
    p10 : in  std_logic;  -- g2s_n
    p11 : in  std_logic;  -- g2clk
    p12 : in  std_logic;  -- g2d
    p13 : in  std_logic   -- g2r_n
    );
end entity;

architecture dip of dip_74s74 is
begin
  U_74s74 : entity work.sn7474
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