-- Dual 2-Line To 4-Line Decoders/Demultiplexers
-- This component decodes a 2-bit input to one of four active-low outputs.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS139A Dual 2-Line to 4-Line Decoders/Demultiplexers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS139A

entity sn74139 is
  port (
    g1   : in  std_logic := 'H'; -- Pin 3
    b1   : in  std_logic := 'H'; -- Pin 2
    a1   : in  std_logic := 'H'; -- Pin 1
    g1y0 : out std_logic; -- Pin 4
    g1y1 : out std_logic; -- Pin 5
    g1y2 : out std_logic; -- Pin 6
    g1y3 : out std_logic; -- Pin 7

    g2y3 : out std_logic; -- Pin 12
    g2y2 : out std_logic; -- Pin 11
    g2y1 : out std_logic; -- Pin 10
    g2y0 : out std_logic; -- Pin 9
    g2   : in  std_logic := 'H'; -- Pin 13
    b2   : in  std_logic := 'H'; -- Pin 14
    a2   : in  std_logic := 'H'  -- Pin 15
    );
end;

architecture ttl of sn74139 is
  signal y1 : unsigned(3 downto 0);
  signal y2 : unsigned(3 downto 0);
begin

  -- drive output pins from internal vectors
  g1y0 <= y1(3); g1y1 <= y1(2); g1y2 <= y1(1); g1y3 <= y1(0);
  g2y3 <= y2(0); g2y2 <= y2(1); g2y1 <= y2(2); g2y0 <= y2(3);

  process (all) is
    
    variable sel : unsigned(1 downto 0);
  begin
    sel := a1 & b1;

    if g1 = '0' then
      case sel is
        when "00"   => y1 <= "0111";
        when "01"   => y1 <= "1011";
        when "10"   => y1 <= "1101";
        when "11"   => y1 <= "1110";
        when others => y1 <= "XXXX";
      end case;
    elsif g1 = '0' then
      -- This is correct, it is not a tri-state output component
      y1 <= "1111";
    else
      y1 <= "XXXX";
    end if;
  end process;

  process (all) is
    variable sel : unsigned(1 downto 0);
  begin
    sel := a2 & b2;

    if g2 = '0' then
      case sel is
        when "00"   => y2 <= "0111";
        when "01"   => y2 <= "1011";
        when "10"   => y2 <= "1101";
        when "11"   => y2 <= "1110";
        when others => y2 <= "XXXX";
      end case;
    elsif g2 = '0' then
      -- This is correct, it is not a tri-state output component
      y2 <= "1111";
    else
      y2 <= "XXXX";
    end if;
  end process;
  
end architecture;
