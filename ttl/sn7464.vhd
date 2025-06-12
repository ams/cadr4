-- 4-2-3-2 Input AND-OR-INVERT Gate
-- This component implements a 4-2-3-2 input AND-OR-INVERT gate.
-- Datasheet: Texas Instruments SN74S64, SN74S65 4-2-3-2 Input AND-OR-INVERT Gates, PDIP (N) Package
-- URL: https://arwill.hu/forras/termek/felvezetok/ic-k/74-75/sn74s64n-integralt-aramkor-298292.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7464 is
  port (
    a1 : in std_logic; -- Pin 2 (E)
    b1 : in std_logic; -- Pin 3 (F)

    a2 : in std_logic; -- Pin 9 (J)
    b2 : in std_logic; -- Pin 10 (K)

    a3 : in std_logic; -- Pin 4 (G)
    b3 : in std_logic; -- Pin 5 (H)
    c3 : in std_logic; -- Pin 6 (I)

    a4 : in std_logic; -- Pin 1 (A)
    b4 : in std_logic; -- Pin 11 (B)
    c4 : in std_logic; -- Pin 12 (C)
    d4 : in std_logic; -- Pin 13 (D)

    \out\ : out std_logic -- Pin 8 (Y)
    );
end;

architecture ttl of sn7464 is
  signal and1_out : std_logic; -- (a1 AND b1)
  signal and2_out : std_logic; -- (a2 AND b2)
  signal and3_out : std_logic; -- (a3 AND b3 AND c3)
  signal and4_out : std_logic; -- (a4 AND b4 AND c4 AND d4)
  signal or_out   : std_logic; -- OR of all AND outputs
begin

  -- 2-input AND: (a1 AND b1)
  and1: entity work.gate_and2(behavioral) port map (a => a1, b => b1, q => and1_out);
  
  -- 2-input AND: (a2 AND b2)
  and2: entity work.gate_and2(behavioral) port map (a => a2, b => b2, q => and2_out);
  
  -- 3-input AND: (a3 AND b3 AND c3)
  and3: entity work.gate_and3(behavioral) port map (a => a3, b => b3, c => c3, q => and3_out);
  
  -- 4-input AND: (a4 AND b4 AND c4 AND d4)
  and4: entity work.gate_and4(behavioral) port map (a => a4, b => b4, c => c4, d => d4, q => and4_out);
  
  -- 4-input OR: OR all AND outputs
  or_gate: entity work.gate_or4(behavioral) port map (a => and1_out, b => and2_out, c => and3_out, d => and4_out, q => or_out);
  
  -- Final inversion
  \out\ <= not or_out;

end;
