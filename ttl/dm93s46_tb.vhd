library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm93s46;

entity dm93s46_tb is
end;

architecture testbench of dm93s46_tb is

  signal a5  : std_logic;
  signal a4  : std_logic;
  signal a3  : std_logic;
  signal a2  : std_logic;
  signal a1  : std_logic;
  signal a0  : std_logic;
  signal b5  : std_logic;
  signal b4  : std_logic;
  signal b3  : std_logic;
  signal b2  : std_logic;
  signal b1  : std_logic;
  signal b0  : std_logic;
  signal enb : std_logic;
  signal eq  : std_logic;

begin

  uut : dm93s46 port map(
    a5  => a5,
    a4  => a4,
    a3  => a3,
    a2  => a2,
    a1  => a1,
    a0  => a0,
    b5  => b5,
    b4  => b4,
    b3  => b3,
    b2  => b2,
    b1  => b1,
    b0  => b0,
    enb => enb,
    eq  => eq
    );

  process
  begin
    -- Test 1: Enable is low, output should be low regardless of inputs
    enb <= '0';
    a5 <= '1'; a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 1 failed: eq should be '0' when enb='0'" severity error;

    -- Test 2: Enable is low with different inputs, output should still be low
    a5 <= '0'; a4 <= '1'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 2 failed: eq should be '0' when enb='0'" severity error;

    -- Test 3: Enable is high, all bits equal, output should be high
    enb <= '1';
    a5 <= '1'; a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '1' report "Test 3 failed: eq should be '1' when enabled and all bits equal" severity error;

    -- Test 4: Enable is high, all bits equal (different pattern), output should be high
    a5 <= '0'; a4 <= '1'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1';
    b5 <= '0'; b4 <= '1'; b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1';
    wait for 10 ns;
    assert eq = '1' report "Test 4 failed: eq should be '1' when enabled and all bits equal" severity error;

    -- Test 5: Enable is high, a0 differs, output should be low
    a5 <= '1'; a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '1';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 5 failed: eq should be '0' when a0 differs" severity error;

    -- Test 6: Enable is high, a1 differs, output should be low
    a5 <= '1'; a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 6 failed: eq should be '0' when a1 differs" severity error;

    -- Test 7: Enable is high, a2 differs, output should be low
    a5 <= '1'; a4 <= '0'; a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 7 failed: eq should be '0' when a2 differs" severity error;

    -- Test 8: Enable is high, a3 differs, output should be low
    a5 <= '1'; a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 8 failed: eq should be '0' when a3 differs" severity error;

    -- Test 9: Enable is high, a4 differs, output should be low
    a5 <= '1'; a4 <= '1'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 9 failed: eq should be '0' when a4 differs" severity error;

    -- Test 10: Enable is high, a5 differs, output should be low
    a5 <= '0'; a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 10 failed: eq should be '0' when a5 differs" severity error;

    -- Test 11: Enable is high, multiple bits differ, output should be low
    a5 <= '0'; a4 <= '1'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1';
    b5 <= '1'; b4 <= '0'; b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
    wait for 10 ns;
    assert eq = '0' report "Test 11 failed: eq should be '0' when multiple bits differ" severity error;

    -- Test 12: Enable is high, all zeros equal, output should be high
    a5 <= '0'; a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    b5 <= '0'; b4 <= '0'; b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0';
    wait for 10 ns;
    assert eq = '1' report "Test 12 failed: eq should be '1' when all bits are zero and equal" severity error;

    -- Test 13: Enable is high, all ones equal, output should be high
    a5 <= '1'; a4 <= '1'; a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1';
    b5 <= '1'; b4 <= '1'; b3 <= '1'; b2 <= '1'; b1 <= '1'; b0 <= '1';
    wait for 10 ns;
    assert eq = '1' report "Test 13 failed: eq should be '1' when all bits are one and equal" severity error;

    wait;
  end process;

end;
