-- 4096 X 1 Static RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2147 is
  port (
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 : in  std_logic;
    ce_n                                             : in  std_logic;
    di                                               : in  std_logic;
    we_n                                             : in  std_logic;
    do                                               : out std_logic
    );
end am2147;

architecture ttl of am2147 is
begin

end ttl;
