library ieee;
use ieee.std_logic_1164.all;

package unsorted is

  component ic_16dummy port(
    vcc            : in  std_logic; -- 1,2,3,4,5
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot1\       : out std_logic; -- 14
    \-boot2\       : out std_logic; -- 13
    p12            : out std_logic  -- 12
    ); end component;

end;
