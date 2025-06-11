-- Dual 8-Bit Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9328 is
  port (
    clr_n  : in  std_logic; -- 7
    aq_n   : out std_logic; -- 1
    aq     : out std_logic; -- 2
    asel   : in  std_logic; -- 3
    ai1    : in  std_logic; -- 5
    ai0    : in  std_logic; -- 4
    aclk   : in  std_logic; -- 6
    comclk : in  std_logic; -- 9
    bclk   : in  std_logic; -- 10
    bi0    : in  std_logic; -- 11
    bi1    : in  std_logic; -- 12
    bsel   : in  std_logic; -- 13
    bq     : out std_logic; -- 14
    bq_n   : out std_logic  -- 15
    );
end dm9328;

-- Datasheet: https://datasheet.sisoog.com/file/7a657573/datasheet/e2e7ec94a9d6aae7e5e57c76266892be30e12591.pdf (PDIP, N16E Package)
-- VCC = Pin 16, GND = Pin 8

-- ChatGPT Codex implementation
architecture ttl of dm9328 is
  signal rega : std_logic_vector(7 downto 0) := (others => '0');
  signal regb : std_logic_vector(7 downto 0) := (others => '0');
begin
  -- Shift register A
  process(aclk, clr_n)
  begin
    if clr_n = '0' then
      rega <= (others => '0');
    elsif rising_edge(aclk) then
      if asel = '0' then
        rega <= rega(6 downto 0) & ai0;
      else
        rega <= rega(6 downto 0) & ai1;
      end if;
    end if;
  end process;
  aq   <= rega(7);
  aq_n <= not rega(7);

  -- Shift register B
  process(bclk, clr_n)
  begin
    if clr_n = '0' then
      regb <= (others => '0');
    elsif rising_edge(bclk) then
      if bsel = '0' then
        regb <= regb(6 downto 0) & bi0;
      else
        regb <= regb(6 downto 0) & bi1;
      end if;
    end if;
  end process;
  bq   <= regb(7);
  bq_n <= not regb(7);
end;
