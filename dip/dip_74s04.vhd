library ieee;
use ieee.std_logic_1164.all;


entity dip_74s04 is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : out std_logic;  -- g1q_n
    p3  : in  std_logic;  -- g2a
    p4  : out std_logic;  -- g2q_n
    p5  : in  std_logic;  -- g3a
    p6  : out std_logic;  -- g3q_n
    p8  : out std_logic;  -- g4q_n
    p9  : in  std_logic;  -- g4a
    p10 : out std_logic;  -- g5q_n
    p11 : in  std_logic;  -- g5a
    p12 : out std_logic;  -- g6q_n
    p13 : in  std_logic   -- g6a
    );
end entity;

architecture dip of dip_74s04 is
begin
  U_74s04 : entity work.sn7404
    port map (
      g1a   => p1,
      g1q_n => p2,
      g2a   => p3,
      g2q_n => p4,
      g3a   => p5,
      g3q_n => p6,
      g4a   => p9,
      g4q_n => p8,
      g5a   => p11,
      g5q_n => p10,
      g6a   => p13,
      g6q_n => p12
      );
end architecture; 