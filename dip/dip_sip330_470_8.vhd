library ieee;
use ieee.std_logic_1164.all;


entity dip_sip330_470_8 is
  port (
    p2 : in std_logic;  -- r2
    p3 : in std_logic;  -- r3
    p4 : in std_logic;  -- r4
    p5 : in std_logic;  -- r5
    p6 : in std_logic;  -- r6
    p7 : in std_logic   -- r7
    );
end entity;

architecture dip of dip_sip330_470_8 is
begin
  U_sip330_470_8 : entity work.sip330_470_8
    port map (
      r2 => p2,
      r3 => p3,
      r4 => p4,
      r5 => p5,
      r6 => p6,
      r7 => p7
      );
end architecture; 