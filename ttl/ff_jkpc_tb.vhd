library ieee;
use ieee.std_logic_1164.all;

entity ff_jkpc_tb is
end entity;

architecture testbench of ff_jkpc_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal clk : std_logic;
  signal pre : std_logic;
  signal clr : std_logic;
begin

  uut : entity work.ff_jkpc port map(
    clk => clk,
    pre => pre,
    clr => clr,
    j   => j,
    k   => k,
    q   => q,
    q_n => q_n
    );

  process
  begin
    -- Initialize all signals
    clk <= '0';
    j   <= '0';
    k   <= '0';
    pre <= '1';
    clr <= '1';
    wait for 1 ns;

    -- Test 1: Asynchronous clear - this initializes the flip-flop from 'U' state
    pre <= '1'; clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear operation failed";

    -- Test 2: Asynchronous preset
    clr <= '1'; pre <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Preset operation failed";

    -- Test 3: Conflicting preset and clear (should result in X)
    pre <= '0'; clr <= '0';
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Conflicting preset/clear should produce X";

    -- Test 4: Return to normal operation
    pre <= '1'; clr <= '1';
    wait for 1 ns;

    -- Initialize to known state for JK testing
    clr <= '0';
    wait for 1 ns;
    clr <= '1';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Reset for JK testing failed";

    -- Test 5: JK=00 (Hold state) - should remain 0
    j <= '0'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "JK=00 hold state failed (from 0)";

    -- Test 6: JK=10 (Set) - should go to 1
    j <= '1'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "JK=10 set operation failed";

    -- Test 7: JK=00 (Hold state) - should remain 1
    j <= '0'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "JK=00 hold state failed (from 1)";

    -- Test 8: JK=01 (Reset) - should go to 0
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "JK=01 reset operation failed";

    -- Test 9: JK=11 (Toggle) - should go to 1
    j <= '1'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "JK=11 toggle operation failed (0->1)";

    -- Test 10: JK=11 (Toggle) - should go to 0
    j <= '1'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "JK=11 toggle operation failed (1->0)";

    -- Test 11: Test X input handling - J unknown
    j <= 'X'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown J input should produce X";

    -- Reset to known state
    j <= '0'; k <= '0';
    clr <= '0'; wait for 1 ns; clr <= '1'; wait for 1 ns;

    -- Test 12: Test X input handling - K unknown
    j <= '0'; k <= 'X';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown K input should produce X";

    -- Reset to known state
    j <= '0'; k <= '0';
    clr <= '0'; wait for 1 ns; clr <= '1'; wait for 1 ns;

    -- Test 13: Test unknown clock handling (realistic TTL behavior)
    -- Unknown clock should not produce a valid edge, so flip-flop maintains state
    j <= '1'; k <= '0';  -- Set command (but won't execute due to unknown clock)
    clk <= 'X'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Unknown clock should maintain previous state";

    -- Test 14: Test unknown preset signal
    pre <= 'X'; clr <= '1';
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown preset should produce X";

    -- Test 15: Test unknown clear signal
    pre <= '1'; clr <= 'X';
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown clear should produce X";

    -- Test 16: Preset takes precedence over clear (as documented)
    pre <= '0'; clr <= '0';
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Both preset and clear active should produce X (conflicting)";

    -- Test 17: Verify asynchronous operation (preset/clear work without clock)
    pre <= '1'; clr <= '1'; j <= '0'; k <= '0';
    clr <= '0';  -- Clear without clock
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Asynchronous clear without clock failed";

    pre <= '0'; clr <= '1';  -- Preset without clock
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Asynchronous preset without clock failed";

    -- Test 18: Verify synchronous operation only occurs on clock edge
    pre <= '1'; clr <= '1';
    j <= '1'; k <= '1';  -- Toggle inputs
    wait for 2 ns;  -- Wait without clock edge
    assert q = '1' and q_n = '0' report "Output changed without clock edge";

    -- Now apply clock edge
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Toggle on clock edge failed";

    wait;
  end process;

end;

