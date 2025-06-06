-- High Speed 6-Bit Identify Comparator
-- Datasheet for DM9346 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9346 is
  port (
    a0  : in  std_logic;
    b0  : in  std_logic;
    a1  : in  std_logic;
    b1  : in  std_logic;
    a2  : in  std_logic;
    b2  : in  std_logic;
    enb : in  std_logic;
    eq  : out std_logic;
    a3  : in  std_logic;
    b3  : in  std_logic;
    a4  : in  std_logic;
    b4  : in  std_logic;
    a5  : in  std_logic;
    b5  : in  std_logic
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
