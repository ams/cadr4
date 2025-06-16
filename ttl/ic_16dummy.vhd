library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_16dummy is
  port (
    \-boot2\       : out std_logic; -- 13
    \-power reset\ : out std_logic  -- 12
    );
end;

architecture ttl of ic_16dummy is
begin
  \-boot2\ <= '1';
  \-power reset\ <= '0', '1' after 20 ns; -- short delay then go high
end;
