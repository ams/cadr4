-- 13-Input Positive-NAND Gate

library ieee;
use ieee.std_logic_1164.all;

entity sn74133 is
  port (
    a   : in  std_logic := 'H'; -- Pin 1
    b   : in  std_logic := 'H'; -- Pin 2
    c   : in  std_logic := 'H'; -- Pin 3
    d   : in  std_logic := 'H'; -- Pin 4
    e   : in  std_logic := 'H'; -- Pin 5
    f   : in  std_logic := 'H'; -- Pin 6
    h   : in  std_logic := 'H'; -- Pin 10
    i   : in  std_logic := 'H'; -- Pin 11
    j   : in  std_logic := 'H'; -- Pin 12
    k   : in  std_logic := 'H'; -- Pin 13
    l   : in  std_logic := 'H'; -- Pin 14
    m   : in  std_logic := 'H'; -- Pin 15
    g   : in  std_logic := 'H'; -- Pin 9
    q_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn74133 is
begin

  q_n <= not (a and b and c and d and e and f and g and h and i and j and k and l and m);

end;
