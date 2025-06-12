-- SN7486: Quadruple 2-input Exclusive-OR Gates
-- Datasheet: Texas Instruments SN74LS86A, SN74S86 (N Package / PDIP) - https://www.ti.com/lit/gpn/SN54S86

library ieee;
use ieee.std_logic_1164.all;

entity sn7486 is
  port (
    g1a : in  std_logic; -- Pin 1
    g1b : in  std_logic; -- Pin 2
    g1y : out std_logic; -- Pin 3

    g2a : in  std_logic; -- Pin 4
    g2b : in  std_logic; -- Pin 5
    g2y : out std_logic; -- Pin 6

    g3a : in  std_logic; -- Pin 9
    g3b : in  std_logic; -- Pin 10
    g3y : out std_logic; -- Pin 8

    g4a : in  std_logic; -- Pin 12
    g4b : in  std_logic; -- Pin 13
    g4y : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7486 is
begin

  gate1: entity work.gate_xor2(behavioral) port map (a => g1a, b => g1b, q => g1y);
  gate2: entity work.gate_xor2(behavioral) port map (a => g2a, b => g2b, q => g2y);
  gate3: entity work.gate_xor2(behavioral) port map (a => g3a, b => g3b, q => g3y);
  gate4: entity work.gate_xor2(behavioral) port map (a => g4a, b => g4b, q => g4y);

end;
