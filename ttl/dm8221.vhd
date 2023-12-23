-- High Speed Write-While-Read 64-Bit Bipolar RAM (32x2 RAM)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm8221 is
  port (
    a0, a1, a2, a3, a4 : in  std_logic;
    ce                 : in  std_logic;
    d0, d1             : out std_logic;
    i0, i1             : in  std_logic;
    strobe             : in  std_logic;
    wclk_n             : in  std_logic;
    we0_n, we1_n       : in  std_logic
    );
end dm8221;

architecture ttl of dm8221 is
begin

end;
