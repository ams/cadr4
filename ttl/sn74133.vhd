-- 13-Input Positive-NAND Gate

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74133 is
  port (
    a   : in  std_logic; -- Pin 1
    b   : in  std_logic; -- Pin 2
    c   : in  std_logic; -- Pin 3
    d   : in  std_logic; -- Pin 4
    e   : in  std_logic; -- Pin 5
    f   : in  std_logic; -- Pin 6
    h   : in  std_logic; -- Pin 10
    i   : in  std_logic; -- Pin 11
    j   : in  std_logic; -- Pin 12
    k   : in  std_logic; -- Pin 13
    l   : in  std_logic; -- Pin 14
    m   : in  std_logic; -- Pin 15
    g   : in  std_logic; -- Pin 9
    q_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn74133 is
  signal a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i, i_i, j_i, k_i, l_i, m_i : std_logic;
begin

  a_i <= ttl_input(a);
  b_i <= ttl_input(b);
  c_i <= ttl_input(c);
  d_i <= ttl_input(d);
  e_i <= ttl_input(e);
  f_i <= ttl_input(f);
  g_i <= ttl_input(g);
  h_i <= ttl_input(h);
  i_i <= ttl_input(i);
  j_i <= ttl_input(j);
  k_i <= ttl_input(k);
  l_i <= ttl_input(l);
  m_i <= ttl_input(m);

  q_n <= not (a_i and b_i and c_i and d_i and e_i and f_i and g_i and h_i and i_i and j_i and k_i and l_i and m_i);

end;
