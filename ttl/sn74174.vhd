-- Hex/Quadruple D-Type Flip-Flops With Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74174 is
  port (
    clr_n : in  std_logic;
    q1    : out std_logic;
    d1    : in  std_logic;
    d2    : in  std_logic;
    q2    : out std_logic;
    d3    : in  std_logic;
    q3    : out std_logic;
    clk   : in  std_logic;
    q4    : out std_logic;
    d4    : in  std_logic;
    q5    : out std_logic;
    d5    : in  std_logic;
    d6    : in  std_logic;
    q6    : out std_logic
    );
end;

architecture ttl of sn74174 is
begin

end;
