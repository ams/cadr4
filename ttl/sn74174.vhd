-- Hex/Quadruple D-Type Flip-Flops With Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74174 is
  port (
    clk   : in std_logic;
    clr_n : in std_logic;

    d1, d2, d3, d4, d5, d6 : in  std_logic;
    q1, q2, q3, q4, q5, q6 : out std_logic
    );
end;

architecture ttl of sn74174 is
begin

end;
