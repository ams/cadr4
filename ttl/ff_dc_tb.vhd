library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity ff_dc_tb is
end;

architecture testbench of ff_dc_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal d   : std_logic;
  signal clk : std_logic;
  signal clr : std_logic;

begin

  uut : ff_dc port map(
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

    -- Test 1: Asynchronous clear
    clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Failed to clear asynchronously";

    -- Test 2: Clock in '1' while clear is active (should remain cleared)
    d <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear override failed";

    -- Test 3: Release clear and clock in '1'
    clr <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '1' and q_n = '0' report "Failed to clock in '1' after clear release";

    -- Test 4: Clock in '0'
    d <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert q = '0' and q_n = '1' report "Failed to clock in '0'";

    -- Test 5: Clear again while q='0'
    clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear failed when q was already '0'";

    wait;
  end process;

end;
