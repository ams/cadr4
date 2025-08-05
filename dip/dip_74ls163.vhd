-- dip_74ls163.vhd -- 74LS163 4-Bit Synchronous Binary Counter

library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls163 is port (
  p1 : in std_logic;    -- CLR
  p2 : in std_logic;    -- CLK
  p3 : in std_logic;    -- A
  p4 : in std_logic;    -- B
  p5 : in std_logic;    -- C
  p6 : in std_logic;    -- D
  p7 : in std_logic;    -- ENP
  p8 : in std_logic;    -- GND
  p9 : in std_logic;    -- LOAD
  p10 : in std_logic;   -- ENT
  p11 : in std_logic;   -- QD
  p12 : in std_logic;   -- QC
  p13 : in std_logic;   -- QB
  p14 : in std_logic;   -- QA
  p15 : in std_logic;   -- RCO
  p16 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74ls163 is
begin
  -- TODO: Implement 74LS163 functionality
end architecture;