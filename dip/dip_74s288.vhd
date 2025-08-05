library ieee;
use ieee.std_logic_1164.all;

entity dip_74s288 is port (
  p1  : in  std_logic;                  -- a0
  p2  : in  std_logic;                  -- a1  
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- a3
  p5  : out std_logic;                  -- d0
  p6  : out std_logic;                  -- d1
  p7  : out std_logic;                  -- d2
  p8  : in  std_logic;                  -- vcc
  p9  : in  std_logic;                  -- gnd
  p10 : out std_logic;                  -- d3
  p11 : out std_logic;                  -- d4
  p12 : out std_logic;                  -- d5
  p13 : out std_logic;                  -- d6
  p14 : out std_logic;                  -- d7
  p15 : in  std_logic                   -- a4
  );
end entity;

architecture empty of dip_74s288 is
begin
end architecture;