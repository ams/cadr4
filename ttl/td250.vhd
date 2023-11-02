-- 250ns time delay, 50ns increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td250 is
  port (
    clk     : in  std_logic;
    o_50ns  : out std_logic;
    o_100ns : out std_logic;
    o_150ns : out std_logic;
    o_200ns : out std_logic;
    o_250ns : out std_logic
    );
end;

architecture ttl of td250 is
begin

  process is
  begin
    o_50ns  <= '0';
    o_100ns <= '0';
    o_150ns <= '0';
    o_200ns <= '0';
    o_250ns <= '0';
    wait;
  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      o_50ns  <= '1' after 50 ms;
      o_100ns <= '1' after 100 ms;
      o_150ns <= '1' after 150 ms;
      o_200ns <= '1' after 200 ms;
      o_250ns <= '1' after 250 ms;
    end if;
  end process;

  process (clk) is
  begin
    if falling_edge(clk) then
      o_50ns  <= '0' after 50 ms;
      o_100ns <= '0' after 100 ms;
      o_150ns <= '0' after 150 ms;
      o_200ns <= '0' after 200 ms;
      o_250ns <= '0' after 250 ms;
    end if;
  end process;

end;
