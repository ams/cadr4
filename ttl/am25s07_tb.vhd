library ieee;
use ieee.std_logic_1164.all;

use work.amd.am25s07;

entity am25s07_tb is
end;

architecture testbench of am25s07_tb is

  signal enb_n : std_logic;
  signal clk   : std_logic;
  signal d5    : std_logic;
  signal d4    : std_logic;
  signal d3    : std_logic;
  signal d2    : std_logic;
  signal d1    : std_logic;
  signal d0    : std_logic;
  signal i5    : std_logic;
  signal i4    : std_logic;
  signal i3    : std_logic;
  signal i2    : std_logic;
  signal i1    : std_logic;
  signal i0    : std_logic;

begin

  uut : am25s07 port map(
    i0    => i0,
    i1    => i1,
    i2    => i2,
    i3    => i3,
    i4    => i4,
    i5    => i5,
    d0    => d0,
    d1    => d1,
    d2    => d2,
    d3    => d3,
    d4    => d4,
    d5    => d5,
    clk   => clk,
    enb_n => enb_n
    );

  process
  begin
    -- Initialize
    clk <= '0'; enb_n <= '1';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0'; i4 <= '0'; i5 <= '0';
    wait for 1 ns;

    -- Test 1: Load data with enable disabled (should not change outputs)
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1'; i4 <= '1'; i5 <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    -- Outputs should remain unchanged (uninitialized)

    -- Test 2: Load data with enable active
    enb_n <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert d0 = '1' and d1 = '1' and d2 = '1' and d3 = '1' and d4 = '1' and d5 = '1'
      report "Failed to load data when enabled";

    -- Test 3: Change inputs and verify they don't affect outputs until clock edge
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0'; i4 <= '0'; i5 <= '0';
    wait for 1 ns;
    assert d0 = '1' and d1 = '1' and d2 = '1' and d3 = '1' and d4 = '1' and d5 = '1'
      report "Outputs changed without clock edge";

    -- Test 4: Clock with new data
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert d0 = '0' and d1 = '0' and d2 = '0' and d3 = '0' and d4 = '0' and d5 = '0'
      report "Failed to load new data";

    -- Test 5: Disable enable and verify no change on clock edge
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1'; i4 <= '1'; i5 <= '1';
    enb_n <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
    assert d0 = '0' and d1 = '0' and d2 = '0' and d3 = '0' and d4 = '0' and d5 = '0'
      report "Outputs changed when enable disabled";

    wait;
  end process;

end;
