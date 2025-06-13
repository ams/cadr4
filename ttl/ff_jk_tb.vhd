library ieee;
use ieee.std_logic_1164.all;



entity ff_jk_tb is
end;

architecture testbench of ff_jk_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal clk : std_logic;

begin

  uut : entity work.ff_jk port map(
    clk => clk,
    j   => j,
    k   => k,
    q   => q,
    q_n => q_n
    );

  process
  begin
    -- Initialize
    clk <= '0';
    j <= '0';
    k <= '0';
    wait for 1 ns;

    -- Test 1: Initialize flip-flop to known state first (since it starts in 'U')
    -- Clear to 0 using JK=01
    j <= '0'; k <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;  -- Extra time for output to stabilize
    assert q = '0' and q_n = '1' report "Initial clear failed";

    -- Test 2: Set to 1 using JK=10
    j <= '1'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '1' and q_n = '0' report "Set operation failed";

    -- Test 3: Reset to 0 using JK=01
    j <= '0'; k <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Reset operation failed";

    -- Test 4: Hold state using JK=00 (from 0)
    j <= '0'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Hold state failed (from 0)";

    -- Set to 1 first for next test
    j <= '1'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;

    -- Test 5: Hold state using JK=00 (from 1)
    j <= '0'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '1' and q_n = '0' report "Hold state failed (from 1)";

    -- Test 6: Toggle using JK=11 (from 1 to 0)
    j <= '1'; k <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Toggle operation failed (1->0)";

    -- Test 7: Toggle using JK=11 (from 0 to 1)
    j <= '1'; k <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '1' and q_n = '0' report "Toggle operation failed (0->1)";

    -- Test 8: Multiple consecutive toggles
    for i in 1 to 4 loop
      j <= '1'; k <= '1';
      wait for 1 ns;
      clk <= '1'; wait for 1 ns; clk <= '0';
      wait for 2 ns;
    end loop;
    assert q = '1' and q_n = '0' report "Multiple toggle sequence failed";

    -- Test 9: Verify no change without clock edge
    j <= '0'; k <= '1';  -- Should reset, but no clock edge
    wait for 3 ns;
    assert q = '1' and q_n = '0' report "Output changed without clock edge";

    -- Now apply clock edge
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Reset after delayed clock failed";

    -- Test 10: Test X input handling - J unknown
    j <= 'X'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Unknown J input should produce X";

    -- Reset to known state
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;

    -- Test 11: Test X input handling - K unknown
    j <= '0'; k <= 'X';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Unknown K input should produce X";

    -- Reset to known state
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;

    -- Test 12: Test X input handling - both J and K unknown
    j <= 'X'; k <= 'X';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Unknown J and K inputs should produce X";

    -- Reset to known state
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;

    -- Test 13: Test unknown clock handling
    j <= '1'; k <= '0';
    wait for 1 ns;
    clk <= 'X'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Unknown clock should produce X";

    -- Test 14: Test U input handling - J uninitialized
    j <= 'U'; k <= '0';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Uninitialized J input should produce X";

    -- Test 15: Test toggle from unknown state
    -- First set to unknown state
    j <= 'X'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    
    -- Now try to toggle from unknown state
    j <= '1'; k <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 2 ns;
    assert q = 'X' and q_n = 'X' report "Toggle from unknown state should produce X";

    -- Test 16: Verify falling edge doesn't trigger (only rising edge)
    j <= '0'; k <= '1';  -- Reset command
    clk <= '1';  -- Start high
    wait for 1 ns;
    clk <= '0';  -- Falling edge - should trigger and reset
    wait for 2 ns;
    
    j <= '1'; k <= '0';  -- Set command
    clk <= '0';  -- Start low
    wait for 1 ns;
    clk <= '1';  -- Rising edge - should trigger and set
    wait for 1 ns;
    clk <= '0';  -- Falling edge - should not trigger
    wait for 2 ns;
    assert q = '1' and q_n = '0' report "Falling edge incorrectly triggered";

    wait;
  end process;

end;
