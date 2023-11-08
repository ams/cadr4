-- High Speed 6-Bit Identify Comparator

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9346 is
  port (
    enb                    : in  std_logic;
    a0, a1, a2, a3, a4, a5 : in  std_logic;
    b0, b1, b2, b3, b4, b5 : in  std_logic;
    eq                     : out std_logic
    );
end dm9346;

architecture ttl of dm9346 is
begin

  eq <= enb
        and (a0 xnor b0)
        and (a1 xnor b1)
        and (a2 xnor b2)
        and (a3 xnor b3)
        and (a4 xnor b4)
        and (a5 xnor b5);

end ttl;
