-- SN74258: Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74258 is
  port (
    enb_n : in std_logic;
    sel   : in std_logic;

    a0 : in  std_logic;
    a1 : in  std_logic;
    ay : out std_logic;

    b0 : in  std_logic;
    b1 : in  std_logic;
    by : out std_logic;

    c0 : in  std_logic;
    c1 : in  std_logic;
    cy : out std_logic;

    d0 : in  std_logic;
    d1 : in  std_logic;
    dy : out std_logic
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
