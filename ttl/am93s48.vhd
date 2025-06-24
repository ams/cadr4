-- Twelve-Input Parity Checker/Generator
-- AMD Am93S48
-- doc/ttl/am93s48.pdf

library ieee;
use ieee.std_logic_1164.all;

entity am93s48 is
  port (
    i0  : in  std_logic := 'H'; -- Pin 11
    i1  : in  std_logic := 'H'; -- Pin 12
    i2  : in  std_logic := 'H'; -- Pin 13
    i3  : in  std_logic := 'H'; -- Pin 14
    i4  : in  std_logic := 'H'; -- Pin 15
    i5  : in  std_logic := 'H'; -- Pin 1
    i6  : in  std_logic := 'H'; -- Pin 2
    i7  : in  std_logic := 'H'; -- Pin 3
    i8  : in  std_logic := 'H'; -- Pin 4
    i9  : in  std_logic := 'H'; -- Pin 5
    i10 : in  std_logic := 'H'; -- Pin 6
    i11 : in  std_logic := 'H'; -- Pin 7
    pe  : out std_logic; -- Pin 10
    po  : out std_logic  -- Pin 9
    );
end;

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
