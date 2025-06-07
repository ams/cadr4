library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn7451_tb is
end;

architecture testbench of sn7451_tb is

  signal g1a, g1b, g1c, g1d, g1y : std_logic;
  signal g2a, g2b, g2c, g2d, g2y : std_logic;

begin

  uut : sn7451 port map(
    g1a => g1a, g1b => g1b, g1c => g1c, g1d => g1d, g1y => g1y,
    g2a => g2a, g2b => g2b, g2c => g2c, g2d => g2d, g2y => g2y
    );

  process
    type pt is record
      i0, i1, i2, i3 : std_logic;
      q              : std_logic;
    end record;
    type pa is array (natural range <>) of pt;
    constant p : pa := (
      ('0','0','0','0','1'), ('0','0','0','1','1'), ('0','0','1','0','1'),
      ('0','0','1','1','0'), ('0','1','0','0','1'), ('0','1','0','1','1'),
      ('0','1','1','0','1'), ('0','1','1','1','0'), ('1','0','0','0','1'),
      ('1','0','0','1','1'), ('1','0','1','0','1'), ('1','0','1','1','0'),
      ('1','1','0','0','0'), ('1','1','0','1','0'), ('1','1','1','0','0'),
      ('1','1','1','1','0'));
  begin
    for i in p'range loop
      g1a <= p(i).i0; g1b <= p(i).i1; g1c <= p(i).i2; g1d <= p(i).i3;
      g2a <= p(i).i0; g2b <= p(i).i1; g2c <= p(i).i2; g2d <= p(i).i3;
      wait for 1 ns;
      assert g1y = p(i).q;
      assert g2y = p(i).q;
    end loop;
    wait;
  end process;

end;
