library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am93s48_tb is
end;

architecture testbench of am93s48_tb is

  signal po  : std_logic;
  signal pe  : std_logic;
  signal i11 : std_logic;
  signal i10 : std_logic;
  signal i9  : std_logic;
  signal i8  : std_logic;
  signal i7  : std_logic;
  signal i6  : std_logic;
  signal i5  : std_logic;
  signal i4  : std_logic;
  signal i3  : std_logic;
  signal i2  : std_logic;
  signal i1  : std_logic;
  signal i0  : std_logic;

begin

  uut : am93s48 port map(
    i0  => i0,
    i1  => i1,
    i2  => i2,
    i3  => i3,
    i4  => i4,
    i5  => i5,
    i6  => i6,
    i7  => i7,
    i8  => i8,
    i9  => i9,
    i10 => i10,
    i11 => i11,
    pe  => pe,
    po  => po
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
