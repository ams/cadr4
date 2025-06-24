library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dummy_type_A is
  port (
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot1\       : out std_logic; -- 14
    \-boot2\       : out std_logic; -- 13
    \-power reset\ : out std_logic  -- 12
    );
end;

architecture ttl of dummy_type_A is
begin
  hi1 <= 'H';
  hi2 <= 'H';
  \-boot1\ <= 'H';
  \-boot2\ <= 'H';
  \-power reset\ <= '0', '1' after 20 ns; -- short delay then go high
end;
