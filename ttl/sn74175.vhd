-- Quad D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74175 is
  port (
    clk   : in std_logic; -- Pin 9 (CLK)
    clr_n : in std_logic; -- Pin 1 (CLR)

    d0 : in std_logic;    -- Pin 4 (1D)
    d1 : in std_logic;    -- Pin 5 (2D)
    d2 : in std_logic;    -- Pin 12 (3D)
    d3 : in std_logic;    -- Pin 13 (4D)

    q0   : out std_logic; -- Pin 2 (1Q)
    q0_n : out std_logic; -- Pin 3 (1Q_n)
    q1   : out std_logic; -- Pin 7 (2Q)
    q1_n : out std_logic; -- Pin 6 (2Q_n)
    q2   : out std_logic; -- Pin 10 (3Q)
    q2_n : out std_logic; -- Pin 11 (3Q_n)
    q3   : out std_logic; -- Pin 15 (4Q)
    q3_n : out std_logic  -- Pin 14 (4Q_n)
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
