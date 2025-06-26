-- Quad Two-Input High-Speed Register
-- AMD Am25S09
-- doc/ttl/am25s09.pdf

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity am25s09 is
  port (
    clk : in  std_logic;
    sel : in  std_logic;
    a0  : in  std_logic;
    a1  : in  std_logic;
    aq  : out std_logic;
    b0  : in  std_logic;
    b1  : in  std_logic;
    bq  : out std_logic;
    c0  : in  std_logic;
    c1  : in  std_logic;
    cq  : out std_logic;
    d0  : in  std_logic;
    d1  : in  std_logic;
    dq  : out std_logic
    );
end entity;

architecture ttl of am25s09 is

  signal clk_i, sel_i, a0_i, a1_i, b0_i, b1_i, c0_i, c1_i, d0_i, d1_i : std_logic;
  signal i0, i1, i2, i3 : std_logic;

begin

  clk_i <= ttl_input(clk);
  sel_i <= ttl_input(sel);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  b0_i <= ttl_input(b0);
  b1_i <= ttl_input(b1);
  c0_i <= ttl_input(c0);
  c1_i <= ttl_input(c1);
  d0_i <= ttl_input(d0);
  d1_i <= ttl_input(d1);

  i0 <= a1_i when to_x01(sel_i) = '1' else a0_i when to_x01(sel_i) = '0' else 'X';
  u0 : entity work.ff_dpc port map (clk => clk_i, d => i0, q => aq, q_n => open, enb_n => '0', pre => '1', clr => '1');

  i1 <= b1_i when to_x01(sel_i) = '1' else b0_i when to_x01(sel_i) = '0' else 'X';
  u1 : entity work.ff_dpc port map (clk => clk_i, d => i1, q => bq, q_n => open, enb_n => '0', pre => '1', clr => '1');

  i2 <= c1_i when to_x01(sel_i) = '1' else c0_i when to_x01(sel_i) = '0' else 'X';
  u2 : entity work.ff_dpc port map (clk => clk_i, d => i2, q => cq, q_n => open, enb_n => '0', pre => '1', clr => '1');

  i3 <= d1_i when to_x01(sel_i) = '1' else d0_i when to_x01(sel_i) = '0' else 'X';
  u3 : entity work.ff_dpc port map (clk => clk_i, d => i3, q => dq, q_n => open, enb_n => '0', pre => '1', clr => '1');

end architecture;
