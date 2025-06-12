-- Basic 3-input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_and3 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    c : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_and3 is
begin
  -- Proper 4-state logic for AND gate
  q <= '1' when (a = '1' and b = '1' and c = '1') else
       '0' when (a = '0' or b = '0' or c = '0') else
       'X';  -- Unknown when inputs are X, U, Z, W, or other non-binary values
end; 