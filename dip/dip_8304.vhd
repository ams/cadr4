library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am8304;

entity dip_8304 is 
  port (
    p1  : inout std_logic; -- A0
    p2  : inout std_logic; -- A1
    p3  : inout std_logic; -- A2
    p4  : inout std_logic; -- A3
    p5  : inout std_logic; -- A4
    p6  : inout std_logic; -- A5
    p7  : inout std_logic; -- A6
    p8  : inout std_logic; -- A7
    p9  : in    std_logic; -- chip_disable
    p11 : in    std_logic; -- transmit
    p12 : inout std_logic; -- B7
    p13 : inout std_logic; -- B6
    p14 : inout std_logic; -- B5
    p15 : inout std_logic; -- B4
    p16 : inout std_logic; -- B3
    p17 : inout std_logic; -- B2
    p18 : inout std_logic; -- B1
    p19 : inout std_logic  -- B0
  );
end entity;

architecture dip of dip_8304 is
begin
  
  u1: am8304 port map (
    a0           => p1,
    a1           => p2,
    a2           => p3,
    a3           => p4,
    a4           => p5,
    a5           => p6,
    a6           => p7,
    a7           => p8,
    b0           => p19,
    b1           => p18,
    b2           => p17,
    b3           => p16,
    b4           => p15,
    b5           => p14,
    b6           => p13,
    b7           => p12,
    chip_disable => p9,
    transmit     => p11
    );
  
end architecture;