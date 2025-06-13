-- SN74258: Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

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
    if (enb_n /= '0' and enb_n /= '1') or (sel /= '0' and sel /= '1') then
      -- Unknown control signals cause unknown outputs
      ay <= 'X'; by <= 'X'; cy <= 'X'; dy <= 'X';
    elsif enb_n = '1' then
      -- Disabled: high impedance
      ay <= 'Z'; by <= 'Z'; cy <= 'Z'; dy <= 'Z';
    else
      -- Enabled: select inputs
      if sel = '0' then
        -- Select 0 inputs, but check for unknown data inputs
        ay <= 'X' when (a0 /= '0' and a0 /= '1') else a0;
        by <= 'X' when (b0 /= '0' and b0 /= '1') else b0;
        cy <= 'X' when (c0 /= '0' and c0 /= '1') else c0;
        dy <= 'X' when (d0 /= '0' and d0 /= '1') else d0;
      else
        -- Select 1 inputs, but check for unknown data inputs
        ay <= 'X' when (a1 /= '0' and a1 /= '1') else a1;
        by <= 'X' when (b1 /= '0' and b1 /= '1') else b1;
        cy <= 'X' when (c1 /= '0' and c1 /= '1') else c1;
        dy <= 'X' when (d1 /= '0' and d1 /= '1') else d1;
      end if;
    end if;
  end process;
end;
