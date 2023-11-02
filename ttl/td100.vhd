-- 100ns time delay, 20ns increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td100 is
  port (
    clk     : in  std_logic;
    o_20ns  : out std_logic;
    o_40ns  : out std_logic;
    o_60ns  : out std_logic;
    o_80ns  : out std_logic;
    o_100ns : out std_logic
    );
end td100;

architecture ttl of td100 is
begin

  process is
  begin
    o_20ns  <= '0';
    o_40ns  <= '0';
    o_60ns  <= '0';
    o_80ns  <= '0';
    o_100ns <= '0';
    wait;
  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      o_20ns  <= '1' after 20 ms;
      o_40ns  <= '1' after 40 ms;
      o_60ns  <= '1' after 60 ms;
      o_80ns  <= '1' after 80 ms;
      o_100ns <= '1' after 100 ms;
    end if;
  end process;

  process (clk) is
  begin
    if falling_edge(clk) then
      o_20ns  <= '0' after 20 ms;
      o_40ns  <= '0' after 40 ms;
      o_60ns  <= '0' after 60 ms;
      o_80ns  <= '0' after 80 ms;
      o_100ns <= '0' after 100 ms;
    end if;
  end process;

end architecture;

