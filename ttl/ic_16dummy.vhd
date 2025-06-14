library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_16dummy is
  port (
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot2\       : out std_logic; -- 13
    \-power reset\ : out std_logic  -- 12
    );
end;

architecture ttl of ic_16dummy is
begin
  hi1 <= '1';
  hi2 <= '1';
  \-boot2\ <= '1';
  \-power reset\ <= '0', '1' after 20 ns; -- short delay then go high
end;
