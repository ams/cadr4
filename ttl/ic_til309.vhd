library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_til309 is
  port (
    l2      : out std_logic;
    l4      : out std_logic;
    l8      : out std_logic;
    l1      : out std_logic;
    latch   : in  std_logic;
    i4      : in  std_logic;
    i8      : in  std_logic;
    i2      : in  std_logic;
    blank_n : in  std_logic;
    dp      : in  std_logic;
    test_n  : in  std_logic;
    ldp     : in  std_logic;
    i1      : in  std_logic
    );
end ic_til309;

architecture ttl of ic_til309 is
begin

end ttl;
