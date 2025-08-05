-- dip_74s38.vhd -- 74S38 Quad 2-Input NAND Buffer

library ieee;
use ieee.std_logic_1164.all;

entity dip_74s38 is port (
  p1 : in std_logic;    -- 1A
  p2 : in std_logic;    -- 1B
  p3 : in std_logic;    -- 1Y
  p4 : in std_logic;    -- 2A
  p5 : in std_logic;    -- 2B
  p6 : in std_logic;    -- 2Y
  p7 : in std_logic;    -- GND
  p8 : in std_logic;    -- 3Y
  p9 : in std_logic;    -- 3B
  p10 : in std_logic;   -- 3A
  p11 : in std_logic;   -- 4Y
  p12 : in std_logic;   -- 4B
  p13 : in std_logic;   -- 4A
  p14 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74s38 is
begin
  -- TODO: Implement 74S38 functionality
end architecture;