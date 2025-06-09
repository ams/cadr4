library ieee;
use ieee.std_logic_1164.all;


entity dip_td25 is
  port (
    p1  : in  std_logic;  -- input
    p4  : out std_logic;  -- o_10ns
    p6  : out std_logic;  -- o_20ns
    p8  : out std_logic;  -- o_25ns
    p10 : out std_logic;  -- o_15ns
    p12 : out std_logic   -- o_5ns
    );
end entity;

architecture dip of dip_td25 is
begin
  U_td25 : entity work.td25
    port map (
      input  => p1,
      o_5ns  => p12,
      o_10ns => p4,
      o_15ns => p10,
      o_20ns => p6,
      o_25ns => p8
      );
end architecture; 