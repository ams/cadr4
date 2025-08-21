library ieee;
use ieee.std_logic_1164.all;

use work.ecc.ttldm;

entity ttldm_tb is
end entity;

architecture testbench of ttldm_tb is

  signal input  : std_logic;
  signal tap1   : std_logic;
  signal tap2   : std_logic;
  signal tap3   : std_logic;
  signal tap4   : std_logic;
  signal output : std_logic;

begin

  uut : ttldm 
    generic map (single_tap_delay => 5 ns)
    port map(
      input  => input,
      tap1   => tap1,
      tap2   => tap2,
      tap3   => tap3,
      tap4   => tap4,
      output => output
    );

  stimulus : process
  begin
    input <= '0';
    wait for 50 ns; -- Allow enough time for all signals to settle to '0'
    
    -- Verify all outputs are '0' after initialization
    assert tap1 = '0' report "tap1 should be 0 after init but is " & std_logic'image(tap1);
    assert tap2 = '0' report "tap2 should be 0 after init but is " & std_logic'image(tap2);
    assert tap3 = '0' report "tap3 should be 0 after init but is " & std_logic'image(tap3);
    assert tap4 = '0' report "tap4 should be 0 after init but is " & std_logic'image(tap4);
    assert output = '0' report "output should be 0 after init but is " & std_logic'image(output);

    input <= '1';

    wait for 5 ns;                      -- 5 ns delay
    wait for 1 ps;                      -- small delta delay
    assert tap1 = '1' report "tap1 should be 1 but is " & std_logic'image(tap1);
    assert tap2 = '0' report "tap2 should be 0 but is " & std_logic'image(tap2);
    assert tap3 = '0' report "tap3 should be 0 but is " & std_logic'image(tap3);
    assert tap4 = '0' report "tap4 should be 0 but is " & std_logic'image(tap4);
    assert output = '0' report "output should be 0 but is " & std_logic'image(output);

    wait for 5 ns;                      -- 10 ns total
    assert tap2 = '1';

    wait for 5 ns;                      -- 15 ns total
    assert tap3 = '1';

    wait for 5 ns;                      -- 20 ns total
    assert tap4 = '1';

    wait for 5 ns;                      -- 25 ns total
    assert output = '1';

    wait for 20 ns;                     -- 45 ns total
    input <= '0';

    wait for 5 ns;                      -- 5 ns after falling edge
    assert tap1 = '0';

    wait for 5 ns;                      -- 10 ns after falling edge
    assert tap2 = '0';

    wait for 5 ns;                      -- 15 ns after falling edge
    assert tap3 = '0';

    wait for 5 ns;                      -- 20 ns after falling edge
    assert tap4 = '0';

    wait for 5 ns;                      -- 25 ns after falling edge
    assert output = '0';

    wait;
  end process;

end architecture;
