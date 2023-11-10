-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    c0             : in std_logic
    a0, a1, a2, a3 : in std_logic;
    b0, b1, b2, b3 : in std_logic;

    s0, s1, s2, s3 : out std_logic;
    c4             : out std_logic;
    );
end;

architecture ttl of sn74283 is
begin

end;
