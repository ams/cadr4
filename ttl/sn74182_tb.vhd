library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74182_tb is
end;

architecture testbench of sn74182_tb is

  signal cin_n   : std_logic;
  signal y0      : std_logic;
  signal x0      : std_logic;
  signal cout0_n : std_logic;
  signal y1      : std_logic;
  signal x1      : std_logic;
  signal cout1_n : std_logic;
  signal y2      : std_logic;
  signal x2      : std_logic;
  signal cout2_n : std_logic;
  signal y3      : std_logic;
  signal x3      : std_logic;
  signal yout    : std_logic;
  signal xout    : std_logic;

begin

  uut : sn74182 port map(
    xout => xout,
    yout => yout,
    x3   => x3,
    y3   => y3,

    cout2_n => cout2_n,
    x2      => x2,
    y2      => y2,

    cout1_n => cout1_n,
    x1      => x1,
    y1      => y1,

    cout0_n => cout0_n,
    x0      => x0,
    y0      => y0,

    cin_n => cin_n
    );

  process
    type gpt is record
      y3, y2, y1, y0 : std_logic;
      x3, x2, x1 : std_logic;
      y : std_logic;
    end record;
    type gpa is array (natural range <>) of gpt;

    type ppt is record
      x3, x2, x1, x0 : std_logic;
      x : std_logic;
    end record;
    type ppa is array (natural range <>) of ppt;

    type cxpt is record
      y0, x0, cn : std_logic;
      cx : std_logic;
    end record;
    type cxpa is array (natural range <>) of cxpt;

    type cypt is record
      y1, y0, x1, x0, cn : std_logic;
      cy : std_logic;
    end record;
    type cypa is array (natural range <>) of cypt;

    type czpt is record
      y2, y1, y0, x2, x1, x0, cn : std_logic;
      cz : std_logic;
    end record;
    type czpa is array (natural range <>) of czpt;

    constant g : gpa :=
      (('0', '1', '1', '0', '1', '1', '0', '0'),
       ('1', '0', '1', '0', '0', '1', '0', '0'),
       ('1', '0', '0', '1', '0', '0', '0', '0'),
       ('1', '0', '1', '0', '0', '0', '0', '0'),
       ('1', '1', '1', '0', '1', '0', '0', '1'),
       ('1', '1', '1', '0', '1', '0', '0', '1'),
       ('1', '1', '1', '0', '1', '1', '0', '1'),
       ('1', '0', '1', '0', '1', '1', '1', '1'));

    constant p : ppa :=
      (('0', '0', '0', '0', '0'),
       ('0', '1', '0', '0', '1'),
       ('0', '0', '1', '0', '1'),
       ('1', '0', '0', '0', '1'),
       ('0', '1', '0', '0', '1'),
       ('1', '1', '0', '0', '1'),
       ('1', '1', '0', '1', '1'),
       ('1', '1', '1', '1', '1'));

    constant cx : cxpa :=
      (('0', '0', '0', '1'),
       ('0', '0', '1', '1'),
       ('0', '1', '0', '1'),
       ('0', '1', '1', '1'),
       ('1', '0', '1', '1'),
       ('1', '0', '0', '0'),
       ('1', '0', '1', '1'),
       ('1', '1', '1', '0'));

    constant cy : cypa :=
      (('0', '1', '1', '1', '1', '1'),
       ('0', '0', '1', '1', '1', '1'),
       ('0', '1', '0', '1', '1', '1'),
       ('0', '1', '0', '1', '0', '1'),
       ('0', '1', '0', '1', '1', '1'),
       ('0', '0', '0', '1', '1', '1'),
       ('0', '1', '0', '0', '1', '1'),
       ('1', '1', '0', '0', '0', '0'));

    constant cz : czpa :=
      (('0', '0', '0', '0', '0', '0', '0', '1'),
       ('1', '0', '1', '0', '0', '0', '0', '1'),
       ('1', '1', '0', '0', '0', '1', '0', '1'),
       ('1', '1', '1', '0', '0', '0', '1', '1'),
       ('1', '1', '1', '1', '0', '0', '1', '0'),
       ('1', '1', '1', '1', '1', '0', '1', '0'),
       ('1', '1', '1', '1', '1', '1', '1', '0'));

  begin
    for i in g'range loop
      y3 <= g(i).y3; y2 <= g(i).y2; y1 <= g(i).y1; y0 <= g(i).y0;
      x3 <= g(i).x3; x2 <= g(i).x2; x1 <= g(i).x1;
      wait for 3 ns;
      assert yout = g(i).y report "failure in case: " & integer'image(i);
    end loop;

    for i in p'range loop
      x3 <= p(i).x3; x2 <= p(i).x2; x1 <= p(i).x1; x0 <= p(i).x0;
      wait for 3 ns;
      assert xout = p(i).x report "failure in case: " & integer'image(i);
    end loop;

    for i in cx'range loop
      y0 <= cx(i).y0;
      x0 <= cx(i).x0;
      cin_n <= cx(i).cn;
      wait for 3 ns;
      assert cout0_n = cx(i).cx report "failure in case: " & integer'image(i);
    end loop;

    for i in cy'range loop
      y1 <= cy(i).y1; y0 <= cy(i).y0;
      x1 <= cy(i).x1; x0 <= cy(i).x0;
      cin_n <= cy(i).cn;
      wait for 3 ns;
      assert cout1_n = cy(i).cy report "failure in case: " & integer'image(i);
    end loop;

    for i in cz'range loop
      y2 <= cz(i).y2; y1 <= cz(i).y1; y0 <= cz(i).y0;
      x2 <= cz(i).x2; x1 <= cz(i).x1; x0 <= cz(i).x0;
      cin_n <= cz(i).cn;
      wait for 3 ns;
      assert cout2_n = cz(i).cz report "failure in case: " & integer'image(i);
    end loop;

    wait;
  end process;

end;
