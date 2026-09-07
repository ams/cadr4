library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74124;

entity sn74124_tb is
end entity;

architecture testbench of sn74124_tb is

  -- REQTIM 0A01 is the part's only instance on the CADR.  MIT fixes the
  -- period three ways: rom/mit/cadr1/reqtim.prom's header ("This Assumes
  -- Roughly 2 uSec clock intervals"), every entry of its table labelled in
  -- 2 uSec steps, and doc/ai/cadrdc/dctmot.drw's annotation on the same part
  -- in the same role ("74LS124  PERIOD = 1.8 - 2.0 usec.").
  constant period : time := 2 us;

  -- when the stimulus enables the oscillator
  constant t_en : time := 500 ns;

  signal en_n : std_logic := '1';
  signal y    : std_logic;

  -- a second instance, to show the period generic is honoured
  signal en_n_f : std_logic := '1';
  signal y_f    : std_logic;

  signal edges   : natural := 0;
  signal t_first : time    := 0 ns;
  signal t_sixth : time    := 0 ns;

begin

  uut : sn74124 port map (
    en_n => en_n,
    y    => y
    );

  uut_fast : sn74124
    generic map (period => 100 ns)
    port map (
      en_n => en_n_f,
      y    => y_f
      );

  -- stamp the first and sixth rising edges; the REQTIM state machine counts
  -- them, so where they fall is the whole of the timeout behaviour
  counter : process (y)
    variable n : natural := 0;
  begin
    if rising_edge(y) then
      n := n + 1;
      if n = 1 then
        t_first <= now;
      end if;
      if n = 6 then
        t_sixth <= now;
      end if;
      edges <= n;
    end if;
  end process;

  process
  begin
    -- Test 1: disabled, output low and steady.  Nothing on the board can
    -- observe this level: the 74LS273 it clocks is held cleared over exactly
    -- this interval.  Low is what makes the enable itself a rising edge.
    wait for 300 ns;
    assert y = '0'
      report "Test 1a failed: output should be low while disabled" severity error;

    -- Test 2: the first rising edge coincides with the enable.  The
    -- datasheet (doc/ttl/sn74124.pdf, TI's SN54S124/SN74S124, first published
    -- 1983 and revised 2004) puts it half a period on, which would move the
    -- REQTIM NXM timeout off MIT's 10 uSec by a microsecond.
    wait for t_en - 300 ns;
    en_n <= '0';
    wait for 1 ns;
    assert y = '1'
      report "Test 2 failed: output should rise as soon as it is enabled" severity error;

    -- Test 3: half period, so rising edges one period apart
    wait for period / 2 - 2 ns;
    assert y = '1'
      report "Test 3a failed: output fell before the half period" severity error;
    wait for 2 ns;
    assert y = '0'
      report "Test 3b failed: output should fall after half a period" severity error;
    wait for period / 2 - 2 ns;
    assert y = '0'
      report "Test 3c failed: output rose before the full period" severity error;
    wait for 2 ns;
    assert y = '1'
      report "Test 3d failed: output should rise again after a full period" severity error;

    -- Test 4: the REQTIM property.  The timeout flags are registered by the
    -- 74LS273 at 0B01, so a flag the PROM raises in state 5 reaches the board
    -- on the sixth edge.  MIT labels that 10 uSec, so the sixth rising edge
    -- must fall exactly five periods after the enable.
    wait until t_sixth /= 0 ns for 12 us;
    assert edges = 6
      report "Test 4a failed: expected six rising edges by now" severity error;
    assert t_first = t_en
      report "Test 4b failed: first rising edge is not at the enable" severity error;
    assert t_sixth = t_en + 5 * period
      report "Test 4c failed: sixth rising edge is not five periods after the enable"
      severity error;

    -- Test 5: disable part way through a half period, output goes low at once
    wait until y = '1';
    wait for period / 4;
    en_n <= '1';
    wait for 1 ns;
    assert y = '0'
      report "Test 5a failed: output should go low as soon as it is disabled" severity error;
    wait for 3 us;
    assert y = '0'
      report "Test 5b failed: output should stay low while disabled" severity error;

    -- Test 6: 'Z' on the enable input reads as high, so still disabled
    en_n <= 'Z';
    wait for 3 us;
    assert y = '0'
      report "Test 6 failed: 'Z' on enable should keep the oscillator disabled" severity error;

    -- Test 7: the period generic is honoured
    en_n_f <= '0';
    wait for 1 ns;
    assert y_f = '1'
      report "Test 7a failed: fast instance should rise at the enable" severity error;
    wait for 48 ns;
    assert y_f = '1'
      report "Test 7b failed: fast instance fell before its half period" severity error;
    wait for 4 ns;
    assert y_f = '0'
      report "Test 7c failed: fast instance should fall 50 ns after the enable" severity error;
    wait for 46 ns;
    assert y_f = '0'
      report "Test 7d failed: fast instance rose before its full period" severity error;
    wait for 4 ns;
    assert y_f = '1'
      report "Test 7e failed: fast instance should rise 100 ns after the enable" severity error;

    -- leave both oscillators disabled so the simulation runs out of events
    en_n_f <= '1';
    wait for 1 ns;

    wait;
  end process;

end architecture;
