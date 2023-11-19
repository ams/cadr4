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

  process (input) is
  begin
    o_5ns  <= '0' after 0 ns, '1' after 5 ns;
    o_10ns <= '0' after 5 ns, '1' after 10 ns;
    o_15ns <= '0' after 10 ns, '1' after 15 ns;
    o_20ns <= '0' after 15 ns, '1' after 20 ns;
    o_25ns <= '0' after 20 ns, '1' after 25 ns;
  end process;

end;
