-- Dual 2-Line To 4-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74139 is
  port (
    g1                     : in  std_logic;
    a1, b1                 : in  std_logic;
    g1y0, g1y1, g1y2, g1y3 : out std_logic;

    g2                     : in  std_logic;
    a2, b2                 : in  std_logic;
    g2y3, g2y2, g2y1, g2y0 : out std_logic
    );
end;

architecture ttl of sn74139 is
begin

  process (g1, a1, b1) is
    variable sel : unsigned(1 downto 0);
    variable y   : unsigned(3 downto 0);
  begin
    sel := a1 & b1;
    y   := g1y0 & g1y1 & g1y2 & g1y3;

    if (g1 = '0') then
      case sel is
        when "00"   => y := "0111";
        when "01"   => y := "1011";
        when "10"   => y := "1101";
        when "11"   => y := "1110";
        when others => y := "1111";
      end case;
    else
      y := "1111";
    end if;
  end process;

  process (g2, a2, b2) is
    variable sel : unsigned(1 downto 0);
    variable y   : unsigned(3 downto 0);
  begin
    sel := a2 & b2;
    y   := g2y0 & g2y1 & g2y2 & g2y3;

    if (g2 = '0') then
      case sel is
        when "00"   => y := "0111";
        when "01"   => y := "1011";
        when "10"   => y := "1101";
        when "11"   => y := "1110";
        when others => y := "1111";
      end case;
    else
      y := "1111";
    end if;
  end process;

end architecture;
