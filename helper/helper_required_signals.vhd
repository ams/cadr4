library ieee;
use ieee.std_logic_1164.all;

entity helper_required_signals is
  port (
    \-halt\: out std_logic := '1';
    \-lm boot\: out std_logic
  );
end entity;

architecture structural of helper_required_signals is
begin
  process
  begin
    \-lm boot\ <= '1';
    wait for 50 ns;
    \-lm boot\ <= '0';
    wait for 50 ns;
    \-lm boot\ <= '1';
    wait;
  end process;
end architecture;