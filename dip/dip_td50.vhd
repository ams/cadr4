library ieee;
use ieee.std_logic_1164.all;


entity dip_td50 is
  port (
    p1  : in  std_logic;  -- input
    p4  : out std_logic;  -- o_20ns
    p6  : out std_logic;  -- o_40ns
    p8  : out std_logic;  -- o_50ns
    p10 : out std_logic;  -- o_30ns
    p12 : out std_logic   -- o_10ns
    );
end entity;

architecture dip of dip_td50 is
begin
  U_td50 : entity work.td50
    port map (
      input  => p1,
      o_10ns => p12,
      o_20ns => p4,
      o_30ns => p10,
      o_40ns => p6,
      o_50ns => p8
      );
end architecture; 