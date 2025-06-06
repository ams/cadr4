-- 12-input parity checker/generator

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93s48 is
  port (
    i0  : in  std_logic;
    i1  : in  std_logic;
    i2  : in  std_logic;
    i3  : in  std_logic;
    i4  : in  std_logic;
    i5  : in  std_logic;
    i6  : in  std_logic;
    i7  : in  std_logic;
    i8  : in  std_logic;
    i9  : in  std_logic;
    i10 : in  std_logic;
    i11 : in  std_logic;
    pe  : out std_logic;
    po  : out std_logic
    );
end;

-- ChatGPT Codex implementation
architecture ttl of am93s48 is
begin
  process(all)
    variable parity : std_logic;
  begin
    parity := i0 xor i1 xor i2 xor i3 xor i4 xor i5 xor i6 xor i7 xor i8 xor i9 xor i10 xor i11;
    pe     <= not parity;
    po     <= parity;
  end process;
end;
