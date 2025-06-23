-- 8-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of eight data inputs based on three select lines.

library ieee;
use ieee.std_logic_1164.all;

-- Datasheet: Texas Instruments SN74LS151 8-Line To 1-Line Data Selectors/Multiplexers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS151

entity sn74151 is
  port (
    i0   : in std_logic := 'H';
    i1   : in std_logic := 'H';
    i2   : in std_logic := 'H';
    i3   : in std_logic := 'H';
    i4   : in std_logic := 'H';
    i5   : in std_logic := 'H';
    i6   : in std_logic := 'H';
    i7   : in std_logic := 'H';
    sel0 : in std_logic := 'H';
    sel1 : in std_logic := 'H';
    sel2 : in std_logic := 'H';
    ce_n : in std_logic := 'H';
    q    : out std_logic;
    q_n  : out std_logic
    );
end;

architecture ttl of sn74151 is
begin
  -- core multiplexer with active-low chip-enable
  process(all)
    variable select_lines : std_logic_vector(2 downto 0);
  begin
    
    if ce_n = '0' then
      select_lines := sel2 & sel1 & sel0;
      case select_lines is
        when "000" =>
          q   <= i0;
          q_n <= not i0;
        when "001" =>
          q   <= i1;
          q_n <= not i1;
        when "010" =>
          q   <= i2;
          q_n <= not i2;
        when "011" =>
          q   <= i3;
          q_n <= not i3;
        when "100" => 
          q   <= i4;
          q_n <= not i4;
        when "101" =>
          q   <= i5;
          q_n <= not i5;
        when "110" =>
          q   <= i6;
          q_n <= not i6;
        when "111" =>
          q   <= i7;
          q_n <= not i7;
        when others =>
          q   <= 'X';
          q_n <= 'X';
      end case;
    else
      -- Chip is disabled
      q   <= '0';
      q_n <= '1';
    end if;
  end process;
end architecture;
