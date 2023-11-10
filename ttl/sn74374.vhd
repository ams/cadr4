-- Octal D-Type Transparent Latches And Edge-Triggered Flip-Flops

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74374 is
  port (
    clk                            : in  std_logic;
    oenb_n                         : in  std_logic;
    i0, i1, i2, i3, i4, i5, i6, i7 : in  std_logic;
    o0, o1, o2, o3, o4, o5, o6, o7 : out std_logic
    );
end;

architecture ttl of sn74374 is
begin

end;
