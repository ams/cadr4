library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm9328;

entity dm9328_tb is
end entity;

architecture testbench of dm9328_tb is

  signal clr_n  : std_logic;
  signal aq_n   : std_logic;
  signal aq     : std_logic;
  signal asel   : std_logic;
  signal ai1    : std_logic;
  signal ai0    : std_logic;
  signal aclk   : std_logic;
  signal comclk : std_logic;
  signal bclk   : std_logic;
  signal bi0    : std_logic;
  signal bi1    : std_logic;
  signal bsel   : std_logic;
  signal bq     : std_logic;
  signal bq_n   : std_logic;

begin

  uut : dm9328 port map(
    clr_n  => clr_n,
    aq_n   => aq_n,
    aq     => aq,
    asel   => asel,
    ai1    => ai1,
    ai0    => ai0,
    aclk   => aclk,
    comclk => comclk,
    bclk   => bclk,
    bi0    => bi0,
    bi1    => bi1,
    bsel   => bsel,
    bq     => bq,
    bq_n   => bq_n
    );

  process
    -- one low-high-low pulse on the given clock signal
    procedure pulse(signal clk : out std_logic) is
    begin
      clk <= '1';
      wait for 1 ns;
      clk <= '0';
      wait for 1 ns;
    end procedure;
  begin
    -- initialize signals
    aclk <= '0';
    bclk <= '0';
    ai0 <= '0';
    ai1 <= '0';
    bi0 <= '0';
    bi1 <= '0';
    asel <= '0';
    bsel <= '0';
    comclk <= '0';

    -- Test 1: clear registers
    clr_n <= '0';
    wait for 1 ns;
    clr_n <= '1';
    wait for 1 ns;
    assert aq = '0' and aq_n = '1' and bq = '0' and bq_n = '1'
      report "Test 1 failed: master reset" severity error;

    -- Test 2: shift ones into register A using ai0 and the separate clock
    asel <= '0';
    ai0 <= '1';
    wait for 1 ns;
    for i in 0 to 6 loop
      pulse(aclk);
      assert aq = '0' and aq_n = '1'
        report "Test 2a failed: Q7 set after " & integer'image(i + 1) & " clocks" severity error;
    end loop;
    pulse(aclk);
    assert aq = '1' and aq_n = '0'
      report "Test 2b failed: Q7 not set after 8 clocks" severity error;

    -- Test 3: shift ones into register B using bi1 and the separate clock
    bsel <= '1';
    bi1 <= '1';
    wait for 1 ns;
    for i in 0 to 6 loop
      pulse(bclk);
      assert bq = '0' and bq_n = '1'
        report "Test 3a failed: Q7 set after " & integer'image(i + 1) & " clocks" severity error;
    end loop;
    pulse(bclk);
    assert bq = '1' and bq_n = '0'
      report "Test 3b failed: Q7 not set after 8 clocks" severity error;

    -- Test 4: data select. asel=1 selects ai1 (low) -> zeros are shifted in
    -- and Q7 goes low after 8 clocks; bsel=0 selects bi0 (low).
    asel <= '1'; ai1 <= '0';
    bsel <= '0'; bi0 <= '0';
    wait for 1 ns;
    for i in 0 to 6 loop
      pulse(aclk);
      pulse(bclk);
      assert aq = '1' and bq = '1'
        report "Test 4a failed: Q7 cleared too early" severity error;
    end loop;
    pulse(aclk);
    pulse(bclk);
    assert aq = '0' and aq_n = '1' and bq = '0' and bq_n = '1'
      report "Test 4b failed: zeros not shifted in via the selected input" severity error;

    -- Test 5: the common clock (pin 9) clocks both registers while the
    -- separate clocks are held low
    aclk <= '0'; bclk <= '0';
    asel <= '0'; ai0 <= '1';
    bsel <= '1'; bi1 <= '1';
    wait for 1 ns;
    for i in 0 to 6 loop
      pulse(comclk);
      assert aq = '0' and bq = '0'
        report "Test 5a failed: Q7 set too early with the common clock" severity error;
    end loop;
    pulse(comclk);
    assert aq = '1' and aq_n = '0' and bq = '1' and bq_n = '0'
      report "Test 5b failed: common clock did not shift" severity error;

    -- Test 6: a high separate clock inhibits the common clock (clock is the
    -- OR of the two inputs, no rising edge while one of them is high)
    ai0 <= '0'; bi1 <= '0';
    aclk <= '1';
    wait for 1 ns;
    for i in 0 to 7 loop
      pulse(comclk);
    end loop;
    assert aq = '1' and aq_n = '0'
      report "Test 6a failed: common clock must be inhibited while aclk is high" severity error;
    -- register B is not inhibited, 8 common clocks shifted zeros in
    assert bq = '0' and bq_n = '1'
      report "Test 6b failed: register B should have shifted with the common clock" severity error;
    -- releasing aclk (high to low) is not a rising edge of the OR, no shift
    aclk <= '0';
    wait for 1 ns;
    assert aq = '1'
      report "Test 6c failed: falling edge of aclk must not clock the register" severity error;

    -- Test 7: a high common clock inhibits the separate clocks
    comclk <= '1';
    wait for 1 ns;
    for i in 0 to 7 loop
      pulse(aclk);
      pulse(bclk);
    end loop;
    assert aq = '1' and aq_n = '0'
      report "Test 7a failed: separate clock must be inhibited while comclk is high" severity error;
    comclk <= '0';
    wait for 1 ns;
    assert aq = '1'
      report "Test 7b failed: falling edge of comclk must not clock the register" severity error;
    -- now the separate clock works again
    for i in 0 to 7 loop
      pulse(aclk);
    end loop;
    assert aq = '0' and aq_n = '1'
      report "Test 7c failed: separate clock should work with comclk low" severity error;

    -- Test 8: master reset overrides the clock
    ai0 <= '1'; bi1 <= '1';
    for i in 0 to 7 loop
      pulse(comclk);
    end loop;
    assert aq = '1' and bq = '1'
      report "Test 8a failed: setup for master reset" severity error;
    clr_n <= '0';
    wait for 1 ns;
    assert aq = '0' and aq_n = '1' and bq = '0' and bq_n = '1'
      report "Test 8b failed: master reset should clear both registers" severity error;
    pulse(comclk);
    assert aq = '0' and bq = '0'
      report "Test 8c failed: clock must not shift while master reset is active" severity error;
    clr_n <= '1';
    wait for 1 ns;

    wait;
  end process;

end architecture;
