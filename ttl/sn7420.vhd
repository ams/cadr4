-- SN7420: Dual 4-Input Positive-NAND Gates
-- Datasheet: Texas Instruments SN74LS20 Dual 4-Input Positive-NAND Gates, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS20

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7420 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g1c   : in  std_logic;
    g1d   : in  std_logic;
    g1y_n : out std_logic;

    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2c   : in  std_logic;
    g2d   : in  std_logic;
    g2y_n : out std_logic
    );
end;

architecture ttl of sn7420 is
begin

  g1y_n <= not (g1a and g1b and g1c and g1d);
  g2y_n <= not (g2a and g2b and g2c and g2d);

end;
