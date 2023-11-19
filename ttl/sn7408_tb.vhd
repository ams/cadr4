library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7408_tb is
end;

architecture testbench of sn7408_tb is

  signal g1a, g1b, g1q : std_logic;
  signal g2a, g2b, g2q : std_logic;
  signal g3a, g3b, g3q : std_logic;
  signal g4a, g4b, g4q : std_logic;

begin

  uut : sn7408 port map(
    g1a => g1a, g1b => g1b, g1q => g1q,
    g2a => g2a, g2b => g2b, g2q => g2q,
    g3a => g3a, g3b => g3b, g3q => g3q,
    g4a => g4a, g4b => g4b, g4q => g4q
    );

  process
    type pt is record
      i0, i1 : std_logic;
      q      : std_logic;
    end record;
    type pa is array (natural range <>) of pt;

    constant p : pa :=
      (('0', '0', '0'),
       ('0', '1', '0'),
       ('1', '0', '0'),
       ('1', '1', '1'));

  begin
    for i in p'range loop
      g1a <= p(i).i0; g1b <= p(i).i1;
      g2a <= p(i).i0; g2b <= p(i).i1;
      g3a <= p(i).i0; g3b <= p(i).i1;
      g4a <= p(i).i0; g4b <= p(i).i1;

      wait for 1 ns;

      assert g1q = p(i).q;
      assert g2q = p(i).q;
      assert g3q = p(i).q;
      assert g4q = p(i).q;
    end loop;

    wait;
  end process;

end;
