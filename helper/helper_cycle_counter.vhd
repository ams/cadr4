library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity helper_cycle_counter is 
    port (
        clk1 : in std_logic
    );
end entity;

architecture behavioral of helper_cycle_counter is
    signal counter : unsigned(63 downto 0) := (others => '0');
begin

    process (clk1)
    begin
        if rising_edge(clk1) then
          counter <= counter + 1;
        end if;
    end process;

end architecture;