-- (512x8) 4096-Bit TTL PROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm74472 is
  port (
    a0, a1, a2, a3, a4, a5, a6, a7, a8 : in  std_logic;
    d0, d1, d2, d3, d4, d5, d6, d7     : out std_logic;
    ce_n                               : in  std_logic
    );
end;

architecture ttl of dm74472 is
begin

end;
