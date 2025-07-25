-- 4-2-3-2 Input AND-OR-INVERT Gate

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7464 is
  port (
    d4    : in  std_logic; -- Pin 1
    b2    : in  std_logic; -- Pin 2
    a2    : in  std_logic; -- Pin 3
    c3    : in  std_logic; -- Pin 4
    b3    : in  std_logic; -- Pin 5
    a3    : in  std_logic; -- Pin 9
    \out\ : out std_logic; -- Pin 8
    a1    : in  std_logic; -- Pin 10
    b1    : in  std_logic; -- Pin 11
    c4    : in  std_logic; -- Pin 12
    b4    : in  std_logic; -- Pin 13
    a4    : in  std_logic  -- Pin 14
    );
end;

architecture functional of sn7464 is
  signal d4_i, b2_i, a2_i, c3_i, b3_i, a3_i, a1_i, b1_i, c4_i, b4_i, a4_i : std_logic;
begin

  d4_i <= ttl_input(d4);
  b2_i <= ttl_input(b2);
  a2_i <= ttl_input(a2);
  c3_i <= ttl_input(c3);
  b3_i <= ttl_input(b3);
  a3_i <= ttl_input(a3);
  a1_i <= ttl_input(a1);
  b1_i <= ttl_input(b1);
  c4_i <= ttl_input(c4);
  b4_i <= ttl_input(b4);
  a4_i <= ttl_input(a4);

  -- 4-2-3-2 Input AND-OR-INVERT: ((a1 AND b1) OR (a2 AND b2) OR (a3 AND b3 AND c3) OR (a4 AND b4 AND c4 AND d4)) then invert
  \out\ <= not ((a1_i and b1_i) or (a2_i and b2_i) or (a3_i and b3_i and c3_i) or (a4_i and b4_i and c4_i and d4_i));

end;
