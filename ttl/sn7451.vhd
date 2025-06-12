-- SN7451: Dual 2-Wide 2-Input AND-OR-INVERT Gates
-- Datasheet: Texas Instruments SN74LS51 Dual 2-Wide 2-Input AND-OR-INVERT Gates, PDIP Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74ls51.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7451 is
  port (
    g1a : in  std_logic; -- pin 1
    g1b : in  std_logic; -- pin 2
    g1c : in  std_logic; -- pin 9
    g1d : in  std_logic; -- pin 8
    g1y : out std_logic; -- pin 6

    g2a : in  std_logic; -- pin 10
    g2b : in  std_logic; -- pin 11
    g2c : in  std_logic; -- pin 3
    g2d : in  std_logic; -- pin 4
    g2y : out std_logic  -- pin 5
    );
end;

architecture ttl of sn7451 is
  signal g1_and1_out : std_logic;
  signal g1_and2_out : std_logic;
  signal g1_or_out   : std_logic;
  
  signal g2_and1_out : std_logic;
  signal g2_and2_out : std_logic;
  signal g2_or_out   : std_logic;
begin

  -- Gate 1: (g1a AND g1b) OR (g1c AND g1d) then invert
  g1_and1: entity work.gate_and2(behavioral) port map (a => g1a, b => g1b, q => g1_and1_out);
  g1_and2: entity work.gate_and2(behavioral) port map (a => g1c, b => g1d, q => g1_and2_out);
  g1_or:   entity work.gate_or2(behavioral) port map (a => g1_and1_out, b => g1_and2_out, q => g1_or_out);
  g1y <= not g1_or_out;

  -- Gate 2: (g2a AND g2b) OR (g2c AND g2d) then invert
  g2_and1: entity work.gate_and2(behavioral) port map (a => g2a, b => g2b, q => g2_and1_out);
  g2_and2: entity work.gate_and2(behavioral) port map (a => g2c, b => g2d, q => g2_and2_out);
  g2_or:   entity work.gate_or2(behavioral) port map (a => g2_and1_out, b => g2_and2_out, q => g2_or_out);
  g2y <= not g2_or_out;

end;
