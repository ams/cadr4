-- 4-wide 2-input AND-OR-INVERT gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm942 is
  port (
    g1a1 : in  std_logic; -- Pin 1
    g1b1 : in  std_logic; -- Pin 2
    g2a1 : in  std_logic; -- Pin 3
    g2b1 : in  std_logic; -- Pin 4
    g2c1 : in  std_logic; -- Pin 5
    g2d1 : in  std_logic; -- Pin 6
    out1 : out std_logic; -- Pin 8
    g1a2 : in  std_logic; -- Pin 9
    g1b2 : in  std_logic; -- Pin 10
    g2a2 : in  std_logic; -- Pin 11
    g2b2 : in  std_logic; -- Pin 12
    g2c2 : in  std_logic; -- Pin 13
    g2d2 : in  std_logic; -- Pin 14
    out2 : out std_logic  -- Pin 15
    );
end dm942;

architecture ttl of dm942 is
  signal gate1_and1_out : std_logic; -- (g1a1 AND g1b1)
  signal gate1_and2_out : std_logic; -- (g2a1 AND g2b1 AND g2c1 AND g2d1)
  
  signal gate2_and1_out : std_logic; -- (g1a2 AND g1b2)
  signal gate2_and2_out : std_logic; -- (g2a2 AND g2b2 AND g2c2 AND g2d2)
begin

  -- Gate 1: (g1a1 AND g1b1) OR (g2a1 AND g2b1 AND g2c1 AND g2d1)
  gate1_and1: entity work.gate_and2(behavioral) port map (a => g1a1, b => g1b1, q => gate1_and1_out);
  gate1_and2: entity work.gate_and4(behavioral) port map (a => g2a1, b => g2b1, c => g2c1, d => g2d1, q => gate1_and2_out);
  gate1_or:   entity work.gate_or2(behavioral) port map (a => gate1_and1_out, b => gate1_and2_out, q => out1);

  -- Gate 2: (g1a2 AND g1b2) OR (g2a2 AND g2b2 AND g2c2 AND g2d2)
  gate2_and1: entity work.gate_and2(behavioral) port map (a => g1a2, b => g1b2, q => gate2_and1_out);
  gate2_and2: entity work.gate_and4(behavioral) port map (a => g2a2, b => g2b2, c => g2c2, d => g2d2, q => gate2_and2_out);
  gate2_or:   entity work.gate_or2(behavioral) port map (a => gate2_and1_out, b => gate2_and2_out, q => out2);

end;
