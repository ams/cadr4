-- 13-Input Positive-NAND Gate
-- Datasheet: https://www.ti.com/lit/ds/symlink/sn74s133.pdf (PDIP (N) Package)
-- This component implements a 13-input NAND gate.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74133 is
  port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    d : in std_logic;
    e : in std_logic;
    f : in std_logic;
    g : in std_logic;
    h : in std_logic;
    i : in std_logic;
    j : in std_logic;
    k : in std_logic;
    l : in std_logic;
    m : in std_logic;

    q_n : out std_logic
    );
end;

architecture ttl of sn74133 is
begin

  q_n <= not (a and b and c and d and e and f and g and h and i and j and k and l and m);

end;
