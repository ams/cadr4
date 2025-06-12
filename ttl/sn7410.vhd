-- Tripple 3-Input Positive-NAND Gates
-- Datasheet: https://www.ti.com/lit/gpn/SN54LS10-SP (PDIP (N) Package)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7410 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1c   : in  std_logic; -- Pin 13
    g1y_n : out std_logic; -- Pin 12

    g2a   : in  std_logic; -- Pin 3
    g2b   : in  std_logic; -- Pin 4
    g2c   : in  std_logic; -- Pin 5
    g2y_n : out std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 9
    g3b   : in  std_logic; -- Pin 10
    g3c   : in  std_logic; -- Pin 11
    g3y_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7410 is
begin

  gate1: entity work.gate_nand3(behavioral) port map (a => g1a, b => g1b, c => g1c, q => g1y_n);
  gate2: entity work.gate_nand3(behavioral) port map (a => g2a, b => g2b, c => g2c, q => g2y_n);
  gate3: entity work.gate_nand3(behavioral) port map (a => g3a, b => g3b, c => g3c, q => g3y_n);

end;
