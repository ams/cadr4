-- Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    i1, i2, i3, i4, i5 : in  std_logic;
    o1                 : out std_logic
    );
end sn74260;

architecture ttl of sn74260 is
begin

  o1 <= not (i1 or i2 or i3 or i4 or i5);

end ttl;
