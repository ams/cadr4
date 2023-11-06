-- 4-2-3-2 input AND-OR-INVERT gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7464 is
  port (
    a1 : in std_logic;
    b1 : in std_logic;

    a2 : in std_logic;
    b2 : in std_logic;

    a3 : in std_logic;
    b3 : in std_logic;
    c3 : in std_logic;

    a4 : in std_logic;
    b4 : in std_logic;
    c4 : in std_logic;
    d4 : in std_logic;

    \out\ : out std_logic
    );
end;

architecture ttl of sn7464 is
begin

  \out\ <= not ((a1 and b2)
                or (a2 and b2)
                or (a3 and b3 and b4)
                or (a4 and b4 and c4 and d4));

end;
