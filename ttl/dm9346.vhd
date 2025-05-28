-- High Speed 6-Bit Identify Comparator

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9346 is
  port (
    a0  : in  std_logic; -- Pin 1
    b0  : in  std_logic; -- Pin 2
    a1  : in  std_logic; -- Pin 3
    b1  : in  std_logic; -- Pin 4
    a2  : in  std_logic; -- Pin 5
    b2  : in  std_logic; -- Pin 6
    enb : in  std_logic; -- Pin 7
    eq  : out std_logic; -- Pin 9
    a3  : in  std_logic; -- Pin 10
    b3  : in  std_logic; -- Pin 11
    a4  : in  std_logic; -- Pin 12
    b4  : in  std_logic; -- Pin 13
    a5  : in  std_logic; -- Pin 14
    b5  : in  std_logic  -- Pin 15
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
