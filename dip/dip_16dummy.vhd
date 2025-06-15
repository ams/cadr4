library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_16dummy is
  port (
    p12 : out std_logic;
    p13 : inout std_logic;
    p15 : inout std_logic;
    p16 : inout std_logic
    );
end entity;

architecture dip of dip_16dummy is
begin
  U1 : ic_16dummy
    port map (
      \-power reset\ => p12,
      \-boot2\ => p13,
      hi2      => p15,
      hi1      => p16
      );
end architecture;
