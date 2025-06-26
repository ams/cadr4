-- Octal D-Type Flip-Flops

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74374 is
  port (
    clk   : in  std_logic; -- pin 10
    oenb_n : in  std_logic; -- pin 1
    i0 : in  std_logic; -- pin 3
    i1 : in  std_logic; -- pin 4
    i2 : in  std_logic; -- pin 9
    i3 : in  std_logic; -- pin 11
    i4 : in  std_logic; -- pin 13
    i5 : in  std_logic; -- pin 14
    i6 : in  std_logic; -- pin 17
    i7 : in  std_logic; -- pin 18
    o0 : out std_logic; -- pin 2
    o1 : out std_logic; -- pin 5
    o2 : out std_logic; -- pin 6
    o3 : out std_logic; -- pin 7
    o4 : out std_logic; -- pin 12
    o5 : out std_logic; -- pin 15
    o6 : out std_logic; -- pin 16
    o7 : out std_logic  -- pin 19
    );
end;

architecture ttl of sn74374 is
  signal clk_i, oenb_n_i, i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i : std_logic;
  signal q_int : std_logic_vector(7 downto 0);
begin

  clk_i <= ttl_input(clk);
  oenb_n_i <= ttl_input(oenb_n);
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  i5_i <= ttl_input(i5);
  i6_i <= ttl_input(i6);
  i7_i <= ttl_input(i7);

  -- 8 D flip-flops (always enabled for clocking)
  u0 : entity work.ff_dpc port map (clk => clk_i, d => i0_i, q => q_int(0), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u1 : entity work.ff_dpc port map (clk => clk_i, d => i1_i, q => q_int(1), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u2 : entity work.ff_dpc port map (clk => clk_i, d => i2_i, q => q_int(2), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u3 : entity work.ff_dpc port map (clk => clk_i, d => i3_i, q => q_int(3), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u4 : entity work.ff_dpc port map (clk => clk_i, d => i4_i, q => q_int(4), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u5 : entity work.ff_dpc port map (clk => clk_i, d => i5_i, q => q_int(5), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u6 : entity work.ff_dpc port map (clk => clk_i, d => i6_i, q => q_int(6), q_n => open, enb_n => '0', pre => '1', clr => '1');
  u7 : entity work.ff_dpc port map (clk => clk_i, d => i7_i, q => q_int(7), q_n => open, enb_n => '0', pre => '1', clr => '1');

  -- Output enable process: controls 3-state outputs
  process (all)
  begin
    if oenb_n_i = '0' then
      -- Output enable active (low), drive stored data to outputs
      o0 <= q_int(0);
      o1 <= q_int(1);
      o2 <= q_int(2);
      o3 <= q_int(3);
      o4 <= q_int(4);
      o5 <= q_int(5);
      o6 <= q_int(6);
      o7 <= q_int(7);
    elsif oenb_n_i = '1' then
      -- Output enable inactive (high), outputs in high-impedance
      o0 <= 'Z';
      o1 <= 'Z';
      o2 <= 'Z';
      o3 <= 'Z';
      o4 <= 'Z';
      o5 <= 'Z';
      o6 <= 'Z';
      o7 <= 'Z';
    else
      o0 <= 'X';
      o1 <= 'X';
      o2 <= 'X';
      o3 <= 'X';
      o4 <= 'X';
      o5 <= 'X';
      o6 <= 'X';
      o7 <= 'X';
    end if;
  end process;

end;
