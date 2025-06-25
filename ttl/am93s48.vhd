-- Twelve-Input Parity Checker/Generator
-- AMD Am93S48
-- doc/ttl/am93s48.pdf

library ieee;
use ieee.std_logic_1164.all;

entity am93s48 is
  port (
    i0  : in  std_logic; -- Pin 11
    i1  : in  std_logic; -- Pin 12
    i2  : in  std_logic; -- Pin 13
    i3  : in  std_logic; -- Pin 14
    i4  : in  std_logic; -- Pin 15
    i5  : in  std_logic; -- Pin 1
    i6  : in  std_logic; -- Pin 2
    i7  : in  std_logic; -- Pin 3
    i8  : in  std_logic; -- Pin 4
    i9  : in  std_logic; -- Pin 5
    i10 : in  std_logic; -- Pin 6
    i11 : in  std_logic; -- Pin 7
    pe  : out std_logic; -- Pin 10
    po  : out std_logic  -- Pin 9
    );
end;

architecture ttl of am93s48 is
  signal i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i, i8_i, i9_i, i10_i, i11_i : std_logic;
begin

  i0_i <= 'H';
  i1_i <= 'H';
  i2_i <= 'H';
  i3_i <= 'H';
  i4_i <= 'H';
  i5_i <= 'H';
  i6_i <= 'H';
  i7_i <= 'H';
  i8_i <= 'H';
  i9_i <= 'H';
  i10_i <= 'H';
  i11_i <= 'H';

  i0_i <= i0;
  i1_i <= i1;
  i2_i <= i2;
  i3_i <= i3;
  i4_i <= i4;
  i5_i <= i5;
  i6_i <= i6;
  i7_i <= i7;
  i8_i <= i8;
  i9_i <= i9;
  i10_i <= i10;
  i11_i <= i11;

  process(all)
    variable parity : std_logic;
  begin
    parity := i0_i xor i1_i xor i2_i xor i3_i xor i4_i xor i5_i xor i6_i xor i7_i xor i8_i xor i9_i xor i10_i xor i11_i;
    pe     <= not parity;
    po     <= parity;
  end process;
end;
