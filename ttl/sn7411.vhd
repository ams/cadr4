-- Triple 3-Input Positive-AND Gates
-- Datasheet: https://www.ti.com/lit/gpn/SN74LS11 (PDIP (N) Package)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7411 is
  port (
    g1a : in  std_logic; -- Pin 1
    g1b : in  std_logic; -- Pin 2
    g1c : in  std_logic; -- Pin 13
    g1y : out std_logic; -- Pin 12

    g2a : in  std_logic; -- Pin 3
    g2b : in  std_logic; -- Pin 4
    g2c : in  std_logic; -- Pin 5
    g2y : out std_logic; -- Pin 6

    g3a : in  std_logic; -- Pin 9
    g3b : in  std_logic; -- Pin 10
    g3c : in  std_logic; -- Pin 11
    g3y : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7411 is
begin

  gate1: entity work.gate_and3(behavioral) port map (a => g1a, b => g1b, c => g1c, q => g1y);
  gate2: entity work.gate_and3(behavioral) port map (a => g2a, b => g2b, c => g2c, q => g2y);
  gate3: entity work.gate_and3(behavioral) port map (a => g3a, b => g3b, c => g3c, q => g3y);

end;
