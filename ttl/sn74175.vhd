-- Quad D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74175 is
  port (
    clk   : in std_logic;
    clr_n : in std_logic;

    d0 : in std_logic;
    d1 : in std_logic;
    d2 : in std_logic;
    d3 : in std_logic;

    q0   : out std_logic;
    q0_n : out std_logic;
    q1   : out std_logic;
    q1_n : out std_logic;
    q2   : out std_logic;
    q2_n : out std_logic;
    q3   : out std_logic;
    q3_n : out std_logic
    );
end entity;

architecture structural of sn74175 is
  signal clk_i, clr_n_i, d0_i, d1_i, d2_i, d3_i : std_logic;
begin

  clk_i <= ttl_input(clk);
  clr_n_i <= ttl_input(clr_n);
  d0_i <= ttl_input(d0);
  d1_i <= ttl_input(d1);
  d2_i <= ttl_input(d2);
  d3_i <= ttl_input(d3);

  u0 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d0_i, q => q0, q_n => q0_n, enb_n => '0', pre => '1');
  u1 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d1_i, q => q1, q_n => q1_n, enb_n => '0', pre => '1');
  u2 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d2_i, q => q2, q_n => q2_n, enb_n => '0', pre => '1');
  u3 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d3_i, q => q3, q_n => q3_n, enb_n => '0', pre => '1');

end architecture;
