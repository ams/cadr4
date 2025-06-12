-- Datasheet: https://www.ti.com/lit/gpn/SN74LS08 (PDIP (N) Package)
-- SN7408: Quadruple 2-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7408 is
  port (
    g1a : in  std_logic; -- Pin 1
    g1b : in  std_logic; -- Pin 2
    g1q : out std_logic; -- Pin 3

    g2a : in  std_logic; -- Pin 4
    g2b : in  std_logic; -- Pin 5
    g2q : out std_logic; -- Pin 6

    g3a : in  std_logic; -- Pin 9
    g3b : in  std_logic; -- Pin 10
    g3q : out std_logic; -- Pin 8

    g4a : in  std_logic; -- Pin 12
    g4b : in  std_logic; -- Pin 13
    g4q : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7408 is
begin

  gate1: entity work.gate_and2(behavioral) port map (a => g1a, b => g1b, q => g1q);
  gate2: entity work.gate_and2(behavioral) port map (a => g2a, b => g2b, q => g2q);
  gate3: entity work.gate_and2(behavioral) port map (a => g3a, b => g3b, q => g3q);
  gate4: entity work.gate_and2(behavioral) port map (a => g4a, b => g4b, q => g4q);

end;
