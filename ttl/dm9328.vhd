-- Dual 8-Bit Shift Register
-- Fairchild DM9328
-- doc/ttl/dm9328.pdf

library ieee;
use ieee.std_logic_1164.all;

entity dm9328 is
  port (
    clr_n  : in  std_logic := 'H'; -- 7
    aq_n   : out std_logic; -- 1
    aq     : out std_logic; -- 2
    asel   : in  std_logic := 'H'; -- 3
    ai1    : in  std_logic := 'H'; -- 5
    ai0    : in  std_logic := 'H'; -- 4
    aclk   : in  std_logic := 'H'; -- 6
    comclk : in  std_logic := 'H'; -- 9
    bclk   : in  std_logic := 'H'; -- 10
    bi0    : in  std_logic := 'H'; -- 11
    bi1    : in  std_logic := 'H'; -- 12
    bsel   : in  std_logic := 'H'; -- 13
    bq     : out std_logic; -- 14
    bq_n   : out std_logic  -- 15
    );
end entity;

architecture ttl of dm9328 is
  signal rega : std_logic_vector(7 downto 0) := (others => '0');
  signal regb : std_logic_vector(7 downto 0) := (others => '0');
begin
  aq   <= rega(7);
  aq_n <= not rega(7);
  bq   <= regb(7);
  bq_n <= not regb(7);

  -- Shift register A
  process (all)
  begin
    if to_x01(clr_n) = '0' then
      rega <= (others => '0');
    elsif rising_edge(aclk) then
      if to_x01(asel) = '0' then
        rega <= rega(6 downto 0) & ai0;
      elsif to_x01(asel) = '1' then
        rega <= rega(6 downto 0) & ai1;
      else
        rega <= rega(6 downto 0) & 'X';
      end if;
    end if;
  end process;
  
  -- Shift register B
  process (all)
  begin
    if to_x01(clr_n) = '0' then
      regb <= (others => '0');
    elsif rising_edge(bclk) then
      if to_x01(bsel) = '0' then
        regb <= regb(6 downto 0) & bi0;
      elsif to_x01(bsel) = '1' then
        regb <= regb(6 downto 0) & bi1;
      else
        regb <= regb(6 downto 0) & 'X';
      end if;
    end if;
  end process;
  
end architecture;
