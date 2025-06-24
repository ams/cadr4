library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ecc.ttldm;

entity dip_td100 is
  port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
end entity;

architecture dip of dip_td100 is
begin
  U1 : ttldm
    generic map (single_tap_delay => 20 ns)
    port map (
      input => p1,
      tap1 => p12,
      tap2 => p4,
      tap3 => p10,
      tap4 => p6,
      output => p8
      );
end architecture;
