-- 250ns time delay, 50ns increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td250 is
  port (
    input   : in  std_logic;
    o_50ns  : out std_logic;
    o_100ns : out std_logic;
    o_150ns : out std_logic;
    o_200ns : out std_logic;
    o_250ns : out std_logic
    );
end;

architecture ttl of td250 is
begin

  process (input) is
  begin
    o_50ns  <= '0' after 0 ns, '1' after 50 ns;
    o_100ns <= '0' after 50 ns, '1' after 100 ns;
    o_150ns <= '0' after 100 ns, '1' after 150 ns;
    o_200ns <= '0' after 150 ns, '1' after 200 ns;
    o_250ns <= '0' after 200 ns, '1' after 250 ns;
  end process;

end;
