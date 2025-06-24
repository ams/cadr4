library ieee;
use ieee.std_logic_1164.all;

library work;
use work.intel.d2147;

entity dip_2147 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic
    );
end entity;

architecture dip of dip_2147 is
begin
  U1 : d2147
    port map (
      a0   => p1,
      a1   => p2,
      a2   => p3,
      a3   => p4,
      a4   => p5,
      a5   => p6,
      do   => p7,
      we_n => p8,
      ce_n => p10,
      di   => p11,
      a11  => p12,
      a10  => p13,
      a9   => p14,
      a8   => p15,
      a7   => p16,
      a6   => p17
      );
end architecture;
