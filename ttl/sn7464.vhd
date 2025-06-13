-- 4-2-3-2 Input AND-OR-INVERT Gate
-- This component implements a 4-2-3-2 input AND-OR-INVERT gate.
-- Datasheet: Texas Instruments SN74S64, SN74S65 4-2-3-2 Input AND-OR-INVERT Gates, PDIP (N) Package
-- URL: https://arwill.hu/forras/termek/felvezetok/ic-k/74-75/sn74s64n-integralt-aramkor-298292.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7464 is
  port (
    d4    : in  std_logic := 'H'; -- Pin 1
    b2    : in  std_logic := 'H'; -- Pin 2
    a2    : in  std_logic := 'H'; -- Pin 3
    c3    : in  std_logic := 'H'; -- Pin 4
    b3    : in  std_logic := 'H'; -- Pin 5
    a3    : in  std_logic := 'H'; -- Pin 9
    \out\ : out std_logic; -- Pin 8
    a1    : in  std_logic := 'H'; -- Pin 10
    b1    : in  std_logic := 'H'; -- Pin 11
    c4    : in  std_logic := 'H'; -- Pin 12
    b4    : in  std_logic := 'H'; -- Pin 13
    a4    : in  std_logic := 'H'  -- Pin 14
    );
end;

architecture ttl of sn7464 is
begin

  -- 4-2-3-2 Input AND-OR-INVERT: ((a1 AND b1) OR (a2 AND b2) OR (a3 AND b3 AND c3) OR (a4 AND b4 AND c4 AND d4)) then invert
  \out\ <= not ((a1 and b1) or (a2 and b2) or (a3 and b3 and c3) or (a4 and b4 and c4 and d4));

end;
