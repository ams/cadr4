library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_16dummy is
  port (
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot1\       : out std_logic; -- 14
    \-boot2\       : out std_logic; -- 13
    \-power_reset\ : out std_logic  -- 12
    );
end;

architecture ttl of ic_16dummy is
begin
  hi1 <= '1';
  hi2 <= '1';
  \-boot1\ <= '0';
  \-boot2\ <= '0';
  -- there are two inverters on the schematic
  -- there may need to be a delay here
  \-power_reset\ <= '0';
end;
