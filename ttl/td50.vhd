-- 50ns time delay, 10ns increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td50 is
  port (
    clk    : in  std_logic;
    o_10ns : out std_logic;
    o_20ns : out std_logic;
    o_30ns : out std_logic;
    o_40ns : out std_logic;
    o_50ns : out std_logic
    );
end td50;

architecture ttl of td50 is
begin

  process is
  begin
    o_10ns <= '0';
    o_20ns <= '0';
    o_30ns <= '0';
    o_40ns <= '0';
    o_50ns <= '0';
    wait;
  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      o_10ns <= '1' after 10 ms;
      o_20ns <= '1' after 20 ms;
      o_30ns <= '1' after 30 ms;
      o_40ns <= '1' after 40 ms;
      o_50ns <= '1' after 50 ms;
    end if;
  end process;

  process (clk) is
  begin
    if falling_edge(clk) then
      o_10ns <= '0' after 10 ms;
      o_20ns <= '0' after 20 ms;
      o_30ns <= '0' after 30 ms;
      o_40ns <= '0' after 40 ms;
      o_50ns <= '0' after 50 ms;
    end if;
  end process;

end architecture;

