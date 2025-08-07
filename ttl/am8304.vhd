library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity am8304 is
  port (
    a0           : inout std_logic;
    a1           : inout std_logic;
    a2           : inout std_logic;
    a3           : inout std_logic;
    a4           : inout std_logic;
    a5           : inout std_logic;
    a6           : inout std_logic;
    a7           : inout std_logic;
    b0           : inout std_logic;
    b1           : inout std_logic;
    b2           : inout std_logic;
    b3           : inout std_logic;
    b4           : inout std_logic;
    b5           : inout std_logic;
    b6           : inout std_logic;
    b7           : inout std_logic;
    chip_disable : in    std_logic;
    transmit     : in    std_logic
    );
end entity;

architecture behavioral of am8304 is
  signal chip_disable_i, transmit_i : std_logic;
begin

  chip_disable_i <= ttl_input(chip_disable);
  transmit_i <= ttl_input(transmit);

  process (all)
  begin
    if chip_disable_i = '1' then
      -- Chip disabled: both ports in high impedance
      a0 <= 'Z'; a1 <= 'Z'; a2 <= 'Z'; a3 <= 'Z';
      a4 <= 'Z'; a5 <= 'Z'; a6 <= 'Z'; a7 <= 'Z';
      b0 <= 'Z'; b1 <= 'Z'; b2 <= 'Z'; b3 <= 'Z';
      b4 <= 'Z'; b5 <= 'Z'; b6 <= 'Z'; b7 <= 'Z';
    elsif chip_disable_i = '0' then
      if transmit_i = '1' then
        -- Transmit mode: A to B
        b0 <= a0; b1 <= a1; b2 <= a2; b3 <= a3;
        b4 <= a4; b5 <= a5; b6 <= a6; b7 <= a7;
        a0 <= 'Z'; a1 <= 'Z'; a2 <= 'Z'; a3 <= 'Z';
        a4 <= 'Z'; a5 <= 'Z'; a6 <= 'Z'; a7 <= 'Z';
      elsif transmit_i = '0' then
        -- Receive mode: B to A
        a0 <= b0; a1 <= b1; a2 <= b2; a3 <= b3;
        a4 <= b4; a5 <= b5; a6 <= b6; a7 <= b7;
        b0 <= 'Z'; b1 <= 'Z'; b2 <= 'Z'; b3 <= 'Z';
        b4 <= 'Z'; b5 <= 'Z'; b6 <= 'Z'; b7 <= 'Z';
      else
        -- Unknown state
        a0 <= 'X'; a1 <= 'X'; a2 <= 'X'; a3 <= 'X';
        a4 <= 'X'; a5 <= 'X'; a6 <= 'X'; a7 <= 'X';
        b0 <= 'X'; b1 <= 'X'; b2 <= 'X'; b3 <= 'X';
        b4 <= 'X'; b5 <= 'X'; b6 <= 'X'; b7 <= 'X';
      end if;
    else
      -- Unknown state
      a0 <= 'X'; a1 <= 'X'; a2 <= 'X'; a3 <= 'X';
      a4 <= 'X'; a5 <= 'X'; a6 <= 'X'; a7 <= 'X';
      b0 <= 'X'; b1 <= 'X'; b2 <= 'X'; b3 <= 'X';
      b4 <= 'X'; b5 <= 'X'; b6 <= 'X'; b7 <= 'X';
    end if;
  end process;

end architecture;
