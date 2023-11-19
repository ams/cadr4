-- 100ns time delay, 20ns increments

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity td100 is
  port (
    input   : in  std_logic;
    o_20ns  : out std_logic;
    o_40ns  : out std_logic;
    o_60ns  : out std_logic;
    o_80ns  : out std_logic;
    o_100ns : out std_logic
    );
end;

architecture ttl of td100 is
begin

  process (input) is
  begin
    o_20ns  <= '0' after 0 ns, '1' after 20 ns;
    o_40ns  <= '0' after 20 ns, '1' after 40 ns;
    o_60ns  <= '0' after 40 ns, '1' after 60 ns;
    o_80ns  <= '0' after 60 ns, '1' after 80 ns;
    o_100ns <= '0' after 80 ns, '1' after 100 ns;
  end process;

end;
