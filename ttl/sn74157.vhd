-- Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74157 is
  port (
    enb_n : in std_logic;
    sel   : in std_logic;

    a1 : in std_logic;
    a2 : in std_logic;
    a3 : in std_logic;
    a4 : in std_logic;

    b1 : in std_logic;
    b2 : in std_logic;
    b3 : in std_logic;
    b4 : in std_logic;

    y1 : out std_logic;
    y2 : out std_logic;
    y3 : out std_logic;
    y4 : out std_logic
    );
end;

architecture ttl of sn74157 is
  signal enb_n_i, sel_i, a1_i, a2_i, a3_i, a4_i, b1_i, b2_i, b3_i, b4_i : std_logic;
begin

  enb_n_i <= ttl_input(enb_n);
  sel_i <= ttl_input(sel);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  a4_i <= ttl_input(a4);
  b1_i <= ttl_input(b1);
  b2_i <= ttl_input(b2);
  b3_i <= ttl_input(b3);
  b4_i <= ttl_input(b4);

  process(all)
  begin
    if enb_n_i = '0' then
      if sel_i = '0' then
        y1 <= a1_i; y2 <= a2_i; y3 <= a3_i; y4 <= a4_i;
      elsif sel_i = '1' then
        y1 <= b1_i; y2 <= b2_i; y3 <= b3_i; y4 <= b4_i;
      else
        y1 <= 'X'; y2 <= 'X'; y3 <= 'X'; y4 <= 'X';
      end if;
    elsif enb_n_i = '1' then
      y1 <= 'Z'; y2 <= 'Z'; y3 <= 'Z'; y4 <= 'Z';
    else
      y1 <= 'X'; y2 <= 'X'; y3 <= 'X'; y4 <= 'X';
    end if;
  end process;
end architecture;
