library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74244_tb is
end;

architecture testbench of sn74244_tb is

  signal benb_n : std_logic;
  signal aout0  : std_logic;
  signal bin3   : std_logic;
  signal aout1  : std_logic;
  signal bin2   : std_logic;
  signal aout2  : std_logic;
  signal bin1   : std_logic;
  signal aout3  : std_logic;
  signal bin0   : std_logic;
  signal bout0  : std_logic;
  signal ain3   : std_logic;
  signal bout1  : std_logic;
  signal ain2   : std_logic;
  signal bout2  : std_logic;
  signal ain1   : std_logic;
  signal bout3  : std_logic;
  signal ain0   : std_logic;
  signal aenb_n : std_logic;

begin

  uut : sn74244 port map(
    aenb_n => aenb_n,
    ain0   => ain0,
    bout3  => bout3,
    ain1   => ain1,
    bout2  => bout2,
    ain2   => ain2,
    bout1  => bout1,
    ain3   => ain3,
    bout0  => bout0,
    bin0   => bin0,
    aout3  => aout3,
    bin1   => bin1,
    aout2  => aout2,
    bin2   => bin2,
    aout1  => aout1,
    bin3   => bin3,
    aout0  => aout0,
    benb_n => benb_n
    );

  process
  begin
    -- A side enabled
    ain0 <= '0'; ain1 <= '1'; ain2 <= '0'; ain3 <= '1';
    aenb_n <= '0';
    wait for 1 ns;
    assert aout0 = ain0 and aout1 = ain1 and aout2 = ain2 and aout3 = ain3;

    -- A side disabled
    aenb_n <= '1';
    wait for 1 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and aout2 = 'Z' and aout3 = 'Z';

    -- B side enabled
    bin0 <= '1'; bin1 <= '0'; bin2 <= '1'; bin3 <= '0';
    benb_n <= '0';
    wait for 1 ns;
    assert bout0 = bin0 and bout1 = bin1 and bout2 = bin2 and bout3 = bin3;

    -- B side disabled
    benb_n <= '1';
    wait for 1 ns;
    assert bout0 = 'Z' and bout1 = 'Z' and bout2 = 'Z' and bout3 = 'Z';

    wait;
  end process;

end;
