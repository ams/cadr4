library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;

use work.other.all;

entity dip_16dummy_tb is
end entity;

architecture tb of dip_16dummy_tb is
  signal p12, p13, p14, p15, p16 : std_logic;

  signal power_reset, boot1, boot2, hi1, hi2 : std_logic;
begin

  UUT_DIP : component dip_16dummy
    port map (
      p12 => p12,
      p13 => p13,
      p14 => p14,
      p15 => p15,
      p16 => p16
    );

  UUT_TTL : entity work.ic_16dummy
    port map (
      \-power_reset\ => power_reset,
      \-boot1\       => boot1,
      \-boot2\       => boot2,
      hi1            => hi1,
      hi2            => hi2
    );

  process is
  begin
    wait for 1 ns;
    assert p12 = power_reset report "p12 mismatch" severity failure;
    assert p13 = boot2 report "p13 mismatch" severity failure;
    assert p14 = boot1 report "p14 mismatch" severity failure;
    assert p15 = hi2 report "p15 mismatch" severity failure;
    assert p16 = hi1 report "p16 mismatch" severity failure;
    wait;
  end process;

end architecture;