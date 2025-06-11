library ieee;
use ieee.std_logic_1164.all;


entity dip_93s46 is
  port (
    p1  : in  std_logic;  -- a0
    p2  : in  std_logic;  -- b0
    p3  : in  std_logic;  -- a1
    p4  : in  std_logic;  -- b1
    p5  : in  std_logic;  -- a2
    p6  : in  std_logic;  -- b2
    p7  : in  std_logic;  -- enb
    p9  : out std_logic;  -- eq
    p10 : in  std_logic;  -- a3
    p11 : in  std_logic;  -- b3
    p12 : in  std_logic;  -- a4
    p13 : in  std_logic;  -- b4
    p14 : in  std_logic;  -- a5
    p15 : in  std_logic   -- b5
    );
end entity;

architecture dip of dip_93s46 is
begin
  U_93s46 : entity work.dm9346
    port map (
      a0  => p1,
      b0  => p2,
      a1  => p3,
      b1  => p4,
      a2  => p5,
      b2  => p6,
      enb => p7,
      eq  => p9,
      a3  => p10,
      b3  => p11,
      a4  => p12,
      b4  => p13,
      a5  => p14,
      b5  => p15
      );
end architecture; 