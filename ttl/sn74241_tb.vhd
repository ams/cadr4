library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74241_tb is
end;

architecture testbench of sn74241_tb is

  signal benb   : std_logic;
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

  uut : sn74241 port map(
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
    benb   => benb
    );

  process
  begin
    -- Initialize
    aenb_n <= '1';
    benb <= '0';
    ain0 <= '0'; ain1 <= '0'; ain2 <= '0'; ain3 <= '0';
    bin0 <= '0'; bin1 <= '0'; bin2 <= '0'; bin3 <= '0';
    wait for 10 ns;

    -- Test 1: A outputs enabled, B outputs disabled
    aenb_n <= '0';
    benb <= '0';
    ain0 <= '1'; ain1 <= '0'; ain2 <= '1'; ain3 <= '0';
    wait for 10 ns;
    assert aout0 = '1' and aout1 = '0' and aout2 = '1' and aout3 = '0'
      report "A outputs not matching inputs";
    assert bout0 = 'Z' and bout1 = 'Z' and bout2 = 'Z' and bout3 = 'Z'
      report "B outputs not high-Z when disabled";

    -- Test 2: A outputs disabled, B outputs enabled
    aenb_n <= '1';
    benb <= '1';
    bin0 <= '0'; bin1 <= '1'; bin2 <= '0'; bin3 <= '1';
    wait for 10 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and aout2 = 'Z' and aout3 = 'Z'
      report "A outputs not high-Z when disabled";
    assert bout0 = '0' and bout1 = '1' and bout2 = '0' and bout3 = '1'
      report "B outputs not matching inputs";

    -- Test 3: Both outputs disabled
    aenb_n <= '1';
    benb <= '0';
    wait for 10 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and aout2 = 'Z' and aout3 = 'Z'
      report "A outputs not high-Z when disabled";
    assert bout0 = 'Z' and bout1 = 'Z' and bout2 = 'Z' and bout3 = 'Z'
      report "B outputs not high-Z when disabled";

    wait;
  end process;

end;
