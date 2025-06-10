library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity dip_16dummy is
  port (
    p1 :  in  std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : out std_logic
    );
end entity;

architecture dip of dip_16dummy is
begin
  U1 : entity work.ic_16dummy
    port map (
      vcc => p1,
      p12 => p12,
      \-boot2\       => p13,
      \-boot1\       => p14,
      hi2            => p15,
      hi1            => p16
    );
end architecture;