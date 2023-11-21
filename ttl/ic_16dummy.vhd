library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_16dummy is
  port (
    hi1            : out std_logic;
    hi2            : out std_logic;
    \-boot1\       : out std_logic;
    \-boot2\       : out std_logic;
    \-power_reset\ : out std_logic
    );
end;

architecture ttl of ic_16dummy is
begin

  hi1 <= '1';
  hi2 <= '1';

  \-boot1\ <= not '1';
  \-boot2\ <= not '1';

  \-power_reset\ <= not '1';

end ttl;
