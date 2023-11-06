library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity res20_tb is
end;

architecture testbench of res20_tb is

  signal r19 : std_logic;
  signal r18 : std_logic;
  signal r17 : std_logic;
  signal r16 : std_logic;
  signal r15 : std_logic;
  signal r14 : std_logic;
  signal r13 : std_logic;
  signal r12 : std_logic;
  signal r11 : std_logic;
  signal r10 : std_logic;
  signal r9  : std_logic;
  signal r8  : std_logic;
  signal r7  : std_logic;
  signal r6  : std_logic;
  signal r5  : std_logic;
  signal r4  : std_logic;
  signal r3  : std_logic;
  signal r2  : std_logic;

begin

  uut : res20 port map(
    r2  => r2,
    r3  => r3,
    r4  => r4,
    r5  => r5,
    r6  => r6,
    r7  => r7,
    r8  => r8,
    r9  => r9,
    r10 => r10,
    r11 => r11,
    r12 => r12,
    r13 => r13,
    r14 => r14,
    r15 => r15,
    r16 => r16,
    r17 => r17,
    r18 => r18,
    r19 => r19
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
