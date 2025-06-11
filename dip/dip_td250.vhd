library ieee;
use ieee.std_logic_1164.all;


entity dip_td250 is
  port (
    p1  : in  std_logic;  -- input
    p4  : out std_logic;  -- o_100ns
    p6  : out std_logic;  -- o_200ns
    p8  : out std_logic;  -- o_250ns
    p10 : out std_logic;  -- o_150ns
    p12 : out std_logic   -- o_50ns
    );
end entity;

architecture dip of dip_td250 is
begin
  U_td250 : entity work.td250
    port map (
      input   => p1,
      o_50ns  => p12,
      o_100ns => p4,
      o_150ns => p10,
      o_200ns => p6,
      o_250ns => p8
      );
end architecture; 