library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_sip220_330_8 is
  port (
    p2 : inout std_logic;
    p3 : inout std_logic;
    p4 : inout std_logic;
    p5 : inout std_logic;
    p6 : inout std_logic;
    p7 : inout std_logic
    );
end entity;

architecture dip of dip_sip220_330_8 is
begin
  U1 : sip220_330_8
    port map (
      r2 => p2,
      r3 => p3,
      r4 => p4,
      r5 => p5,
      r6 => p6,
      r7 => p7
      );
end architecture;
