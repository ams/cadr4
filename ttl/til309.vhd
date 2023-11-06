library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity til309 is
  port (
    i1, i2, i4, i8 : in  std_logic;
    dp             : in  std_logic;
    latch          : in  std_logic;
    blank_n        : in  std_logic;
    ldp            : in  std_logic;
    test_n         : in  std_logic;
    l1, l2, l4, l8 : out std_logic
    );
end;

architecture ttl of til309 is
begin

end;
