-- 4-2-3-2 Input AND-OR-INVERT Gate
-- This component implements a 4-2-3-2 input AND-OR-INVERT gate.
-- Datasheet: Texas Instruments SN74S64, SN74S65 4-2-3-2 Input AND-OR-INVERT Gates, PDIP (N) Package
-- URL: https://arwill.hu/forras/termek/felvezetok/ic-k/74-75/sn74s64n-integralt-aramkor-298292.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7464 is
  port (
    g1a   : in  std_logic := 'H'; -- Pin 1
    g1b   : in  std_logic := 'H'; -- Pin 2
    g1c   : in  std_logic := 'H'; -- Pin 3
    g1d   : in  std_logic := 'H'; -- Pin 4
    g1e   : in  std_logic := 'H'; -- Pin 5
    g1f   : in  std_logic := 'H'; -- Pin 9
    g1g   : in  std_logic := 'H'; -- Pin 10
    g1h   : in  std_logic := 'H'; -- Pin 11
    g1i   : in  std_logic := 'H'; -- Pin 12
    g1j   : in  std_logic := 'H'; -- Pin 13
    g1y_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7464 is
begin

  -- 4-2-3-2 Input AND-OR-INVERT: ((a1 AND b1) OR (a2 AND b2) OR (a3 AND b3 AND c3) OR (a4 AND b4 AND c4 AND d4)) then invert
  g1y_n <= not ((g1a and g1b) or (g1f and g1g) or (g1c and g1g and g1h) or (g1j and g1g and g1i and g1j));

end;
