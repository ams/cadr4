-- Twelve-Input Parity Checker/Generator
-- AMD Am93S48

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

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
end entity;

architecture functional of am93s48 is
  signal i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i, i8_i, i9_i, i10_i, i11_i : std_logic;
begin

  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  i5_i <= ttl_input(i5);
  i6_i <= ttl_input(i6);
  i7_i <= ttl_input(i7);
  i8_i <= ttl_input(i8);
  i9_i <= ttl_input(i9);
  i10_i <= ttl_input(i10);
  i11_i <= ttl_input(i11);

  po <= i0_i xor i1_i xor i2_i xor i3_i xor i4_i xor i5_i xor i6_i xor i7_i xor i8_i xor i9_i xor i10_i xor i11_i;
  pe <= not po;

end architecture;
