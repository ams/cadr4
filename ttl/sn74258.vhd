-- Quadruple 2-Line To 1-Line Inverse Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

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

architecture ttl of sn74258 is
  signal enb_n_i, sel_i, a0_i, a1_i, b0_i, b1_i, c0_i, c1_i, d0_i, d1_i : std_logic;
begin

  enb_n_i <= ttl_input(enb_n);
  sel_i <= ttl_input(sel);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  b0_i <= ttl_input(b0);
  b1_i <= ttl_input(b1);
  c0_i <= ttl_input(c0);
  c1_i <= ttl_input(c1);
  d0_i <= ttl_input(d0);
  d1_i <= ttl_input(d1);

  process(all)
  begin
    -- Check for unknown enable or select signals
    if enb_n_i = '0' then
      -- Enabled: select inputs
      if sel_i = '0' then
        ay <= not a0_i;
        by <= not b0_i;
        cy <= not c0_i;
        dy <= not d0_i;
      elsif sel_i = '1' then
        ay <= not a1_i;
        by <= not b1_i;
        cy <= not c1_i;
        dy <= not d1_i;
      else 
        ay <= 'X';
        by <= 'X';
        cy <= 'X';
        dy <= 'X';
      end if;
    elsif enb_n_i = '1' then
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
