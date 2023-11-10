-- Dual 4-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7420 is
  port (
    g1a, g1b, g1c, g1d : in  std_logic;
    g1y_n              : out std_logic;

    g2a, g2b, g2c, g2d : in  std_logic;
    g2y_n              : out std_logic
    );
end;

architecture ttl of sn7420 is
begin

  g1y_n <= g1a nand g1b nand g1c nand g1d;
  g2y_n <= g2a nand g2b nand g2c nand g2d;

end;
