-- 4-2-3-2 Input AND-OR-INVERT Gate
-- This component implements a 4-2-3-2 input AND-OR-INVERT gate.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7464 is
  port (
    a1 : in std_logic; -- Pin 9
    b1 : in std_logic; -- Pin 10

    a2 : in std_logic; -- Pin 2
    b2 : in std_logic; -- Pin 3

    a3 : in std_logic; -- Pin 4
    b3 : in std_logic; -- Pin 5
    c3 : in std_logic; -- Pin 6

    a4 : in std_logic; -- Pin 1
    b4 : in std_logic; -- Pin 11
    c4 : in std_logic; -- Pin 12
    d4 : in std_logic; -- Pin 13

    \out\ : out std_logic -- Pin 8
    );
end;

architecture ttl of sn7464 is
begin

  \out\ <= not ((a1 and b1) or (a2 and b2) or (a3 and b3 and c3) or (a4 and b4 and c4 and d4));

end;
