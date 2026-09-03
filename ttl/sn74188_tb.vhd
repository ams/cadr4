library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.sn74.sn74188;
use work.misc.load_hex_file;

entity sn74188_tb is
end entity;

architecture testbench of sn74188_tb is

  -- Initialize signals to avoid metavalue assertions from ieee.numeric_std
  signal o7   : std_logic := '0';
  signal o6   : std_logic := '0';
  signal o5   : std_logic := '0';
  signal o4   : std_logic := '0';
  signal o3   : std_logic := '0';
  signal o2   : std_logic := '0';
  signal o1   : std_logic := '0';
  signal o0   : std_logic := '0';
  signal a4   : std_logic := '0';
  signal a3   : std_logic := '0';
  signal a2   : std_logic := '0';
  signal a1   : std_logic := '0';
  signal a0   : std_logic := '0';
  signal ce_n : std_logic := '0';

  constant expected : work.misc.word_array_t(0 to 31)(7 downto 0) := load_hex_file("rom/dspctl.2f22.hex", 32, 8);

begin

  uut : sn74188
    generic map(fn => "rom/dspctl.2f22.hex")
    port map(
      o7   => o7,
      o6   => o6,
      o5   => o5,
      o4   => o4,
      o3   => o3,
      o2   => o2,
      o1   => o1,
      o0   => o0,
      a4   => a4,
      a3   => a3,
      a2   => a2,
      a1   => a1,
      a0   => a0,
      ce_n => ce_n
      );

  process
    variable addr : unsigned(4 downto 0);
    variable expected_data : std_logic_vector(7 downto 0);
    variable actual_data : std_logic_vector(7 downto 0);
  begin
    ce_n <= '0';
    for i in 0 to 31 loop
      addr := to_unsigned(i, 5);
      a4 <= addr(4);
      a3 <= addr(3);
      a2 <= addr(2);
      a1 <= addr(1);
      a0 <= addr(0);
      wait for 1 ns;
      expected_data := expected(i);
      
      -- Convert open-collector outputs: 'Z' means '1', '0' means '0'
      actual_data(7) := '1' when o7 = 'Z' else '0';
      actual_data(6) := '1' when o6 = 'Z' else '0';
      actual_data(5) := '1' when o5 = 'Z' else '0';
      actual_data(4) := '1' when o4 = 'Z' else '0';
      actual_data(3) := '1' when o3 = 'Z' else '0';
      actual_data(2) := '1' when o2 = 'Z' else '0';
      actual_data(1) := '1' when o1 = 'Z' else '0';
      actual_data(0) := '1' when o0 = 'Z' else '0';
      
      assert actual_data = expected_data
        report "Mismatch at address " & integer'image(i)
        severity error;
    end loop;

    -- CE high: all outputs float. Address 0 holds 00, so every output is
    -- driven low while enabled and must float once the chip is disabled.
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    ce_n <= '0';
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "00000000"
      report "Address 0 should drive all outputs low" severity error;
    ce_n <= '1';
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "ZZZZZZZZ"
      report "CE high: all outputs should float" severity error;
    ce_n <= '0';

    -- A few words compared against values read by hand from
    -- rom/dspctl.2f22.hex (lines 1, 5, 8, 32), independent of load_hex_file.
    -- Open-collector outputs: '0' for a 0 bit, 'Z' for a 1 bit.
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "00000000"
      report "Address 0 should be 00" severity error;
    a2 <= '1'; -- address 4: 0f
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "0000ZZZZ"
      report "Address 4 should be 0f" severity error;
    a1 <= '1'; a0 <= '1'; -- address 7: 7f
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "0ZZZZZZZ"
      report "Address 7 should be 7f" severity error;
    a4 <= '1'; a3 <= '1'; -- address 31: 00
    wait for 1 ns;
    assert std_logic_vector'(o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "00000000"
      report "Address 31 should be 00" severity error;

    wait;
  end process;

end architecture;
