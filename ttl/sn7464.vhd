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
begin

  -- 4-2-3-2 Input AND-OR-INVERT: ((a1 AND b1) OR (a2 AND b2) OR (a3 AND b3 AND c3) OR (a4 AND b4 AND c4 AND d4)) then invert
  \out\ <= not ((a1 and b1) or (a2 and b2) or (a3 and b3 and c3) or (a4 and b4 and c4 and d4));

end;
