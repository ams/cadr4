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
  q <= '1' when (a = '1' and b = '1' and c = '1') else '0';
end; 