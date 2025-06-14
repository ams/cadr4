library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_td25 is
  port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
end entity;

architecture dip of dip_td25 is
begin
  U1 : td25
    port map (
      input  => p1,
      o_5ns  => p12,
      o_10ns => p4,
      o_15ns => p10,
      o_20ns => p6,
      o_25ns => p8
      );
end architecture;
