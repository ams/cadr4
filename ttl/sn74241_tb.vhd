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
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
