-- Quadruple 2-Line To 1-Line Inverse Data Selectors/Multiplexers
-- Pin numbers as wired by dip_74s258: sections a .. d sit on the datasheet
-- sections 4 .. 1 (each section stays together, so this is equivalent).

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74258 is
  port (
    enb_n : in std_logic; -- Pin 15 (G, output control)
    sel   : in std_logic; -- Pin 1 (A/B)

    a0 : in  std_logic;   -- Pin 14 (4A)
    a1 : in  std_logic;   -- Pin 13 (4B)
    ay : out std_logic;   -- Pin 12 (4Y)

    b0 : in  std_logic;   -- Pin 11 (3A)
    b1 : in  std_logic;   -- Pin 10 (3B)
    by : out std_logic;   -- Pin 9 (3Y)

    c0 : in  std_logic;   -- Pin 5 (2A)
    c1 : in  std_logic;   -- Pin 6 (2B)
    cy : out std_logic;   -- Pin 7 (2Y)

    d0 : in  std_logic;   -- Pin 2 (1A)
    d1 : in  std_logic;   -- Pin 3 (1B)
    dy : out std_logic    -- Pin 4 (1Y)
    );
end entity;

architecture behavioral of sn74258 is
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
end architecture;
