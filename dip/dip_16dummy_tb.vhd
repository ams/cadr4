library ieee;
use ieee.std_logic_1164.all;

library dip;
use dip.dip.all;

library ttl;
use ttl.unsorted.all;

entity dip_16dummy_tb is
end entity;

architecture test of dip_16dummy_tb is

  -- dip_16dummy signals
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;
  signal p16_dip : std_logic;

  -- ic_16dummy signals
  signal power_reset_ttl : std_logic;
  signal boot2_ttl       : std_logic;
  signal boot1_ttl       : std_logic;
  signal hi2_ttl         : std_logic;
  signal hi1_ttl         : std_logic;

begin

  -- Instantiate wrapper
  U_dip_16dummy : dip_16dummy
    port map (
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip,
      p16 => p16_dip
    );

  -- Instantiate original component
  U_ic_16dummy : ic_16dummy
    port map (
      \-power_reset\ => power_reset_ttl,
      \-boot2\       => boot2_ttl,
      \-boot1\       => boot1_ttl,
      hi2            => hi2_ttl,
      hi1            => hi1_ttl
    );

  -- Verification process
  process is
  begin
    wait for 1 ns;

    assert p12_dip = power_reset_ttl report "p12 mismatch" severity failure;
    assert p13_dip = boot2_ttl report "p13 mismatch" severity failure;
    assert p14_dip = boot1_ttl report "p14 mismatch" severity failure;
    assert p15_dip = hi2_ttl report "p15 mismatch" severity failure;
    assert p16_dip = hi1_ttl report "p16 mismatch" severity failure;

    report "dip_16dummy test passed.";
    wait;
  end process;

end architecture; 