library ieee;
use ieee.std_logic_1164.all;

entity timedelay is
  generic (
    initial   : time     := 50 ns;
    increment : time     := 10 ns;
    taps      : positive := 5
    );
  port (
    input   : in  std_logic;
    delayed : out std_logic_vector(taps-1 downto 0)
    );
end timedelay;

architecture behavioral of timedelay is
  signal delayed_buffers : std_logic_vector(taps-1 downto 0) := (others => '0');
begin

  process
    variable delay : time := initial;
  begin
    for i in 0 to taps-1 loop
      wait for delay;
      delayed(i) <= input;
      delay      := delay + increment;
    end loop;
  end process;

end;
