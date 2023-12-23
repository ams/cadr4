-- 3-Line To 8-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74138 is
  port (
    a, b, c      : in std_logic;
    g1, g2a, g2b : in std_logic;

    y0, y1, y2, y3, y4, y5, y6, y7 : out std_logic
    );
end;

architecture ttl of sn74138 is
begin

  process (a, b, c, g1, g2a, g2b) is
    variable sel : unsigned(2 downto 0);
    variable y   : unsigned(7 downto 0);
    variable g2  : std_logic;
  begin
    sel := a & b & c;
    g2  := g2a and g2b;
    y   := y0 & y1 & y2 & y3 & y4 & y5 & y6 & y7;

    if (g1 = '1' and g2 = '0') then
      case sel is
        when "000"  => y := "01111111";
        when "001"  => y := "10111111";
        when "010"  => y := "11011111";
        when "011"  => y := "11101111";
        when "100"  => y := "11110111";
        when "101"  => y := "11111011";
        when "110"  => y := "11111101";
        when "111"  => y := "11111110";
        when others => y := "11111111";
      end case;
    else
      y := "11111111";
    end if;
  end process;

end architecture;
