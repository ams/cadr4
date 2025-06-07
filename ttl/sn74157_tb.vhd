library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74157_tb is
end;

architecture testbench of sn74157_tb is

  signal enb_n : std_logic;
  signal a1    : std_logic;
  signal b1    : std_logic;
  signal y1    : std_logic;
  signal a2    : std_logic;
  signal b2    : std_logic;
  signal y2    : std_logic;
  signal y3    : std_logic;
  signal b3    : std_logic;
  signal a3    : std_logic;
  signal y4    : std_logic;
  signal b4    : std_logic;
  signal a4    : std_logic;
  signal sel   : std_logic;

begin

  uut : sn74157 port map(
    sel   => sel,
    a4    => a4,
    b4    => b4,
    y4    => y4,
    a3    => a3,
    b3    => b3,
    y3    => y3,
    y2    => y2,
    b2    => b2,
    a2    => a2,
    y1    => y1,
    b1    => b1,
    a1    => a1,
    enb_n => enb_n
    );

  process
  begin
    wait for 5 ns;

    -- Test 1: Enable disabled (enb_n = '1') - all outputs should be 'Z'
    enb_n <= '1';
    sel <= '0';
    a1 <= '1'; a2 <= '1'; a3 <= '1'; a4 <= '1';
    b1 <= '1'; b2 <= '1'; b3 <= '1'; b4 <= '1';
    wait for 10 ns;
    assert y1 = 'Z' and y2 = 'Z' and y3 = 'Z' and y4 = 'Z'
      report "Test 1 failed: outputs should be 'Z' when disabled" severity error;

    -- Test 2: Enable active, select A inputs (sel = '0')
    enb_n <= '0';
    sel <= '0';
    a1 <= '1'; a2 <= '0'; a3 <= '1'; a4 <= '0';
    b1 <= '0'; b2 <= '1'; b3 <= '0'; b4 <= '1';
    wait for 10 ns;
    assert y1 = '1' and y2 = '0' and y3 = '1' and y4 = '0'
      report "Test 2 failed: A inputs not selected properly" severity error;

    -- Test 3: Enable active, select B inputs (sel = '1')
    enb_n <= '0';
    sel <= '1';
    a1 <= '1'; a2 <= '0'; a3 <= '1'; a4 <= '0';
    b1 <= '0'; b2 <= '1'; b3 <= '0'; b4 <= '1';
    wait for 10 ns;
    assert y1 = '0' and y2 = '1' and y3 = '0' and y4 = '1'
      report "Test 3 failed: B inputs not selected properly" severity error;

    -- Test 4: All A inputs high, select A
    enb_n <= '0';
    sel <= '0';
    a1 <= '1'; a2 <= '1'; a3 <= '1'; a4 <= '1';
    b1 <= '0'; b2 <= '0'; b3 <= '0'; b4 <= '0';
    wait for 10 ns;
    assert y1 = '1' and y2 = '1' and y3 = '1' and y4 = '1'
      report "Test 4 failed: all A inputs high" severity error;

    -- Test 5: All B inputs high, select B
    enb_n <= '0';
    sel <= '1';
    a1 <= '0'; a2 <= '0'; a3 <= '0'; a4 <= '0';
    b1 <= '1'; b2 <= '1'; b3 <= '1'; b4 <= '1';
    wait for 10 ns;
    assert y1 = '1' and y2 = '1' and y3 = '1' and y4 = '1'
      report "Test 5 failed: all B inputs high" severity error;

    -- Test 6: All inputs low, both select states
    enb_n <= '0';
    sel <= '0';
    a1 <= '0'; a2 <= '0'; a3 <= '0'; a4 <= '0';
    b1 <= '0'; b2 <= '0'; b3 <= '0'; b4 <= '0';
    wait for 10 ns;
    assert y1 = '0' and y2 = '0' and y3 = '0' and y4 = '0'
      report "Test 6a failed: all inputs low, select A" severity error;

    sel <= '1';
    wait for 10 ns;
    assert y1 = '0' and y2 = '0' and y3 = '0' and y4 = '0'
      report "Test 6b failed: all inputs low, select B" severity error;

    -- Test 7: Mixed pattern test
    enb_n <= '0';
    sel <= '0';
    a1 <= '0'; a2 <= '1'; a3 <= '0'; a4 <= '1';
    b1 <= '1'; b2 <= '0'; b3 <= '1'; b4 <= '0';
    wait for 10 ns;
    assert y1 = '0' and y2 = '1' and y3 = '0' and y4 = '1'
      report "Test 7a failed: mixed pattern, select A" severity error;

    sel <= '1';
    wait for 10 ns;
    assert y1 = '1' and y2 = '0' and y3 = '1' and y4 = '0'
      report "Test 7b failed: mixed pattern, select B" severity error;

    -- Test 8: Transition from enabled to disabled
    enb_n <= '0';
    sel <= '1';
    a1 <= '0'; a2 <= '0'; a3 <= '0'; a4 <= '0';
    b1 <= '1'; b2 <= '1'; b3 <= '1'; b4 <= '1';
    wait for 10 ns;
    assert y1 = '1' and y2 = '1' and y3 = '1' and y4 = '1'
      report "Test 8a failed: before disable" severity error;

    enb_n <= '1';
    wait for 10 ns;
    assert y1 = 'Z' and y2 = 'Z' and y3 = 'Z' and y4 = 'Z'
      report "Test 8b failed: after disable" severity error;

    wait;
  end process;

end;
