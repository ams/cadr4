-- Basic 2-input OR gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_or2 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_or2 is
begin
  q <= '1' when (a = '1' or b = '1') else '0';
end; 