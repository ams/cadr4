library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.dummy_type_a;

entity dip_dummy is
  port (
    p12 : out std_logic;
    p13 : inout std_logic;
    p14 : inout std_logic;
    p15 : inout std_logic;
    p16 : inout std_logic
    );
end entity;

architecture dip of dip_dummy is
begin
  U1 : dummy_type_a
    port map (
      \-power reset\ => p12,
      \-boot2\ => p13,
      \-boot1\ => p14,
      hi2 => p15,
      hi1 => p16
      );
end architecture;
