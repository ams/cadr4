library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s283 is
  port (
    p1  : out std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : out std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s283 is
begin
  U1 : sn74s283
    port map (
      co => p9,  
      a3 => p12,
      a2 => p14,
      a1 => p3,
      a0 => p5,
      s3 => p10,
      s2 => p13,
      s1 => p1,
      s0 => p4,
      b3 => p11,
      b2 => p15,
      b1 => p2,
      b0 => p6,
      ci => p7
      );
end architecture;
