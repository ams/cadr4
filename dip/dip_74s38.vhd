library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn7438;

entity dip_74s38 is
  port (
    p1  : in  std_logic;  -- 1A
    p2  : in  std_logic;  -- 1B
    p3  : out std_logic;  -- 1Y
    p4  : in  std_logic;  -- 2A
    p5  : in  std_logic;  -- 2B
    p6  : out std_logic;  -- 2Y
    p8  : out std_logic;  -- 3Y
    p9  : in  std_logic;  -- 3B
    p10 : in  std_logic;  -- 3A
    p11 : out std_logic;  -- 4Y
    p12 : in  std_logic;  -- 4B
    p13 : in  std_logic  -- 4A
  );
end entity;

architecture dip of dip_74s38 is
begin
  U1 : sn7438
    port map (
      g1a   => p1,
      g1b   => p2,
      g1q_n => p3,
      g2a   => p4,
      g2b   => p5,
      g2q_n => p6,
      g3a   => p10,
      g3b   => p9,
      g3q_n => p8,
      g4a   => p13,
      g4b   => p12,
      g4q_n => p11
      );
end architecture;