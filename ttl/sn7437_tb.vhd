library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7437_tb is
end;

architecture testbench of sn7437_tb is

  signal g1a, g1b, g1y : std_logic;
  signal g2a, g2b, g2y : std_logic;
  signal g3a, g3b, g3y : std_logic;
  signal g4a, g4b, g4y : std_logic;

begin

  uut : sn7437 port map(
    g1a => g1a, g1b => g1b, g1y => g1y,
    g2a => g2a, g2b => g2b, g2y => g2y,
    g3a => g3a, g3b => g3b, g3y => g3y,
    g4a => g4a, g4b => g4b, g4y => g4y
    );

  process
    type pt is record
      a, b : std_logic;
      y    : std_logic;
    end record;
    type pa is array(natural range <>) of pt;
    constant p : pa :=
      (('0','0','1'),
       ('0','1','1'),
       ('1','0','1'),
       ('1','1','0'));
  begin
    for i in p'range loop
      g1a <= p(i).a; g1b <= p(i).b;
      g2a <= p(i).a; g2b <= p(i).b;
      g3a <= p(i).a; g3b <= p(i).b;
      g4a <= p(i).a; g4b <= p(i).b;

      wait for 1 ns;
      assert g1y = p(i).y;
      assert g2y = p(i).y;
      assert g3y = p(i).y;
      assert g4y = p(i).y;
    end loop;

    wait;
  end process;

end;
