library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74153_tb is
end;

architecture testbench of sn74153_tb is

  signal enb2_n : std_logic;
  signal sel0   : std_logic;
  signal g2c3   : std_logic;
  signal g2c2   : std_logic;
  signal g2c1   : std_logic;
  signal g2c0   : std_logic;
  signal g2q    : std_logic;
  signal g1q    : std_logic;
  signal g1c0   : std_logic;
  signal g1c1   : std_logic;
  signal g1c2   : std_logic;
  signal g1c3   : std_logic;
  signal sel1   : std_logic;
  signal enb1_n : std_logic;

begin

  uut : sn74153 port map(
    enb1_n => enb1_n,
    sel1   => sel1,
    g1c3   => g1c3,
    g1c2   => g1c2,
    g1c1   => g1c1,
    g1c0   => g1c0,
    g1q    => g1q,
    g2q    => g2q,
    g2c0   => g2c0,
    g2c1   => g2c1,
    g2c2   => g2c2,
    g2c3   => g2c3,
    sel0   => sel0,
    enb2_n => enb2_n
    );

  process
    type test_vec is record
      c0, c1, c2, c3: std_logic;
      b, a: std_logic;
      o: std_logic;
    end record;
    type test_vecs is array (natural range <>) of test_vec;

    constant tests : test_vecs :=
      (('0', '1', '1', '1', '0', '0', '0'),
       ('1', '1', '1', '1', '0', '0', '1'),
       ('1', '0', '1', '1', '0', '1', '0'),
       ('1', '1', '1', '1', '0', '1', '1'),
       ('1', '1', '0', '1', '1', '0', '0'),
       ('1', '1', '1', '1', '1', '0', '1'),
       ('1', '1', '1', '0', '1', '1', '0'),
       ('1', '1', '1', '1', '1', '1', '1'));

  begin
    for i in tests'range loop
      g1c0 <= tests(i).c0;
      g1c1 <= tests(i).c1;
      g1c2 <= tests(i).c2;
      g1c3 <= tests(i).c3;
      sel1 <= tests(i).b;
      sel0 <= tests(i).a;
      enb1_n <= '1';
      wait for 5 ns;
      assert g1q = '0' report "strobe 1 failure case: " & integer'image(i);
    end loop;

    for i in tests'range loop
      g2c0 <= tests(i).c0;
      g2c1 <= tests(i).c1;
      g2c2 <= tests(i).c2;
      g2c3 <= tests(i).c3;
      sel1 <= tests(i).b;
      sel0 <= tests(i).a;
      enb2_n <= '1';
      wait for 5 ns;
      assert g2q = '0' report "strobe 2 failure case: " & integer'image(i);
    end loop;

    for i in tests'range loop
      enb1_n <= '0';
      g1c0 <= tests(i).c0;
      g1c1 <= tests(i).c1;
      g1c2 <= tests(i).c2;
      g1c3 <= tests(i).c3;
      sel1 <= tests(i).b;
      sel0 <= tests(i).a;
      wait for 5 ns;
      assert g1q = tests(i).o report "sel 1 failure case: " & integer'image(i);
    end loop;

    for i in tests'range loop
      enb2_n <= '0';
      g2c0 <= tests(i).c0;
      g2c1 <= tests(i).c1;
      g2c2 <= tests(i).c2;
      g2c3 <= tests(i).c3;
      sel1 <= tests(i).b;
      sel0 <= tests(i).a;
      wait for 5 ns;
      assert g2q = tests(i).o report "sel 2 failure case: " & integer'image(i);
    end loop;

    wait;
  end process;

end;
