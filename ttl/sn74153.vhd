-- Dual 4-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;

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
  signal sela_i, selb_i, enb1_n_i, g1c0_i, g1c1_i, g1c2_i, g1c3_i : std_logic;
  signal enb2_n_i, g2c0_i, g2c1_i, g2c2_i, g2c3_i : std_logic;
begin

  sela_i <= 'H';
  selb_i <= 'H';
  enb1_n_i <= 'H';
  g1c0_i <= 'H';
  g1c1_i <= 'H';
  g1c2_i <= 'H';
  g1c3_i <= 'H';
  enb2_n_i <= 'H';
  g2c0_i <= 'H';
  g2c1_i <= 'H';
  g2c2_i <= 'H';
  g2c3_i <= 'H';

  sela_i <= sela;
  selb_i <= selb;
  enb1_n_i <= enb1_n;
  g1c0_i <= g1c0;
  g1c1_i <= g1c1;
  g1c2_i <= g1c2;
  g1c3_i <= g1c3;
  enb2_n_i <= enb2_n;
  g2c0_i <= g2c0;
  g2c1_i <= g2c1;
  g2c2_i <= g2c2;
  g2c3_i <= g2c3;

  process(all)
    variable select_lines : std_logic_vector(1 downto 0);
  begin
    if to_x01(enb1_n_i) = '0' then
      select_lines := selb_i & sela_i;
      case select_lines is
        when "00" => g1y <= g1c0_i;
        when "01" => g1y <= g1c1_i;
        when "10" => g1y <= g1c2_i;
        when "11" => g1y <= g1c3_i;
        when others => g1y <= 'X';
      end case;
    elsif to_x01(enb1_n_i) = '1' then
      -- This is correct, it is not a tri-state output component
      g1y <= '0';
    else
      g1y <= 'X';
    end if;
  end process;

  process(all)
    variable select_lines : std_logic_vector(1 downto 0);
  begin
    if to_x01(enb2_n_i) = '0' then
      select_lines := selb_i & sela_i;
      case select_lines is
        when "00" => g2y <= g2c0_i;
        when "01" => g2y <= g2c1_i;
        when "10" => g2y <= g2c2_i;
        when "11" => g2y <= g2c3_i;
        when others => g2y <= 'X';
      end case;
    elsif to_x01(enb2_n_i) = '1' then
      -- This is correct, it is not a tri-state output component
      g2y <= '0';
    else
      g2y <= 'X';
    end if;
  end process;
  
end architecture;
