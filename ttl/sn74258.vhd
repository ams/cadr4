-- SN74258: Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74258 is
  port (
    enb_n : in std_logic; -- pin 15
    sel   : in std_logic; -- pin 1

    a0 : in  std_logic; -- pin 14
    a1 : in  std_logic; -- pin 13
    ay : out std_logic; -- pin 12

    b0 : in  std_logic; -- pin 11
    b1 : in  std_logic; -- pin 10
    by : out std_logic; -- pin 9

    c0 : in  std_logic; -- pin 5
    c1 : in  std_logic; -- pin 6
    cy : out std_logic; -- pin 7

    d0 : in  std_logic; -- pin 2
    d1 : in  std_logic; -- pin 3
    dy : out std_logic  -- pin 4
    );
end;

-- ChatGPT Codex implementation
architecture ttl of sn74258 is
begin
  process(all)
  begin
    if enb_n = '1' then
      ay <= 'Z'; by <= 'Z'; cy <= 'Z'; dy <= 'Z';
    else
      if sel = '0' then
        ay <= a0; by <= b0; cy <= c0; dy <= d0;
      else
        ay <= a1; by <= b1; cy <= c1; dy <= d1;
      end if;
    end if;
  end process;
end;
