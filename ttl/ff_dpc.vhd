-- D Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop operates normally on clock edges.
-- When both pre and clr are active, this produces undefined behavior.

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity ff_dpc is
  port (
    clk      : in  std_logic;
    pre      : in  std_logic;
    clr      : in  std_logic;
    d        : in  std_logic;
    enb_n    : in  std_logic;
    q, q_n   : out std_logic
    );
end entity;

architecture behavioral of ff_dpc is
  signal clk_i, pre_i, clr_i, d_i, enb_n_i : std_logic;
  signal q_int : std_logic := '0';
begin

  clk_i <= ttl_input(clk);
  pre_i <= ttl_input(pre);
  clr_i <= ttl_input(clr);
  d_i <= ttl_input(d);
  enb_n_i <= ttl_input(enb_n);
  q <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk_i, pre_i, clr_i)
  begin
    -- Asynchronous preset and clear (active low)
    -- Conflicting preset and clear signals produce undefined behavior (X)
    if pre_i = '0' and clr_i = '0' then
      q_int <= 'X';  -- Undefined behavior when both are active
    elsif pre_i = '0' then
      q_int <= '1';
    elsif clr_i = '0' then
      q_int <= '0';
    elsif pre_i = 'X' or clr_i = 'X' then
      q_int <= 'X';
    elsif pre_i = '1' and clr_i = '1' then
      -- I dont know why but if this is not checked here, output becomes U
      -- even though the signal is initialized to '0' at first
      if q_int = 'U' then
        q_int <= '0';
      elsif enb_n_i = '0' then
        if rising_edge(clk_i) then
          q_int <= d_i;
        end if;
      end if;
    elsif enb_n_i = '0' then
      if rising_edge(clk_i) then
        q_int <= d_i;
      end if;
    end if;
  end process;
end architecture;
