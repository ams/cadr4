library ieee;
use ieee.std_logic_1164.all;

library cadr4;

entity cadr4_tb is
end cadr4_tb;

architecture testbench of cadr4_tb is

  component cpu
  end component;

  for uut : cpu use entity cadr4.cpu;

begin

  uut : cpu;

  process
  begin
    wait;
  end process;

end;
