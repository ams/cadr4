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
begin

  process (input)
    variable delay : time;
  begin
    if input'event then
      delay := initial;
      for i in 0 to taps-1 loop
        delayed(i) <= input after delay;
        delay      := delay + increment;
      end loop;
    else
      -- Initialize on first delta cycle
      delayed <= (others => '0');
    end if;
  end process;

end;
