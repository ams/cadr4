-- Basic 2-input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_and2 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_and2 is
begin
  q <= '1' when (a = '1' and b = '1') else '0';
end; 