library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74273 is
  port (
    clr_n : in  std_logic; -- Pin 1 (CLR)
    clk   : in  std_logic; -- Pin 11 (CLK)
    d0    : in  std_logic; -- Pin 3 (1D)
    d1    : in  std_logic; -- Pin 4 (2D)
    d2    : in  std_logic; -- Pin 7 (3D)
    d3    : in  std_logic; -- Pin 8 (4D)
    d4    : in  std_logic; -- Pin 13 (5D)
    d5    : in  std_logic; -- Pin 14 (6D)
    d6    : in  std_logic; -- Pin 17 (7D)
    d7    : in  std_logic; -- Pin 18 (8D)
    q0    : out std_logic; -- Pin 2 (1Q)
    q1    : out std_logic; -- Pin 5 (2Q)
    q2    : out std_logic; -- Pin 6 (3Q)
    q3    : out std_logic; -- Pin 9 (4Q)
    q4    : out std_logic; -- Pin 12 (5Q)
    q5    : out std_logic; -- Pin 15 (6Q)
    q6    : out std_logic; -- Pin 16 (7Q)
    q7    : out std_logic  -- Pin 19 (8Q)
    );
end;

architecture behavioral of sn74273 is
  signal clr_n_i, clk_i : std_logic;
  signal d0_i, d1_i, d2_i, d3_i, d4_i, d5_i, d6_i, d7_i : std_logic;
  signal q_int : std_logic_vector(7 downto 0);
begin

  clr_n_i <= ttl_input(clr_n);
  clk_i <= ttl_input(clk);
  d0_i <= ttl_input(d0);
  d1_i <= ttl_input(d1);
  d2_i <= ttl_input(d2);
  d3_i <= ttl_input(d3);
  d4_i <= ttl_input(d4);
  d5_i <= ttl_input(d5);
  d6_i <= ttl_input(d6);
  d7_i <= ttl_input(d7);

  -- 8 D flip-flops with common clear (always enabled for clocking)
  u0 : entity work.ff_dpc port map (clk => clk_i, d => d0_i, q => q_int(0), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u1 : entity work.ff_dpc port map (clk => clk_i, d => d1_i, q => q_int(1), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u2 : entity work.ff_dpc port map (clk => clk_i, d => d2_i, q => q_int(2), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u3 : entity work.ff_dpc port map (clk => clk_i, d => d3_i, q => q_int(3), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u4 : entity work.ff_dpc port map (clk => clk_i, d => d4_i, q => q_int(4), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u5 : entity work.ff_dpc port map (clk => clk_i, d => d5_i, q => q_int(5), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u6 : entity work.ff_dpc port map (clk => clk_i, d => d6_i, q => q_int(6), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);
  u7 : entity work.ff_dpc port map (clk => clk_i, d => d7_i, q => q_int(7), q_n => open, enb_n => '0', pre => '1', clr => clr_n_i);

  q0 <= q_int(0);
  q1 <= q_int(1);
  q2 <= q_int(2);
  q3 <= q_int(3);
  q4 <= q_int(4);
  q5 <= q_int(5);
  q6 <= q_int(6);
  q7 <= q_int(7);

end;
