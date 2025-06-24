-- SN74258: Quadruple 2-Line To 1-Line Inverse Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74258 is
  port (
    enb_n : in std_logic := 'H';
    sel   : in std_logic := 'H';

    a0 : in  std_logic := 'H';
    a1 : in  std_logic := 'H';
    ay : out std_logic;

    b0 : in  std_logic := 'H';
    b1 : in  std_logic := 'H';
    by : out std_logic;

    c0 : in  std_logic := 'H';
    c1 : in  std_logic := 'H';
    cy : out std_logic;

    d0 : in  std_logic := 'H';
    d1 : in  std_logic := 'H';
    dy : out std_logic
    );
end;

architecture ttl of sn74258 is
begin
  process(all)
  begin
    -- Check for unknown enable or select signals
    if enb_n = '0' then
      -- Enabled: select inputs
      if sel = '0' then
        ay <= not a0;
        by <= not b0;
        cy <= not c0;
        dy <= not d0;
      elsif sel = '1' then
        ay <= not a1;
        by <= not b1;
        cy <= not c1;
        dy <= not d1;
      else 
        ay <= 'X';
        by <= 'X';
        cy <= 'X';
        dy <= 'X';
      end if;
    elsif enb_n = '1' then
      -- Disabled: high impedance
      ay <= 'Z';
      by <= 'Z';
      cy <= 'Z';
      dy <= 'Z';      
    else
      ay <= 'X';
      by <= 'X';
      cy <= 'X';
      dy <= 'X';
    end if;
  end process;
end;
