library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm93425a;

entity dm93425a_tb is
end entity;

architecture testbench of dm93425a_tb is

  -- Initialize signals to avoid metavalue assertions from ieee.numeric_std
  signal a0   : std_logic := '0';
  signal a1   : std_logic := '0';
  signal a2   : std_logic := '0';
  signal a3   : std_logic := '0';
  signal a4   : std_logic := '0';
  signal a5   : std_logic := '0';
  signal a6   : std_logic := '0';
  signal a7   : std_logic := '0';
  signal a8   : std_logic := '0';
  signal a9   : std_logic := '0';
  signal ce_n : std_logic := '0';
  signal we_n : std_logic := '0';
  signal di   : std_logic := '0';
  signal do   : std_logic;

begin

  uut : dm93425a port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    a5   => a5,
    a6   => a6,
    a7   => a7,
    a8   => a8,
    a9   => a9,
    ce_n => ce_n,
    we_n => we_n,
    di   => di,
    do   => do
    );

  process
  begin
    -- Test 1: write '1' to address 0, chip selected. DOUT floats during the
    -- write (logic diagram: output enabled only with CS low and WE high).
    ce_n <= '0';
    we_n <= '0';
    di   <= '1';
    a0 <= '0'; a1 <= '0'; a2 <= '0'; a3 <= '0'; a4 <= '0';
    a5 <= '0'; a6 <= '0'; a7 <= '0'; a8 <= '0'; a9 <= '0';
    wait for 1 ns;
    assert do = 'Z'
      report "Test 1 failed: DO must be 'Z' during write, got " & std_logic'image(do) severity error;

    -- Test 2: read back
    we_n <= '1';
    wait for 1 ns;
    assert do = '1'
      report "Test 2 failed: expected '1' at address 0, got " & std_logic'image(do) severity error;

    -- Test 3: write '0' to address 1 without deselecting. The output is
    -- active (reading address 0) when WE drops, it must go to 'Z'.
    we_n <= '0'; di <= '0'; a0 <= '1';
    wait for 1 ns;
    assert do = 'Z'
      report "Test 3a failed: DO must be 'Z' during write, got " & std_logic'image(do) severity error;
    we_n <= '1';
    wait for 1 ns;
    assert do = '0'
      report "Test 3b failed: expected '0' at address 1, got " & std_logic'image(do) severity error;

    -- Test 4: address bits above a0. Write '1' to address 512 (a9) and to
    -- address 32 (a5), then read everything back.
    a0 <= '0'; a9 <= '1'; di <= '1';
    wait for 1 ns;
    we_n <= '0';
    wait for 1 ns;
    assert do = 'Z'
      report "Test 4a failed: DO must be 'Z' during write, got " & std_logic'image(do) severity error;
    a9 <= '0'; a5 <= '1';  -- address 32, still writing
    wait for 1 ns;
    assert do = 'Z'
      report "Test 4b failed: DO must be 'Z' during write, got " & std_logic'image(do) severity error;
    we_n <= '1';
    wait for 1 ns;
    assert do = '1'
      report "Test 4c failed: expected '1' at address 32, got " & std_logic'image(do) severity error;
    a5 <= '0'; a9 <= '1';  -- address 512
    wait for 1 ns;
    assert do = '1'
      report "Test 4d failed: expected '1' at address 512, got " & std_logic'image(do) severity error;
    a9 <= '0';             -- address 0
    wait for 1 ns;
    assert do = '1'
      report "Test 4e failed: expected '1' at address 0, got " & std_logic'image(do) severity error;
    a0 <= '1';             -- address 1
    wait for 1 ns;
    assert do = '0'
      report "Test 4f failed: expected '0' at address 1, got " & std_logic'image(do) severity error;

    -- Test 5: chip disabled, in read and in write mode
    ce_n <= '1';
    wait for 1 ns;
    assert do = 'Z'
      report "Test 5a failed: expected 'Z' when deselected, got " & std_logic'image(do) severity error;
    we_n <= '0'; di <= '1';
    wait for 1 ns;
    assert do = 'Z'
      report "Test 5b failed: expected 'Z' when deselected, got " & std_logic'image(do) severity error;
    -- the write above must not have happened (address 1 still '0')
    we_n <= '1'; ce_n <= '0';
    wait for 1 ns;
    assert do = '0'
      report "Test 5c failed: write while deselected changed address 1" severity error;

    wait;
  end process;

end architecture;
