-- Dual 4-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of four data inputs for two separate sections based on two select lines.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74153 is
  port (
    enb1_n : in  std_logic; -- Pin 1
    sel1   : in  std_logic; -- Pin 2
    g1c3   : in  std_logic; -- Pin 3
    g1c2   : in  std_logic; -- Pin 4
    g1c1   : in  std_logic; -- Pin 5
    g1c0   : in  std_logic; -- Pin 6
    g1q    : out std_logic; -- Pin 7

    g2q    : out std_logic; -- Pin 9
    g2c0   : in  std_logic; -- Pin 10
    g2c1   : in  std_logic; -- Pin 11
    g2c2   : in  std_logic; -- Pin 12
    g2c3   : in  std_logic; -- Pin 13
    sel0   : in  std_logic; -- Pin 14
    enb2_n : in  std_logic  -- Pin 15
    );
end;

architecture ttl of sn74153 is
begin
  process (enb1_n, sel0, g1c0, g1c1, g1c2, g1c3,
           enb2_n, sel1, g2c0, g2c1, g2c2, g2c3)
    variable sel: std_logic_vector(0 to 1);
  begin
    sel := sel1 & sel0;
    if enb1_n then
      g1q <= '0';
    else
      case sel is
        when "00" => g1q <= g1c0;
        when "01" => g1q <= g1c1;
        when "10" => g1q <= g1c2;
        when "11" => g1q <= g1c3;
        when others => g1q <= 'X';
      end case;
    end if;
    if enb2_n then
      g2q <= '0';
    else
      case sel is
        when "00" => g2q <= g2c0;
        when "01" => g2q <= g2c1;
        when "10" => g2q <= g2c2;
        when "11" => g2q <= g2c3;
        when others => g2q <= 'X';
      end case;
    end if;
end process;
end;
