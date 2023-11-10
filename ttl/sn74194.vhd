-- 4-Bit Bidirectional Universal Shift Registers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74194 is
  port (
    clk : in std_logic;

    sil, sir : in std_logic;
    clr_n    : in std_logic;

    i0, i1, i2, i3 : in std_logic;
    s0, s1         : in std_logic;

    q0, q1, q2, q3 : out std_logic
    );
end;

architecture ttl of sn74194 is
begin

end;
