-- 25ns Time Delay, 5ns Increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td25 is
  port (
    input  : in  std_logic;
    o_5ns  : out std_logic;
    o_15ns : out std_logic;
    o_10ns : out std_logic;
    o_20ns : out std_logic;
    o_25ns : out std_logic
    );
end;

architecture ttl of td25 is
begin

  process is
  begin
    o_5ns  <= '0';
    o_10ns <= '0';
    o_15ns <= '0';
    o_20ns <= '0';
    o_25ns <= '0';
    wait;
  end process;

  process (input) is
  begin
    if rising_edge(input) then
      o_5ns  <= '1' after 5 ms;
      o_10ns <= '1' after 10 ms;
      o_15ns <= '1' after 15 ms;
      o_20ns <= '1' after 20 ms;
      o_25ns <= '1' after 25 ms;
    end if;
  end process;

  process (input) is
  begin
    if falling_edge(input) then
      o_5ns  <= '0' after 5 ms;
      o_10ns <= '0' after 10 ms;
      o_15ns <= '0' after 15 ms;
      o_20ns <= '0' after 20 ms;
      o_25ns <= '0' after 25 ms;
    end if;
  end process;

end;
