-- Hex D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74174 is
  port (
    clk   : in std_logic;
    clr_n : in std_logic;

    d1 : in  std_logic;
    d2 : in  std_logic;
    d3 : in  std_logic;
    d4 : in  std_logic;
    d5 : in  std_logic;
    d6 : in  std_logic;
    q1 : out std_logic;
    q2 : out std_logic;
    q3 : out std_logic;
    q4 : out std_logic;
    q5 : out std_logic;
    q6 : out std_logic
    );
end;

architecture structural of sn74174 is
  signal clk_i, clr_n_i, d1_i, d2_i, d3_i, d4_i, d5_i, d6_i : std_logic;
begin

  clk_i <= ttl_input(clk);
  clr_n_i <= ttl_input(clr_n);
  d1_i <= ttl_input(d1);
  d2_i <= ttl_input(d2);
  d3_i <= ttl_input(d3);
  d4_i <= ttl_input(d4);
  d5_i <= ttl_input(d5);
  d6_i <= ttl_input(d6);

  u1 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d1_i, q => q1, q_n => open, enb_n => '0', pre => '1');
  u2 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d2_i, q => q2, q_n => open, enb_n => '0', pre => '1');
  u3 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d3_i, q => q3, q_n => open, enb_n => '0', pre => '1');
  u4 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d4_i, q => q4, q_n => open, enb_n => '0', pre => '1');
  u5 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d5_i, q => q5, q_n => open, enb_n => '0', pre => '1');
  u6 : entity work.ff_dpc port map (clk => clk_i, clr => clr_n_i, d => d6_i, q => q6, q_n => open, enb_n => '0', pre => '1');

end;