-- 13-Input Positive-NAND Gate
-- Pin numbers below follow the datasheet (A..G = pins 1..7). dip_74s133 wires
-- a..g to pins 7..1 (reversed), which is equivalent for a 13-input NAND.

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74133 is
  port (
    a   : in  std_logic;  -- Pin 1 (A)
    b   : in  std_logic;  -- Pin 2 (B)
    c   : in  std_logic;  -- Pin 3 (C)
    d   : in  std_logic;  -- Pin 4 (D)
    e   : in  std_logic;  -- Pin 5 (E)
    f   : in  std_logic;  -- Pin 6 (F)
    h   : in  std_logic;  -- Pin 10 (H)
    i   : in  std_logic;  -- Pin 11 (I)
    j   : in  std_logic;  -- Pin 12 (J)
    k   : in  std_logic;  -- Pin 13 (K)
    l   : in  std_logic;  -- Pin 14 (L)
    m   : in  std_logic;  -- Pin 15 (M)
    g   : in  std_logic;  -- Pin 7 (G)
    q_n : out std_logic   -- Pin 9 (Y)
    );
end entity;

architecture functional of sn74133 is
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

end architecture;
