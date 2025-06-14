library ieee;
use ieee.std_logic_1164.all;

entity dip_93s46 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_93s46 is
begin
  U1 : dm9346
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
