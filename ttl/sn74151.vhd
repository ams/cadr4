-- 8-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;

use work.misc.ttl_input;

entity sn74151 is
  port (
    i0   : in std_logic;
    i1   : in std_logic;
    i2   : in std_logic;
    i3   : in std_logic;
    i4   : in std_logic;
    i5   : in std_logic;
    i6   : in std_logic;
    i7   : in std_logic;
    sel0 : in std_logic;
    sel1 : in std_logic;
    sel2 : in std_logic;
    ce_n : in std_logic;
    q    : out std_logic;
    q_n  : out std_logic
    );
end;

architecture ttl of sn74151 is
  signal i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i : std_logic;
  signal sel0_i, sel1_i, sel2_i, ce_n_i : std_logic;
begin

  -- TTL-compatible assignments using function
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  i5_i <= ttl_input(i5);
  i6_i <= ttl_input(i6);
  i7_i <= ttl_input(i7);
  sel0_i <= ttl_input(sel0);
  sel1_i <= ttl_input(sel1);
  sel2_i <= ttl_input(sel2);
  ce_n_i <= ttl_input(ce_n);

  -- core multiplexer with active-low chip-enable
  process(all)
    variable select_lines : std_logic_vector(2 downto 0);
  begin
    
    if to_x01(ce_n_i) = '0' then
      select_lines := sel2_i & sel1_i & sel0_i;
      case select_lines is
        when "000" =>
          q   <= i0_i;
          q_n <= not i0_i;
        when "001" =>
          q   <= i1_i;
          q_n <= not i1_i;
        when "010" =>
          q   <= i2_i;
          q_n <= not i2_i;
        when "011" =>
          q   <= i3_i;
          q_n <= not i3_i;
        when "100" => 
          q   <= i4_i;
          q_n <= not i4_i;
        when "101" =>
          q   <= i5_i;
          q_n <= not i5_i;
        when "110" =>
          q   <= i6_i;
          q_n <= not i6_i;
        when "111" =>
          q   <= i7_i;
          q_n <= not i7_i;
        when others =>
          q   <= 'X';
          q_n <= 'X';
      end case;
    elsif to_x01(ce_n_i) = '1' then
      -- Chip is disabled
      -- This is correct, it is not a tri-state output component
      q   <= '0';
      q_n <= '1';
    else
      q   <= 'X';
      q_n <= 'X';
    end if;
  end process;
end architecture;
