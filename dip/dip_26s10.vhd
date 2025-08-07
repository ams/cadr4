-- dip_26s10.vhd -- 26S10 Quad Bus Driver

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am26s10;

entity dip_26s10 is 
  port (
    p2  : inout std_logic; -- B0_n
    p3  : out   std_logic; -- Z0
    p4  : in    std_logic; -- I0
    p5  : in    std_logic; -- I1
    p6  : out   std_logic; -- Z1
    p7  : inout std_logic; -- B1_n
    p9  : inout std_logic; -- B2_n
    p10 : out   std_logic; -- Z2
    p11 : in    std_logic; -- I2
    p12 : in    std_logic; -- E_n
    p13 : in    std_logic; -- I3
    p14 : out   std_logic; -- Z3
    p15 : inout std_logic  -- B3_n
  );
end entity;

architecture dip of dip_26s10 is
begin
  
  u1: am26s10 port map (
    e_n => p12,
    i0  => p4,
    i1  => p5,
    i2  => p11,
    i3  => p13,
    b0  => p2,
    b1  => p7,
    b2  => p9,
    b3  => p15,
    z0  => p3,
    z1  => p6,
    z2  => p10,
    z3  => p14
    );
  
end architecture;