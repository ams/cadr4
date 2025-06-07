library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.unsorted.all;

entity dip_16dummy is
  port (
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : out std_logic
    );
end entity;

architecture dip of dip_16dummy is
begin

  U_ic_16dummy : ic_16dummy
    port map (
      \-power_reset\ => p12,
      \-boot2\       => p13,
      \-boot1\       => p14,
      hi2            => p15,
      hi1            => p16
    );

end architecture; 