-- 13-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74133 is
  port (
    a, b, c, d, e, f, g, h, i, j, k, l, m : in std_logic;

    q_n : out std_logic
    );
end;

architecture ttl of sn74133 is
begin

  q_n <= not (a and b and c and d and e and f and g and h and i and j and k and l and m);

end;
