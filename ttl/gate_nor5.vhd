-- Basic 5-input NOR gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_nor5 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    c : in  std_logic;
    d : in  std_logic;
    e : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_nor5 is
begin
  q <= '0' when (a = '1' or b = '1' or c = '1' or d = '1' or e = '1') else '1';
end; 