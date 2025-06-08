library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.dip.all;


entity dip_5610_tb is
end entity;

architecture test of dip_5610_tb is
  constant rom_file : string := "../rom/mskg4_2d12.hex";

  -- Inputs
  signal a    : std_logic_vector(4 downto 0);
  signal ce_n : std_logic;

  -- Outputs from DIP wrapper
  signal o_dip : std_logic_vector(7 downto 0);

  -- Outputs from TTL component
  signal o_ttl : std_logic_vector(7 downto 0);

  -- DIP component ports
  signal p1, p2, p3, p4, p5, p6, p7, p9 : std_logic;

begin

  -- Instantiate the wrapper
  dut_dip : entity work.dip_5610
    generic map(
      fn => rom_file)
    port map(
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p7  => p7,
      p9  => p9,
      p10 => a(0),
      p11 => a(1),
      p12 => a(2),
      p13 => a(3),
      p14 => a(4),
      p15 => ce_n);

  -- Concatenate DIP outputs
  o_dip <= p9 & p7 & p6 & p5 & p4 & p3 & p2 & p1;

  -- Instantiate the actual TTL component for verification
  dut_ttl : entity work.im5600
    generic map(
      fn => rom_file)
    port map(
      a0   => a(0),
      a1   => a(1),
      a2   => a(2),
      a3   => a(3),
      a4   => a(4),
      ce_n => ce_n,
      o0   => o_ttl(0),
      o1   => o_ttl(1),
      o2   => o_ttl(2),
      o3   => o_ttl(3),
      o4   => o_ttl(4),
      o5   => o_ttl(5),
      o6   => o_ttl(6),
      o7   => o_ttl(7));

  -- Stimulus process
  stim_proc : process
  begin
    ce_n <= '1';
    for i in 0 to 31 loop
      a <= std_logic_vector(to_unsigned(i, 5));
      wait for 10 ns;
    end loop;

    ce_n <= '0';
    for i in 0 to 31 loop
      a <= std_logic_vector(to_unsigned(i, 5));
      wait for 10 ns;
    end loop;

    -- report "Test finished.";
    wait;
  end process;

  -- Checker process
  check_proc : process
  begin
    loop
      wait on a, ce_n;
      if now > 0 ns then
        wait for 1 ns;  -- Wait for propagation delay
        assert o_dip = o_ttl
          report "Mismatch between DIP and TTL component"
          severity error;
      end if;
    end loop;
  end process;

end architecture; 