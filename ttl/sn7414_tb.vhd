library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn7414_tb is
end;

architecture testbench of sn7414_tb is

  signal g1a, g1q_n : std_logic;
  signal g2a, g2q_n : std_logic;
  signal g3a, g3q_n : std_logic;
  signal g4a, g4q_n : std_logic;
  signal g5a, g5q_n : std_logic;
  signal g6a, g6q_n : std_logic;

begin

  uut : sn7414 port map(
    g1a => g1a, g1q_n => g1q_n,
    g2a => g2a, g2q_n => g2q_n,
    g3a => g3a, g3q_n => g3q_n,
    g4a => g4a, g4q_n => g4q_n,
    g5a => g5a, g5q_n => g5q_n,
    g6a => g6a, g6q_n => g6q_n
    );

  process

    type pt is record
      i0 : std_logic;
      q  : std_logic;
    end record;
    type pa is array (natural range <>) of pt;

    constant p : pa :=
      (('0', '1'),
       ('1', '0'));

  begin
    for i in p'range loop
      g1a <= p(i).i0;
      g2a <= p(i).i0;
      g3a <= p(i).i0;
      g4a <= p(i).i0;
      g5a <= p(i).i0;
      g6a <= p(i).i0;

      wait for 1 ns;

      assert g1q_n = p(i).q;
      assert g2q_n = p(i).q;
      assert g3q_n = p(i).q;
      assert g4q_n = p(i).q;
      assert g5q_n = p(i).q;
      assert g6q_n = p(i).q;
    end loop;

    wait;
  end process;

end;
