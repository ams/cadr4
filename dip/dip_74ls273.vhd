library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls273 is port (
  p1  : in  std_logic;                  -- clr (clear)
  p2  : out std_logic;                  -- q0
  p3  : in  std_logic;                  -- d0
  p4  : in  std_logic;                  -- d1
  p5  : out std_logic;                  -- q1
  p6  : out std_logic;                  -- q2
  p7  : in  std_logic;                  -- d2
  p8  : in  std_logic;                  -- gnd
  p9  : out std_logic;                  -- q3
  p10 : in  std_logic;                  -- vcc
  p11 : in  std_logic;                  -- clk
  p12 : out std_logic;                  -- q4
  p13 : in  std_logic;                  -- d3
  p14 : in  std_logic;                  -- d4
  p15 : out std_logic;                  -- q5
  p16 : out std_logic;                  -- q6
  p17 : in  std_logic;                  -- d5
  p18 : in  std_logic;                  -- d6
  p19 : out std_logic;                  -- q7
  p20 : in  std_logic                   -- d7
  );
end entity;

architecture empty of dip_74ls273 is
begin
end architecture;