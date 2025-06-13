library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

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
    -- Wait for initial propagation
    wait for 5 ns;

    -- Test that all outputs are '1'
    assert r2 = 'H' report "r2 should be 'H'" severity error;
    assert r3 = 'H' report "r3 should be 'H'" severity error;
    assert r4 = 'H' report "r4 should be 'H'" severity error;
    assert r5 = 'H' report "r5 should be 'H'" severity error;
    assert r6 = 'H' report "r6 should be 'H'" severity error;
    assert r7 = 'H' report "r7 should be 'H'" severity error;
    assert r8 = 'H' report "r8 should be 'H'" severity error;
    assert r9 = 'H' report "r9 should be 'H'" severity error;
    assert r10 = 'H' report "r10 should be 'H'" severity error;
    assert r11 = 'H' report "r11 should be 'H'" severity error;
    assert r12 = 'H' report "r12 should be 'H'" severity error;
    assert r13 = 'H' report "r13 should be 'H'" severity error;
    assert r14 = 'H' report "r14 should be 'H'" severity error;
    assert r15 = 'H' report "r15 should be 'H'" severity error;
    assert r16 = 'H' report "r16 should be 'H'" severity error;
    assert r17 = 'H' report "r17 should be 'H'" severity error;
    assert r18 = 'H' report "r18 should be 'H'" severity error;
    assert r19 = 'H' report "r19 should be 'H'" severity error;

    wait;
  end process;

end;
