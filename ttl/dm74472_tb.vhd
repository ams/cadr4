library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.other.all;
use work.misc.all;

entity dm74472_tb is
end;

architecture testbench of dm74472_tb is

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

  constant expected : std_logic_vector := load_rom_file("rom/promh9.1b17.hex");

begin

  uut : dm74472
    generic map(fn => "rom/promh9.1b17.hex")
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
      expected_data := expected(i * 8 + 7 downto i * 8);
      assert (d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0) = expected_data
        report "Mismatch at address " & integer'image(i)
        severity error;
    end loop;

    wait;
  end process;

end;
