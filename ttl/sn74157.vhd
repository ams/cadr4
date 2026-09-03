-- Quadruple 2-Line To 1-Line Data Selectors/Multiplexers
-- Pin numbers as wired by dip_74s157: sections a1/b1/y1 .. a4/b4/y4 sit on the
-- datasheet sections 4 .. 1 (each section stays together, so this is equivalent).

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74157 is
  port (
    enb_n : in std_logic; -- Pin 15 (G, strobe)
    sel   : in std_logic; -- Pin 1 (A/B)

    a1 : in std_logic;    -- Pin 14 (4A)
    a2 : in std_logic;    -- Pin 11 (3A)
    a3 : in std_logic;    -- Pin 5 (2A)
    a4 : in std_logic;    -- Pin 2 (1A)

    b1 : in std_logic;    -- Pin 13 (4B)
    b2 : in std_logic;    -- Pin 10 (3B)
    b3 : in std_logic;    -- Pin 6 (2B)
    b4 : in std_logic;    -- Pin 3 (1B)

    y1 : out std_logic;   -- Pin 12 (4Y)
    y2 : out std_logic;   -- Pin 9 (3Y)
    y3 : out std_logic;   -- Pin 7 (2Y)
    y4 : out std_logic    -- Pin 4 (1Y)
    );
end entity;

architecture behavioral of sn74157 is
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
      -- strobe high: all outputs low (the '157 is not three-state; the '257 is)
      y1 <= '0'; y2 <= '0'; y3 <= '0'; y4 <= '0';
    else
      y1 <= 'X'; y2 <= 'X'; y3 <= 'X'; y4 <= 'X';
    end if;
  end process;
end architecture;
