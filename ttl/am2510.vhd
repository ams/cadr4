-- Four-Bit Shifter With Three-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2510 is
  port (
    i3, i2, i1, i0, i_1, i_2, i_3 : in  std_logic;
    sel1, sel0                    : in  std_logic;
    ce_n                          : in  std_logic;
    o0, o1, o2, o3                : out std_logic
    );
end am2510;

architecture ttl of am2510 is
begin

end ttl;
