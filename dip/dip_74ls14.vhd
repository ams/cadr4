library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls14 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74ls14 is
begin
  U1 : sn7414
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
