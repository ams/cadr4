-- Hex Parallel D Registers with Register Enable
-- AMD Am25S07
-- doc/ttl/am25s07.pdf

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity am25s07 is
  port (
    i0    : in  std_logic;
    i1    : in  std_logic;
    i2    : in  std_logic;
    i3    : in  std_logic;
    i4    : in  std_logic;
    i5    : in  std_logic;
    d0    : out std_logic;
    d1    : out std_logic;
    d2    : out std_logic;
    d3    : out std_logic;
    d4    : out std_logic;
    d5    : out std_logic;
    clk   : in  std_logic;
    enb_n : in  std_logic
    );
end entity;

architecture structural of am25s07 is
  signal i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, clk_i, enb_n_i : std_logic;
begin

  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  i5_i <= ttl_input(i5);
  clk_i <= ttl_input(clk);
  enb_n_i <= ttl_input(enb_n);

  u1 : entity work.ff_dpc port map (clk => clk_i, d => i0_i, q => d0, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
  u2 : entity work.ff_dpc port map (clk => clk_i, d => i1_i, q => d1, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
  u3 : entity work.ff_dpc port map (clk => clk_i, d => i2_i, q => d2, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
  u4 : entity work.ff_dpc port map (clk => clk_i, d => i3_i, q => d3, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
  u5 : entity work.ff_dpc port map (clk => clk_i, d => i4_i, q => d4, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
  u6 : entity work.ff_dpc port map (clk => clk_i, d => i5_i, q => d5, q_n => open, enb_n => enb_n_i, pre => '1', clr => '1');
end architecture;
