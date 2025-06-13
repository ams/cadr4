library ieee;
use ieee.std_logic_1164.all;



entity ff_d_tb is
end;

architecture testbench of ff_d_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal d   : std_logic;
  signal clk : std_logic;

begin

  uut : entity work.ff_d port map(
    clk => clk,
    d   => d,
    q   => q,
    q_n => q_n
    );

  process
  begin
    -- Initialize
    d <= '0'; clk <= '0';
    wait for 1 ns;

    -- Test 1: Clock in '1'
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in '1'";

    -- Test 2: Clock in '0'
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Failed to clock in '0'";

    -- Test 3: Verify level changes don't affect output without clock
    d <= '1';
    wait for 2 ns;
    assert q = '0' and q_n = '1' report "Output changed without clock edge";

    -- Test 4: Clock in the new value
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in new value";

    -- Test 5: Test X input handling - D unknown
    d <= 'X';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown D input should produce X";

    -- Test 6: Test U input handling - D uninitialized
    d <= 'U';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'U' and q_n = 'X' report "Uninitialized D input should produce U and X";

    -- Test 7: Test unknown clock handling
    d <= '1';
    clk <= 'X'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown clock should produce X";

    -- Test 8: Multiple rapid D changes (only last value before clock should matter)
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

    -- Test 9: Consecutive clock cycles with different D values
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "First consecutive cycle failed";
    
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Second consecutive cycle failed";
    
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Third consecutive cycle failed";

    -- Test 10: Clock frequency independence (different clock periods)
    d <= '1';
    clk <= '1'; wait for 0.5 ns; clk <= '0'; wait for 0.5 ns; -- Fast clock
    assert q = '1' and q_n = '0' report "Fast clock test failed";
    
    d <= '0';
    clk <= '1'; wait for 5 ns; clk <= '0'; wait for 5 ns; -- Slow clock
    assert q = '0' and q_n = '1' report "Slow clock test failed";

    -- Test 11: Verify q and q_n are properly complementary for valid states
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert (q = '1' and q_n = '0') or (q = '0' and q_n = '1') or (q = 'X' and q_n = 'X') 
           report "q and q_n are not properly complementary";

    wait;
  end process;

end;
