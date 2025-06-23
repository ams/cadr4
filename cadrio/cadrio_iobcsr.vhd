library ieee;
use ieee.std_logic_1164.all;

entity cadrio_iobcsr is
    port (
      \-boot1\: out std_logic := 'Z'
    );
end entity;

architecture suds of cadrio_iobcsr is
begin
    process
    begin
        wait for 400 ns;
        \-boot1\ <= '0';
        wait for 20 ns;
        \-boot1\ <= 'Z';
        wait;
    end process;
end architecture;