-- Basic 4-input OR gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_or4 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    c : in  std_logic;
    d : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_or4 is
begin
  q <= '1' when (a = '1' or b = '1' or c = '1' or d = '1') else '0';
end; 