-- 12-input parity checker/generator

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93s48 is
  port (
    i0  : in  std_logic; -- Pin 7
    i1  : in  std_logic; -- Pin 6
    i2  : in  std_logic; -- Pin 5
    i3  : in  std_logic; -- Pin 4
    i4  : in  std_logic; -- Pin 3
    i5  : in  std_logic; -- Pin 2
    i6  : in  std_logic; -- Pin 1
    i7  : in  std_logic; -- Pin 15
    i8  : in  std_logic; -- Pin 14
    i9  : in  std_logic; -- Pin 13
    i10 : in  std_logic; -- Pin 12
    i11 : in  std_logic; -- Pin 11
    pe  : out std_logic; -- Pin 10
    po  : out std_logic  -- Pin 9
    );
end;

-- ChatGPT Codex implementation
architecture ttl of am93s48 is
begin
  process(all)
    variable parity : std_logic;
  begin
    parity := i0 xor i1 xor i2 xor i3 xor i4 xor i5 xor i6 xor i7 xor i8 xor i9 xor i10 xor i11;
    pe <= not parity;
    po <= parity;
  end process;
end;
