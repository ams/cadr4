library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.sn74.sn74472;
use work.misc.load_hex_file;

entity sn74472_tb is
end entity;

architecture testbench of sn74472_tb is

  -- Initialize signals to avoid metavalue assertions from ieee.numeric_std
  signal a8   : std_logic := '0';
  signal a7   : std_logic := '0';
  signal a6   : std_logic := '0';
  signal a5   : std_logic := '0';
  signal ce_n : std_logic := '0';
  signal d7   : std_logic := '0';
  signal d6   : std_logic := '0';
  signal d5   : std_logic := '0';
  signal d4   : std_logic := '0';
  signal d3   : std_logic := '0';
  signal d2   : std_logic := '0';
  signal d1   : std_logic := '0';
  signal d0   : std_logic := '0';
  signal a4   : std_logic := '0';
  signal a3   : std_logic := '0';
  signal a2   : std_logic := '0';
  signal a1   : std_logic := '0';
  signal a0   : std_logic := '0';

  constant expected : work.misc.word_array_t(0 to 511)(7 downto 0) := load_hex_file("doc/promh.9/promh9.1b17.hex", 512, 8);

begin

  uut : sn74472
    generic map(fn => "doc/promh.9/promh9.1b17.hex")
    port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    d0   => d0,
    d1   => d1,
    d2   => d2,
    d3   => d3,
    d4   => d4,
    d5   => d5,
    d6   => d6,
    d7   => d7,
    ce_n => ce_n,
    a5   => a5,
    a6   => a6,
    a7   => a7,
    a8   => a8
    );

  process
    variable addr : unsigned(8 downto 0);
    variable expected_data : std_logic_vector(7 downto 0);
  begin
    ce_n <= '0';
    for i in 0 to 511 loop
      addr := to_unsigned(i, 9);
      a8 <= addr(8);
      a7 <= addr(7);
      a6 <= addr(6);
      a5 <= addr(5);
      a4 <= addr(4);
      a3 <= addr(3);
      a2 <= addr(2);
      a1 <= addr(1);
      a0 <= addr(0);
      wait for 1 ns;
      expected_data := expected(i);
      assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = expected_data
        report "Mismatch at address " & integer'image(i)
        severity error;
    end loop;

    -- CE high: all outputs float
    a8 <= '0'; a7 <= '0'; a6 <= '0'; a5 <= '0'; a4 <= '0';
    a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    ce_n <= '1';
    wait for 1 ns;
    assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = "ZZZZZZZZ"
      report "CE high: all outputs should float" severity error;
    ce_n <= '0';

    -- A few words compared against values read by hand from
    -- doc/promh.9/promh9.1b17.hex (lines 1, 59, 63, 64), independent of
    -- load_hex_file.
    wait for 1 ns;
    assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = x"00"
      report "Address 0 should be 00" severity error;
    a5 <= '1'; a4 <= '1'; a3 <= '1'; a1 <= '1'; -- address 58: 34
    wait for 1 ns;
    assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = x"34"
      report "Address 58 should be 34" severity error;
    a2 <= '1'; -- address 62: 08
    wait for 1 ns;
    assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = x"08"
      report "Address 62 should be 08" severity error;
    a0 <= '1'; -- address 63: 09
    wait for 1 ns;
    assert std_logic_vector'(d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = x"09"
      report "Address 63 should be 09" severity error;

    wait;
  end process;

end architecture;
