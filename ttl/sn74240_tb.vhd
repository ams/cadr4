library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74240_tb is
end;

architecture testbench of sn74240_tb is

  signal aenb_n                     : std_logic;
  signal ain0, ain1, ain2, ain3     : std_logic;
  signal aout0, aout1, aout2, aout3 : std_logic;

  signal benb_n                     : std_logic;
  signal bin0, bin1, bin2, bin3     : std_logic;
  signal bout0, bout1, bout2, bout3 : std_logic;

begin

  uut : sn74240 port map(
    aenb_n => aenb_n,
    ain0   => ain0, ain1 => ain1, ain2 => ain2, ain3 => ain3,
    aout0  => aout0, aout1 => aout1, aout2 => aout2, aout3 => aout3,

    benb_n => benb_n,
    bin0   => bin0, bin1 => bin1, bin2 => bin2, bin3 => bin3,
    bout0  => bout0, bout1 => bout1, bout2 => bout2, bout3 => bout3
    );

  process
  begin
    -- A side enabled, outputs should be inverted
    ain0 <= '0'; ain1 <= '1'; ain2 <= '0'; ain3 <= '1';
    aenb_n <= '0';
    wait for 1 ns;
    assert aout0 = not ain0 and aout1 = not ain1 and
           aout2 = not ain2 and aout3 = not ain3;

    -- A side disabled, outputs high impedance
    aenb_n <= '1';
    wait for 1 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and
           aout2 = 'Z' and aout3 = 'Z';

    -- B side enabled, outputs should be inverted
    bin0 <= '1'; bin1 <= '0'; bin2 <= '1'; bin3 <= '0';
    benb_n <= '0';
    wait for 1 ns;
    assert bout0 = not bin0 and bout1 = not bin1 and
           bout2 = not bin2 and bout3 = not bin3;

    -- B side disabled, outputs high impedance
    benb_n <= '1';
    wait for 1 ns;
    assert bout0 = 'Z' and bout1 = 'Z' and
           bout2 = 'Z' and bout3 = 'Z';

    wait;
  end process;

end;
