library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74280_tb is
end entity;

architecture testbench of sn74280_tb is

  signal i8   : std_logic;
  signal i7   : std_logic;
  signal i6   : std_logic;
  signal i5   : std_logic;
  signal i4   : std_logic;
  signal i3   : std_logic;
  signal odd  : std_logic;
  signal even : std_logic;
  signal i2   : std_logic;
  signal i1   : std_logic;
  signal i0   : std_logic;

begin

  uut : sn74280 port map(
    i0   => i0,
    i1   => i1,
    i2   => i2,
    even => even,
    odd  => odd,
    i3   => i3,
    i4   => i4,
    i5   => i5,
    i6   => i6,
    i7   => i7,
    i8   => i8
    );

  process
    type test_vec is record
      i0, i1, i2, i3, i4, i5, i6, i7, i8: std_logic;
      e, o: std_logic;
    end record;
    type test_vecs is array (natural range <>) of test_vec;

    constant tests : test_vecs :=
      (('0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
       ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
       ('1', '0', '1', '0', '1', '0', '1', '0', '0', '1', '0'),
       ('1', '1', '1', '1', '1', '0', '1', '0', '0', '1', '0'),
       ('1', '0', '1', '1', '1', '0', '1', '0', '0', '0', '1'),
       ('1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1'));

  begin
    for i in tests'range loop
      i0 <= tests(i).i0;
      i1 <= tests(i).i1;
      i2 <= tests(i).i2;
      i3 <= tests(i).i3;
      i4 <= tests(i).i4;
      i5 <= tests(i).i5;
      i6 <= tests(i).i6;
      i7 <= tests(i).i7;
      i8 <= tests(i).i8;
      wait for 5 ns;
      assert even = tests(i).e report "failure in case: " & integer'image(i);
      assert odd = tests(i).o report "failure in case: " & integer'image(i);
    end loop;
    wait;
  end process;

end architecture;
