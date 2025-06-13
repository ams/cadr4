-- 8-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of eight data inputs based on three select lines.

library ieee;
use ieee.std_logic_1164.all;

-- Datasheet: Texas Instruments SN74LS151 8-Line To 1-Line Data Selectors/Multiplexers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS151

entity sn74151 is
  port (
    i3   : in  std_logic := 'H';
    i2   : in  std_logic := 'H';
    i1   : in  std_logic := 'H';
    i0   : in  std_logic := 'H';
    q    : out std_logic;
    q_n  : out std_logic;
    ce_n : in  std_logic := 'H';

    sel0 : in std_logic := 'H';
    sel1 : in std_logic := 'H';
    sel2 : in std_logic := 'H';
    i4   : in std_logic := 'H';
    i5   : in std_logic := 'H';
    i6   : in std_logic := 'H';
    i7   : in std_logic := 'H'
    );
end;

architecture ttl of sn74151 is
begin
  -- core multiplexer with active-low chip-enable
  process(all)
  begin
    if ce_n = '0' then
      if sel2 = '0' and sel1 = '0' and sel0 = '0' then
        q   <= i0;
        q_n <= not i0;
      elsif sel2 = '0' and sel1 = '0' and sel0 = '1' then
        q   <= i1;
        q_n <= not i1;
      elsif sel2 = '0' and sel1 = '1' and sel0 = '0' then
        q   <= i2;
        q_n <= not i2;
      elsif sel2 = '0' and sel1 = '1' and sel0 = '1' then
        q   <= i3;
        q_n <= not i3;
      elsif sel2 = '1' and sel1 = '0' and sel0 = '0' then
        q   <= i4;
        q_n <= not i4;
      elsif sel2 = '1' and sel1 = '0' and sel0 = '1' then
        q   <= i5;
        q_n <= not i5;
      elsif sel2 = '1' and sel1 = '1' and sel0 = '0' then
        q   <= i6;
        q_n <= not i6;
      elsif sel2 = '1' and sel1 = '1' and sel0 = '1' then
        q   <= i7;
        q_n <= not i7;
      else
        -- Handle undefined select combinations
        q   <= 'X';
        q_n <= 'X';
      end if;
    else
      -- Chip is disabled
      q   <= 'X';
      q_n <= 'X';
    end if;
  end process;
end architecture;
