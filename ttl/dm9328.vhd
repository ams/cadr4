-- Dual 8-Bit Shift Register
-- Fairchild DM9328
-- doc/ttl/dm9328.pdf

library ieee;
use ieee.std_logic_1164.all;

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
end entity;

architecture ttl of dm9328 is
  signal clr_n_i, asel_i, ai1_i, ai0_i, aclk_i, comclk_i, bclk_i, bi0_i, bi1_i, bsel_i : std_logic;
  signal rega : std_logic_vector(7 downto 0) := (others => '0');
  signal regb : std_logic_vector(7 downto 0) := (others => '0');
begin

  clr_n_i <= 'H';
  asel_i <= 'H';
  ai1_i <= 'H';
  ai0_i <= 'H';
  aclk_i <= 'H';
  comclk_i <= 'H';
  bclk_i <= 'H';
  bi0_i <= 'H';
  bi1_i <= 'H';
  bsel_i <= 'H';

  clr_n_i <= clr_n;
  asel_i <= asel;
  ai1_i <= ai1;
  ai0_i <= ai0;
  aclk_i <= aclk;
  comclk_i <= comclk;
  bclk_i <= bclk;
  bi0_i <= bi0;
  bi1_i <= bi1;
  bsel_i <= bsel;

  aq   <= rega(7);
  aq_n <= not rega(7);
  bq   <= regb(7);
  bq_n <= not regb(7);

  -- Shift register A
  process (all)
  begin
    if to_x01(clr_n_i) = '0' then
      rega <= (others => '0');
    elsif rising_edge(aclk_i) then
      if to_x01(asel_i) = '0' then
        rega <= rega(6 downto 0) & ai0_i;
      elsif to_x01(asel_i) = '1' then
        rega <= rega(6 downto 0) & ai1_i;
      else
        rega <= rega(6 downto 0) & 'X';
      end if;
    end if;
  end process;
  
  -- Shift register B
  process (all)
  begin
    if to_x01(clr_n_i) = '0' then
      regb <= (others => '0');
    elsif rising_edge(bclk_i) then
      if to_x01(bsel_i) = '0' then
        regb <= regb(6 downto 0) & bi0_i;
      elsif to_x01(bsel_i) = '1' then
        regb <= regb(6 downto 0) & bi1_i;
      else
        regb <= regb(6 downto 0) & 'X';
      end if;
    end if;
  end process;
  
end architecture;
