library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.sn74.sn74s188;

entity sn74s188_tb is
end;

architecture testbench of sn74s188_tb is

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

  constant expected : std_logic_vector := load_rom_file("rom/dspctl_2f22.hex");

begin

  uut : sn74s188
    generic map(fn => "rom/dspctl_2f22.hex")
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
      expected_data := expected(i * 8 + 7 downto i * 8);
      assert (o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = expected_data
        report "Mismatch at address " & integer'image(i)
        severity error;
    end loop;

    wait;
  end process;

end;
