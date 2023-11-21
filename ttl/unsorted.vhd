library ieee;
use ieee.std_logic_1164.all;

package unsorted is

  component ic_16dummy port(
    hi1            : out std_logic;
    hi2            : out std_logic;
    \-boot1\       : out std_logic;
    \-boot2\       : out std_logic;
    \-power_reset\ : out std_logic
    ); end component;

end;

package body unsorted is

end;
