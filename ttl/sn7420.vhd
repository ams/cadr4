-- SN7420: Dual 4-Input Positive-NAND Gates
-- Datasheet: Texas Instruments SN74LS20 Dual 4-Input Positive-NAND Gates, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS20

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7420 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1c   : in  std_logic; -- Pin 4
    g1d   : in  std_logic; -- Pin 5
    g1y_n : out std_logic; -- Pin 6

    g2a   : in  std_logic; -- Pin 9
    g2b   : in  std_logic; -- Pin 10
    g2c   : in  std_logic; -- Pin 12
    g2d   : in  std_logic; -- Pin 13
    g2y_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7420 is
begin

  gate1: entity work.gate_nand4(behavioral) port map (a => g1a, b => g1b, c => g1c, d => g1d, q => g1y_n);
  gate2: entity work.gate_nand4(behavioral) port map (a => g2a, b => g2b, c => g2c, d => g2d, q => g2y_n);

end;
