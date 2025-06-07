library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity am2147_tb is
end;

architecture testbench of am2147_tb is

  signal a6   : std_logic;
  signal a7   : std_logic;
  signal a8   : std_logic;
  signal a9   : std_logic;
  signal a10  : std_logic;
  signal a11  : std_logic;
  signal di   : std_logic;
  signal ce_n : std_logic;
  signal we_n : std_logic;
  signal do   : std_logic;
  signal a5   : std_logic;
  signal a4   : std_logic;
  signal a3   : std_logic;
  signal a2   : std_logic;
  signal a1   : std_logic;
  signal a0   : std_logic;

begin

  uut : am2147 port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    a5   => a5,
    do   => do,
    we_n => we_n,
    ce_n => ce_n,
    di   => di,
    a11  => a11,
    a10  => a10,
    a9   => a9,
    a8   => a8,
    a7   => a7,
    a6   => a6
    );

  process
  begin
    -- Test 1: Initialize with chip disabled
    ce_n <= '1'; we_n <= '1'; di <= '0';
    a11 <= '0'; a10 <= '0'; a9 <= '0'; a8 <= '0';
    a7 <= '0'; a6 <= '0'; a5 <= '0'; a4 <= '0';
    a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    wait for 1 ns;
    assert do = 'Z' report "Output should be high-Z when chip disabled";

    -- Test 2: Write '1' to address 0
    ce_n <= '0'; we_n <= '0'; di <= '1';
    wait for 1 ns;
    
    -- Test 3: Read from address 0
    we_n <= '1';
    wait for 1 ns;
    assert do = '1' report "Failed to read '1' from address 0";

    -- Test 4: Write '0' to address 1
    we_n <= '1'; -- Disable write first
    a0 <= '1';   -- Change address
    wait for 1 ns;
    we_n <= '0'; di <= '0'; -- Enable write
    wait for 1 ns;
    
    -- Test 5: Read from address 1
    we_n <= '1';
    wait for 1 ns;
    assert do = '0' report "Failed to read '0' from address 1";

    -- Test 6: Verify address 0 still contains '1'
    a0 <= '0';
    wait for 1 ns;
    assert do = '1' report "Address 0 lost its data";

    -- Test 7: Test higher address (address 4095)
    we_n <= '1'; -- Disable write first
    a11 <= '1'; a10 <= '1'; a9 <= '1'; a8 <= '1';
    a7 <= '1'; a6 <= '1'; a5 <= '1'; a4 <= '1';
    a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1';
    wait for 1 ns;
    we_n <= '0'; di <= '1'; -- Enable write
    wait for 1 ns;
    
    we_n <= '1';
    wait for 1 ns;
    assert do = '1' report "Failed to write/read from max address";

    wait;
  end process;

end;
