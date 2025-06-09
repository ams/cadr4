library ieee;
use ieee.std_logic_1164.all;


entity dip_td100 is
  port (
    p1  : in  std_logic;  -- input
    p4  : out std_logic;  -- o_40ns
    p6  : out std_logic;  -- o_80ns
    p8  : out std_logic;  -- o_100ns
    p10 : out std_logic;  -- o_60ns
    p12 : out std_logic   -- o_20ns
    );
end entity;

architecture dip of dip_td100 is
begin
  U_td100 : entity work.td100
    port map (
      input   => p1,
      o_20ns  => p12,
      o_40ns  => p4,
      o_60ns  => p10,
      o_80ns  => p6,
      o_100ns => p8
      );
end architecture; 