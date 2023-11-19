library ieee;
use ieee.std_logic_1164.all;

package cadr4 is

  component cpu
    port (
      \-boot1\       : in std_logic;
      \-boot2\       : in std_logic;
      \-power_reset\ : in std_logic);
  end component;

end;

package body cadr4 is

end;
