library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

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
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
