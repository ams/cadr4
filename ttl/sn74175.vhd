-- Hex/Quadruple D-Type Flip-Flops With Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74175 is
  port (
    d0   : in  std_logic;
    q0   : out std_logic;
    q0_n : out std_logic;

    d1   : in  std_logic;
    q1   : out std_logic;
    q1_n : out std_logic;

    d2   : in  std_logic;
    q2   : out std_logic;
    q2_n : out std_logic;

    d3   : in  std_logic;
    q3   : out std_logic;
    q3_n : out std_logic;

    clr_n : in std_logic;
    clk   : in std_logic
    );
end;

architecture ttl of sn74175 is
begin

end;
