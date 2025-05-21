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
  signal y : unsigned(7 downto 0);
begin

  process (a, b, c, g1, g2a, g2b) is
    variable sel : unsigned(2 downto 0);
    variable g2  : std_logic;
  begin
    sel := a & b & c;
    g2  := g2a and g2b;

    if g1 = '1' and g2 = '0' then
      case sel is
        when "000"  => y <= "01111111";
        when "001"  => y <= "10111111";
        when "010"  => y <= "11011111";
        when "011"  => y <= "11101111";
        when "100"  => y <= "11110111";
        when "101"  => y <= "11111011";
        when "110"  => y <= "11111101";
        when "111"  => y <= "11111110";
        when others => y <= "11111111";
      end case;
    else
      y <= "11111111";
    end if;
  end process;

  -- map internal vector to output pins
  y0 <= y(7); y1 <= y(6); y2 <= y(5); y3 <= y(4);
  y4 <= y(3); y5 <= y(2); y6 <= y(1); y7 <= y(0);

end architecture;
