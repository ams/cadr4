library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74112;

entity dip_74ls112 is
  port (
    p1 : in std_logic;    -- 1CLK
    p2 : in std_logic;    -- 1K
    p3 : in std_logic;    -- 1J
    p4 : in std_logic;    -- 1PRE_n
    p5 : out std_logic;    -- 1Q
    p6 : out std_logic;    -- 1Q_n
    p7 : out std_logic;    -- 2Q_n
    p9 : out std_logic;    -- 2Q
    p10 : in std_logic;   -- 2PRE_n
    p11 : in std_logic;   -- 2J
    p12 : in std_logic;   -- 2K
    p13 : in std_logic;   -- 2CLK
    p14 : in std_logic;   -- 2CLR_n
    p15 : in std_logic    -- 1CLR_n
  );
end entity;

architecture dip of dip_74ls112 is
begin
  U1 : sn74112
    port map (
      clk1   => p1,
      k1     => p2,  
      j1     => p3,
      pre1_n => p4,
      q1     => p5,
      q1_n   => p6,
      q2_n   => p7,
      q2     => p9,
      pre2_n => p10,
      j2     => p11,
      k2     => p12,
      clk2   => p13,
      clr2_n => p14,
      clr1_n => p15
      );
end architecture;