-- 256 Bit Bipolar Read Only Memory

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity im5600 is
  port (
    ce_n                           : in  std_logic
    a0, a1, a2, a3, a4             : in  std_logic;
    o0, o1, o2, o3, o4, o5, o6, o7 : out std_logic;
    );
end im5600;

architecture ttl of im5600 is
begin

end ttl;
