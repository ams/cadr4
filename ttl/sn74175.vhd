-- Hex/Quadruple D-Type Flip-Flops With Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74175 is
  port (
    clk   : in std_logic
    clr_n : in std_logic;

    d0       : in  std_logic;
    q0, q0_n : out std_logic;

    d1       : in  std_logic;
    q1, q1_n : out std_logic;

    d2       : in  std_logic;
    q2, q2_n : out std_logic;

    d3       : in  std_logic;
    q3, q3_n : out std_logic;
    );
end;

architecture ttl of sn74175 is
begin

end;
