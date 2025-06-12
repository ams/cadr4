-- Basic 2-input XOR gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_xor2 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_xor2 is
begin
  -- Proper 4-state logic for XOR gate
  q <= '1' when (a = '1' and b = '0') or (a = '0' and b = '1') else
       '0' when (a = '1' and b = '1') or (a = '0' and b = '0') else
       'X';  -- Unknown when inputs are X, U, Z, W, or other non-binary values
end; 