library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.intel.d2147;

entity d2147_tb is
end entity;

architecture ttl of d2147_tb is

  signal addr : std_logic_vector(11 downto 0);
  signal ce_n : std_logic;
  signal we_n : std_logic;
  signal di   : std_logic;
  signal do   : std_logic;

begin

  uut : d2147
    port map (
      a0   => addr(0),
      a1   => addr(1),
      a2   => addr(2),
      a3   => addr(3),
      a4   => addr(4),
      a5   => addr(5),
      a6   => addr(6),
      a7   => addr(7),
      a8   => addr(8),
      a9   => addr(9),
      a10  => addr(10),
      a11  => addr(11),
      ce_n => ce_n,
      di   => di,
      we_n => we_n,
      do   => do
      );

  stimulus : process
    procedure write(address : integer; data : std_logic) is
    begin
      addr <= std_logic_vector(to_unsigned(address, 12));
      di   <= data;
      wait for 1 ns;
      ce_n <= '0';
      we_n <= '0';
      wait for 10 ns;
      ce_n <= '1';
      we_n <= '1';
      wait for 10 ns;
    end procedure;

    procedure read(address : integer; expected_data : std_logic) is
    begin
      addr <= std_logic_vector(to_unsigned(address, 12));
      wait for 1 ns;
      ce_n <= '0';
      we_n <= '1';
      wait for 10 ns;
      assert do = expected_data
        report "Read failed at address " & integer'image(address) &
               ". Expected " & std_logic'image(expected_data) &
               ", got " & std_logic'image(do)
        severity error;
      ce_n <= '1';
      wait for 10 ns;
    end procedure;
  begin
    -- Initialize inputs
    ce_n <= '1';
    we_n <= '1';
    addr <= (others => '0');
    di   <= '0';
    wait for 10 ns;

    -- Test 1: Write '1' to address 0 and read back
    write(0, '1');
    read(0, '1');

    -- Test 2: Write '0' to address 1 and read back
    write(1, '0');
    read(1, '0');

    -- Test 3: Write '1' to max address and read back
    write(4095, '1');
    read(4095, '1');

    -- Test 4: Check if writing to one address doesn't affect another
    read(0, '1');

    -- Test 5: Check chip deselect
    ce_n <= '1';
    we_n <= '1';
    addr <= std_logic_vector(to_unsigned(0, 12));
    wait for 10 ns;
    assert do = 'Z'
      report "Deselect test failed. Expected 'Z', got " & std_logic'image(do)
      severity error;

    -- Test 6: write without deselecting the chip. Read a word (output
    -- active), then drop WE with CS still low: DOUT must float during the
    -- write (truth table: CS=L, WE=L -> High Z) and the written value must be
    -- readable afterwards.
    addr <= std_logic_vector(to_unsigned(0, 12));
    ce_n <= '0';
    we_n <= '1';
    wait for 10 ns;
    assert do = '1'
      report "Test 6a failed: read before write, expected '1', got " & std_logic'image(do)
      severity error;
    di   <= '0';
    we_n <= '0';  -- write '0' to address 0, chip still selected
    wait for 10 ns;
    assert do = 'Z'
      report "Test 6b failed: DO must be 'Z' during write, got " & std_logic'image(do)
      severity error;
    -- move to another address while WE is still low
    addr <= std_logic_vector(to_unsigned(5, 12));
    di   <= '1';
    wait for 10 ns;
    assert do = 'Z'
      report "Test 6c failed: DO must stay 'Z' during write, got " & std_logic'image(do)
      severity error;
    we_n <= '1';  -- back to read, chip still selected
    wait for 10 ns;
    assert do = '1'
      report "Test 6d failed: read back address 5, expected '1', got " & std_logic'image(do)
      severity error;
    addr <= std_logic_vector(to_unsigned(0, 12));
    wait for 10 ns;
    assert do = '0'
      report "Test 6e failed: read back address 0, expected '0', got " & std_logic'image(do)
      severity error;
    ce_n <= '1';
    wait for 10 ns;
    assert do = 'Z'
      report "Test 6f failed: deselected, expected 'Z', got " & std_logic'image(do)
      severity error;

    wait;
  end process;

end architecture;
