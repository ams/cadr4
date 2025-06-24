-- Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;

entity sn74157 is
  port (
    enb_n : in std_logic := 'H';
    sel   : in std_logic := 'H';

    a1 : in std_logic := 'H';
    a2 : in std_logic := 'H';
    a3 : in std_logic := 'H';
    a4 : in std_logic := 'H';

    b1 : in std_logic := 'H';
    b2 : in std_logic := 'H';
    b3 : in std_logic := 'H';
    b4 : in std_logic := 'H';

    y1 : out std_logic;
    y2 : out std_logic;
    y3 : out std_logic;
    y4 : out std_logic
    );
end;

architecture ttl of sn74157 is
begin
  process(all)
  begin
    if to_x01(enb_n) = '0' then
      if to_x01(sel) = '0' then
        y1 <= a1; y2 <= a2; y3 <= a3; y4 <= a4;
      elsif to_x01(sel) = '1' then
        y1 <= b1; y2 <= b2; y3 <= b3; y4 <= b4;
      else
        y1 <= 'X'; y2 <= 'X'; y3 <= 'X'; y4 <= 'X';
      end if;
    elsif to_x01(enb_n) = '1' then
      y1 <= 'Z'; y2 <= 'Z'; y3 <= 'Z'; y4 <= 'Z';
    else
      y1 <= 'X'; y2 <= 'X'; y3 <= 'X'; y4 <= 'X';
    end if;
  end process;
end architecture;
