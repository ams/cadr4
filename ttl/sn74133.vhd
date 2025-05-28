-- 13-Input Positive-NAND Gate
-- This component implements a 13-input NAND gate.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74133 is
  port (
    a : in std_logic; -- Pin 1
    b : in std_logic; -- Pin 2
    c : in std_logic; -- Pin 3
    d : in std_logic; -- Pin 4
    e : in std_logic; -- Pin 5
    f : in std_logic; -- Pin 6
    g : in std_logic; -- Pin 7
    h : in std_logic; -- Pin 10
    i : in std_logic; -- Pin 11
    j : in std_logic; -- Pin 12
    k : in std_logic; -- Pin 13
    l : in std_logic; -- Pin 14
    m : in std_logic; -- Pin 15

    q_n : out std_logic -- Pin 9
    );
end;

architecture ttl of sn74133 is
begin

  q_n <= not (a and b and c and d and e and f and g and h and i and j and k and l and m);

end;
