-- 50ns Time Delay, 10ns Increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td50 is
  port (
    input  : in  std_logic;
    o_10ns : out std_logic;
    o_20ns : out std_logic;
    o_30ns : out std_logic;
    o_40ns : out std_logic;
    o_50ns : out std_logic
    );
end;

architecture ttl of td50 is
begin

  process (input) is
  begin
    o_10ns <= '0' after 0 ns, '1' after 10 ns;
    o_20ns <= '0' after 10 ns, '1' after 20 ns;
    o_30ns <= '0' after 20 ns, '1' after 30 ns;
    o_40ns <= '0' after 30 ns, '1' after 40 ns;
    o_50ns <= '0' after 40 ns, '1' after 50 ns;
  end process;

end;
