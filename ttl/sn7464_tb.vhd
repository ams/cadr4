library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7464_tb is
end;

architecture testbench of sn7464_tb is

  signal a4    : std_logic;
  signal b4    : std_logic;
  signal c4    : std_logic;
  signal a1    : std_logic;
  signal b1    : std_logic;
  signal c3    : std_logic;
  signal \out\ : std_logic;
  signal a3    : std_logic;
  signal b3    : std_logic;
  signal a2    : std_logic;
  signal b2    : std_logic;
  signal d4    : std_logic;

  procedure check_output(
    expected : in std_logic;
    msg : in string) is
  begin
    assert \out\ = expected report msg severity error;
  end procedure;

begin

  uut : sn7464 port map(
    d4 => d4,
    b2 => b2,
    a2 => a2,
    c3 => c3,
    b3 => b3,
    a3 => a3,
    \out\ => \out\,
    a1 => a1,
    b1 => b1,
    c4 => c4,
    b4 => b4,
    a4 => a4
    );

  process
  begin
    -- Initialize all inputs to 0
    a1 <= '0'; b1 <= '0';
    a2 <= '0'; b2 <= '0';
    a3 <= '0'; b3 <= '0'; c3 <= '0';
    a4 <= '0'; b4 <= '0'; c4 <= '0'; d4 <= '0';
    wait for 5 ns;
    check_output('1', "should be 1 when all inputs are 0");

    -- Test first AND gate (a1 and b1)
    a1 <= '1'; b1 <= '1';
    wait for 5 ns;
    check_output('0', "should be 0 when a1 and b1 are 1");

    -- Test second AND gate (a2 and b2)
    a1 <= '0'; b1 <= '0';
    a2 <= '1'; b2 <= '1';
    wait for 5 ns;
    check_output('0', "should be 0 when a2 and b2 are 1");

    -- Test third AND gate (a3 and b3 and c3)
    a2 <= '0'; b2 <= '0';
    a3 <= '1'; b3 <= '1'; c3 <= '1';
    wait for 5 ns;
    check_output('0', "should be 0 when a3, b3, and c3 are 1");

    -- Test fourth AND gate (a4 and b4 and c4 and d4)
    a3 <= '0'; b3 <= '0'; c3 <= '0';
    a4 <= '1'; b4 <= '1'; c4 <= '1'; d4 <= '1';
    wait for 5 ns;
    check_output('0', "should be 0 when a4, b4, c4, and d4 are 1");

    -- Test multiple AND gates active
    a1 <= '1'; b1 <= '1';
    a2 <= '1'; b2 <= '1';
    a3 <= '1'; b3 <= '1'; c3 <= '1';
    a4 <= '1'; b4 <= '1'; c4 <= '1'; d4 <= '1';
    wait for 5 ns;
    check_output('0', "should be 0 when any AND gate is active");

    -- Test partial AND gate inputs
    a1 <= '1'; b1 <= '0';
    a2 <= '0'; b2 <= '0';
    a3 <= '1'; b3 <= '0'; c3 <= '1';
    a4 <= '0'; b4 <= '1'; c4 <= '1'; d4 <= '0';
    wait for 5 ns;
    check_output('1', "should be 1 when no AND gate is fully active");

    report "Test completed successfully" severity note;
    wait;
  end process;

end;
