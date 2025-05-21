-- Dual 8-Bit Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9328 is
  port (
    comclk : in std_logic;
    clr_n  : in std_logic;

    aclk     : in  std_logic;
    ai0, ai1 : in  std_logic;
    aq, aq_n : out std_logic;
    asel     : in  std_logic;

    bclk     : in  std_logic;
    bi0, bi1 : in  std_logic;
    bq, bq_n : out std_logic;
    bsel     : in  std_logic
    );
end dm9328;

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
  aq <= rega(7);
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
  bq <= regb(7);
  bq_n <= not regb(7);
end;
