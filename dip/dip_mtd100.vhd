-- dip_mtd100.vhd -- MTD100 Monostable Multivibrator

library ieee;
use ieee.std_logic_1164.all;

entity dip_mtd100 is port (
  p1 : in std_logic;    -- A1
  p2 : in std_logic;    -- GND
  p3 : in std_logic;    -- A2
  p4 : in std_logic;    -- NC
  p5 : in std_logic;    -- B1
  p6 : in std_logic;    -- NC
  p7 : in std_logic;    -- VCC
  p8 : in std_logic;    -- Q1
  p9 : in std_logic;    -- NC
  p10 : in std_logic;   -- Q2
  p11 : in std_logic;   -- NC
  p12 : in std_logic    -- B2
  );
end entity;

architecture dip of dip_mtd100 is
begin
  -- TODO: Implement MTD100 functionality
end architecture;