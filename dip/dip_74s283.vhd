library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_74s283 is
  port (
    p1  : out std_logic;                -- s1
    p2  : in  std_logic;                -- b1
    p3  : in  std_logic;                -- a1
    p4  : out std_logic;                -- s0
    p5  : in  std_logic;                -- a0
    p6  : in  std_logic;                -- b0
    p7  : in  std_logic;                -- c0
    p9  : out std_logic;                -- c4
    p10 : out std_logic;                -- s3
    p11 : in  std_logic;                -- b3
    p12 : in  std_logic;                -- a3
    p13 : out std_logic;                -- s2
    p14 : in  std_logic;                -- a2
    p15 : in  std_logic                 -- b2
    );
end entity;

architecture dip of dip_74s283 is
begin
  U1 : entity work.sn74283
    port map (
      s1  => p1,
      b1  => p2,
      a1  => p3,
      s0  => p4,
      a0  => p5,
      b0  => p6,
      c0  => p7,
      c4  => p9,
      s3  => p10,
      b3  => p11,
      a3  => p12,
      s2  => p13,
      a2  => p14,
      b2  => p15
      );
end architecture; 