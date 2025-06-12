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

    -- Initialize flip-flop from 'U' state by clearing first
    clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Initial clear failed";
    clr <= '1';
    wait for 1 ns;

    -- Test 1: Clock in '1'
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in '1'";

    -- Test 2: Clock in '0'
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Failed to clock in '0'";

    -- Test 3: Test clear function
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns; -- Set to 1 first
    clr <= '0'; -- Clear
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear function failed";
    clr <= '1';

    -- Test 4: Verify level changes don't affect output
    d <= '1';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Output changed without clock edge";

    -- Test 5: Clock in the new value
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in new value";

    wait;
  end process;

end;
