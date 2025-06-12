-- Basic 13-input NAND gate

library ieee;
use ieee.std_logic_1164.all;

entity gate_nand13 is
  port (
    a : in  std_logic;
    b : in  std_logic;
    c : in  std_logic;
    d : in  std_logic;
    e : in  std_logic;
    f : in  std_logic;
    g : in  std_logic;
    h : in  std_logic;
    i : in  std_logic;
    j : in  std_logic;
    k : in  std_logic;
    l : in  std_logic;
    m : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of gate_nand13 is
begin
  -- Proper 4-state logic for NAND gate
  q <= '0' when (a = '1' and b = '1' and c = '1' and d = '1' and e = '1' and f = '1' and g = '1' and h = '1' and i = '1' and j = '1' and k = '1' and l = '1' and m = '1') else
       '1' when (a = '0' or b = '0' or c = '0' or d = '0' or e = '0' or f = '0' or g = '0' or h = '0' or i = '0' or j = '0' or k = '0' or l = '0' or m = '0') else
       'X';  -- Unknown when inputs are X, U, Z, W, or other non-binary values
end; 