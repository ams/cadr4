-- Dual 2-Line To 4-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity sn74139 is
  port (    
    g1y3 : out std_logic; -- Pin 7  
    g1y2 : out std_logic; -- Pin 6
    g1y1 : out std_logic; -- Pin 5
    g1y0 : out std_logic; -- Pin 4  
    g1s1 : in  std_logic; -- Pin 3
    g1s0 : in  std_logic; -- Pin 2
    g1e_n: in  std_logic; -- Pin 1

    g2y3 : out std_logic; -- Pin 9
    g2y2 : out std_logic; -- Pin 10
    g2y1 : out std_logic; -- Pin 11
    g2y0 : out std_logic; -- Pin 12
    g2s1 : in  std_logic; -- Pin 13
    g2s0 : in  std_logic; -- Pin 14
    g2e_n: in  std_logic  -- Pin 15
    );
end;

architecture behavioral of sn74139 is
  signal g1e_n_i, g1s0_i, g1s1_i, g2e_n_i, g2s0_i, g2s1_i : std_logic;
  signal g1 : unsigned(3 downto 0);
  signal g2 : unsigned(3 downto 0);
begin

  g1e_n_i <= ttl_input(g1e_n);
  g1s0_i <= ttl_input(g1s0);
  g1s1_i <= ttl_input(g1s1);
  g2e_n_i <= ttl_input(g2e_n);
  g2s0_i <= ttl_input(g2s0);
  g2s1_i <= ttl_input(g2s1);

  -- drive output pins from internal vectors
  g1y3 <= g1(3); g1y2 <= g1(2); g1y1 <= g1(1); g1y0 <= g1(0);
  g2y3 <= g2(3); g2y2 <= g2(2); g2y1 <= g2(1); g2y0 <= g2(0);

  process (all) is
    variable sel : unsigned(1 downto 0);
  begin
    sel := g1s1_i & g1s0_i;
    if g1e_n_i = '0' then
      case sel is
        when "00"   => g1 <= "1110";
        when "01"   => g1 <= "1101";
        when "10"   => g1 <= "1011";
        when "11"   => g1 <= "0111";
        when others => g1 <= "XXXX";
      end case;
    elsif g1e_n_i = '1' then
      -- This is correct, it is not a tri-state output component
      g1 <= "1111";
    else
      g1 <= "XXXX";
    end if;
  end process;

  process (all) is
    variable sel : unsigned(1 downto 0);
  begin
    sel := g2s1_i & g2s0_i;
    if g2e_n_i = '0' then
      case sel is
        when "00"   => g2 <= "1110";
        when "01"   => g2 <= "1101";
        when "10"   => g2 <= "1011";
        when "11"   => g2 <= "0111";
        when others => g2 <= "XXXX";
      end case;
    elsif g2e_n_i = '1' then
      -- This is correct, it is not a tri-state output component
      g2 <= "1111";
    else
      g2 <= "XXXX";
    end if;
  end process;
  
end architecture;
