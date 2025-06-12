-- Dual 4-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of four data inputs for two separate sections based on two select lines.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS153 Dual 4-Line To 1-Line Data Selectors/Multiplexers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS153

entity sn74153 is
  port (
    
    sela   : in  std_logic; -- Pin 14
    selb   : in  std_logic; -- Pin 2       
   
    enb1_n : in  std_logic; -- Pin 1
    g1c0   : in  std_logic; -- Pin 6
    g1c1   : in  std_logic; -- Pin 5
    g1c2   : in  std_logic; -- Pin 4
    g1c3   : in  std_logic; -- Pin 3
    g1y    : out std_logic; -- Pin 7

    enb2_n : in  std_logic; -- Pin 15
    g2c0   : in  std_logic; -- Pin 10
    g2c1   : in  std_logic; -- Pin 11
    g2c2   : in  std_logic; -- Pin 12
    g2c3   : in  std_logic; -- Pin 13
    g2y    : out std_logic -- Pin 9
    
    );
end;

architecture rtl of sn74153 is
  signal select_lines : std_logic_vector(1 downto 0);
begin

  select_lines <= selb & sela;
  
  process(all)
  begin
    if enb1_n = '1' then
      g1y <= '0';
    else 
      case select_lines is
        when "00" => g1y <= g1c0;
        when "01" => g1y <= g1c1;
        when "10" => g1y <= g1c2;
        when "11" => g1y <= g1c3;
        when others => g1y <= 'X';
      end case;
    end if;
  end process;

  process(all)
  begin
    if enb2_n = '1' then
      g2y <= '0';
    else
      case select_lines is
        when "00" => g2y <= g2c0;
        when "01" => g2y <= g2c1;
        when "10" => g2y <= g2c2;
        when "11" => g2y <= g2c3;
        when others => g2y <= 'X';
      end case;
    end if;
  end process;
  
end architecture;
