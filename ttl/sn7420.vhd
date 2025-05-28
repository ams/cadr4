-- SN7420: Dual 4-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7420 is
  port (
    g1a : in  std_logic; -- pin 1
    g1b : in  std_logic; -- pin 2
    g1c : in  std_logic; -- pin 4
    g1d : in  std_logic; -- pin 5
    g1y_n : out std_logic; -- pin 6

    g2a : in  std_logic; -- pin 9
    g2b : in  std_logic; -- pin 10
    g2c : in  std_logic; -- pin 12
    g2d : in  std_logic; -- pin 13
    g2y_n : out std_logic  -- pin 8
    );
end;

architecture ttl of sn7420 is
begin

  g1y_n <= not (g1a and g1b and g1c and g1d);
  g2y_n <= not (g2a and g2b and g2c and g2d);

end;
