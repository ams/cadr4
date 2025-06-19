library ieee;
use ieee.std_logic_1164.all;

entity cadrio_iobcsr is
    port (
      \-boot1\: out std_logic
    );
end entity;

architecture suds of cadrio_iobcsr is
begin
    process
    begin
        \-boot1\ <= '1';
        wait for 400 ns;
        \-boot1\ <= '0';
        wait for 20 ns;
        \-boot1\ <= '1';    
        wait for 2000 ns;
        wait;
    end process;
end architecture;