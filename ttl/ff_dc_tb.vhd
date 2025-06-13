library ieee;
use ieee.std_logic_1164.all;



entity ff_dc_tb is
end;

architecture testbench of ff_dc_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal d   : std_logic;
  signal clk : std_logic;
  signal clr : std_logic;

begin

  uut : entity work.ff_dc port map(
    clk => clk,
    clr => clr,
    d   => d,
    q   => q,
    q_n => q_n
    );

  process
  begin
    -- Initialize
    d <= '0'; clk <= '0'; clr <= '1';
    wait for 1 ns;

    -- Test 1: Initialize flip-flop from 'U' state by clearing first
    clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Initial clear failed";
    clr <= '1';
    wait for 1 ns;

    -- Test 2: Clock in '1'
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in '1'";

    -- Test 3: Clock in '0'
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Failed to clock in '0'";

    -- Test 4: Test clear function (asynchronous)
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns; -- Set to 1 first
    clr <= '0'; -- Clear
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear function failed";
    clr <= '1';

    -- Test 5: Verify level changes don't affect output without clock
    d <= '1';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Output changed without clock edge";

    -- Test 6: Clock in the new value
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in new value";

    -- Test 7: Test X input handling - D unknown
    d <= 'X';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown D input should produce X";

    -- Reset to known state
    clr <= '0'; wait for 1 ns; clr <= '1'; wait for 1 ns;

    -- Test 8: Test U input handling - D uninitialized
    d <= 'U';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'U' and q_n = 'X' report "Uninitialized D input should produce U and X";

    -- Reset to known state
    clr <= '0'; wait for 1 ns; clr <= '1'; wait for 1 ns;

    -- Test 9: Test unknown clock handling
    d <= '1';
    clk <= 'X'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown clock should produce X";

    -- Reset to known state
    clr <= '0'; wait for 1 ns; clr <= '1'; wait for 1 ns;

    -- Test 10: Test unknown clear signal
    d <= '1';
    clr <= 'X';
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown clear should produce X";
    clr <= '1';

    -- Test 11: Asynchronous clear operation (works without clock)
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns; -- Set to 1
    clk <= '0'; -- Stop clock
    clr <= '0'; -- Clear without clock
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Asynchronous clear without clock failed";
    clr <= '1';

    -- Test 12: Clear overrides clock operation
    d <= '1'; -- Try to clock in 1
    clr <= '0'; -- But clear is active
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear should override clock operation";
    clr <= '1';

    -- Test 13: Multiple rapid D changes (only last value before clock should matter)
    d <= '0';
    wait for 0.5 ns;
    d <= '1';
    wait for 0.5 ns;
    d <= '0';
    wait for 0.5 ns;
    d <= '1'; -- Final value before clock
    wait for 0.5 ns;
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Multiple D changes test failed";

    wait;
  end process;

end;
