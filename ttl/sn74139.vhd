-- Dual 2-Line To 4-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74139 is
  port (
    g1   : in  std_logic; -- Pin 3
    b1   : in  std_logic; -- Pin 2
    a1   : in  std_logic; -- Pin 1
    g1y0 : out std_logic; -- Pin 4
    g1y1 : out std_logic; -- Pin 5
    g1y2 : out std_logic; -- Pin 6
    g1y3 : out std_logic; -- Pin 7

    g2y3 : out std_logic; -- Pin 12
    g2y2 : out std_logic; -- Pin 11
    g2y1 : out std_logic; -- Pin 10
    g2y0 : out std_logic; -- Pin 9
    g2   : in  std_logic; -- Pin 13
    b2   : in  std_logic; -- Pin 14
    a2   : in  std_logic  -- Pin 15
    );
end;

architecture ttl of sn74139 is
  signal g1_i, b1_i, a1_i, g2_i, b2_i, a2_i : std_logic;
  signal y1 : unsigned(3 downto 0);
  signal y2 : unsigned(3 downto 0);
begin

  g1_i <= 'H';
  b1_i <= 'H';
  a1_i <= 'H';
  g2_i <= 'H';
  b2_i <= 'H';
  a2_i <= 'H';

  g1_i <= g1;
  b1_i <= b1;
  a1_i <= a1;
  g2_i <= g2;
  b2_i <= b2;
  a2_i <= a2;

  -- drive output pins from internal vectors
  g1y0 <= y1(3); g1y1 <= y1(2); g1y2 <= y1(1); g1y3 <= y1(0);
  g2y3 <= y2(0); g2y2 <= y2(1); g2y1 <= y2(2); g2y0 <= y2(3);

  process (all) is
    
    variable sel : unsigned(1 downto 0);
  begin
    sel := a1_i & b1_i;

    if to_x01(g1_i) = '0' then
      case sel is
        when "00"   => y1 <= "0111";
        when "01"   => y1 <= "1011";
        when "10"   => y1 <= "1101";
        when "11"   => y1 <= "1110";
        when others => y1 <= "XXXX";
      end case;
    elsif to_x01(g1_i) = '1' then
      -- This is correct, it is not a tri-state output component
      y1 <= "1111";
    else
      y1 <= "XXXX";
    end if;
  end process;

  process (all) is
    variable sel : unsigned(1 downto 0);
  begin
    sel := a2_i & b2_i;

    if to_x01(g2_i) = '0' then
      case sel is
        when "00"   => y2 <= "0111";
        when "01"   => y2 <= "1011";
        when "10"   => y2 <= "1101";
        when "11"   => y2 <= "1110";
        when others => y2 <= "XXXX";
      end case;
    elsif to_x01(g2_i) = '1' then
      -- This is correct, it is not a tri-state output component
      y2 <= "1111";
    else
      y2 <= "XXXX";
    end if;
  end process;
  
end architecture;
