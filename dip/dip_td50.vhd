library ieee;
use ieee.std_logic_1164.all;

entity dip_td50 is
  port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
end entity;

architecture dip of dip_td50 is
begin
  U1 : td50
    port map (
      input  => p1,
      o_10ns => p12,
      o_20ns => p4,
      o_30ns => p10,
      o_40ns => p6,
      o_50ns => p8
      );
end architecture;
