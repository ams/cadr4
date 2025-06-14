-- High Speed 6-Bit Identify Comparator
-- Datasheet for DM9346 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9346 is
  port (
    a0  : in  std_logic := 'H';
    b0  : in  std_logic := 'H';
    a1  : in  std_logic := 'H';
    b1  : in  std_logic := 'H';
    a2  : in  std_logic := 'H';
    b2  : in  std_logic := 'H';
    enb : in  std_logic := 'H';
    eq  : out std_logic;
    a3  : in  std_logic := 'H';
    b3  : in  std_logic := 'H';
    a4  : in  std_logic := 'H';
    b4  : in  std_logic := 'H';
    a5  : in  std_logic := 'H';
    b5  : in  std_logic := 'H'
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
