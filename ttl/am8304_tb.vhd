library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity am8304_tb is
end entity;

architecture behavioral of am8304_tb is
  signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic;
  signal b0, b1, b2, b3, b4, b5, b6, b7 : std_logic;
  signal chip_disable, transmit : std_logic;
  
  constant period : time := 100 ns;
begin

  uut : entity work.am8304 
    port map (
      a0 => a0, a1 => a1, a2 => a2, a3 => a3,
      a4 => a4, a5 => a5, a6 => a6, a7 => a7,
      b0 => b0, b1 => b1, b2 => b2, b3 => b3,
      b4 => b4, b5 => b5, b6 => b6, b7 => b7,
      chip_disable => chip_disable,
      transmit => transmit
    );

  process
    variable l : line;
  begin
    write(l, string'("Testing AM8304 Octal Bidirectional Bus Transceiver"));
    writeline(output, l);
    
    -- Test 1: Chip disabled - all outputs should be Z
    write(l, string'("Test 1: Chip disabled"));
    writeline(output, l);
    chip_disable <= '1';
    transmit <= '0';
    a0 <= '1'; a1 <= '0'; a2 <= '1'; a3 <= '0';
    a4 <= '1'; a5 <= '0'; a6 <= '1'; a7 <= '0';
    b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
    b4 <= '0'; b5 <= '1'; b6 <= '0'; b7 <= '1';
    wait for period;
    
    -- Test 2: Transmit mode (A to B)
    write(l, string'("Test 2: Transmit mode (A to B)"));
    writeline(output, l);
    chip_disable <= '0';
    transmit <= '1';
    a0 <= '1'; a1 <= '0'; a2 <= '1'; a3 <= '0';
    a4 <= '1'; a5 <= '0'; a6 <= '1'; a7 <= '0';
    b0 <= 'Z'; b1 <= 'Z'; b2 <= 'Z'; b3 <= 'Z';
    b4 <= 'Z'; b5 <= 'Z'; b6 <= 'Z'; b7 <= 'Z';
    wait for period;
    
    -- Test 3: Receive mode (B to A)
    write(l, string'("Test 3: Receive mode (B to A)"));
    writeline(output, l);
    chip_disable <= '0';
    transmit <= '0';
    a0 <= 'Z'; a1 <= 'Z'; a2 <= 'Z'; a3 <= 'Z';
    a4 <= 'Z'; a5 <= 'Z'; a6 <= 'Z'; a7 <= 'Z';
    b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
    b4 <= '0'; b5 <= '1'; b6 <= '0'; b7 <= '1';
    wait for period;
    
    -- Test 4: Another transmit test with different pattern
    write(l, string'("Test 4: Transmit with different pattern"));
    writeline(output, l);
    chip_disable <= '0';
    transmit <= '1';
    a0 <= '0'; a1 <= '1'; a2 <= '1'; a3 <= '0';
    a4 <= '0'; a5 <= '1'; a6 <= '1'; a7 <= '0';
    b0 <= 'Z'; b1 <= 'Z'; b2 <= 'Z'; b3 <= 'Z';
    b4 <= 'Z'; b5 <= 'Z'; b6 <= 'Z'; b7 <= 'Z';
    wait for period;
    
    -- Test 5: Another receive test with different pattern
    write(l, string'("Test 5: Receive with different pattern"));
    writeline(output, l);
    chip_disable <= '0';
    transmit <= '0';
    a0 <= 'Z'; a1 <= 'Z'; a2 <= 'Z'; a3 <= 'Z';
    a4 <= 'Z'; a5 <= 'Z'; a6 <= 'Z'; a7 <= 'Z';
    b0 <= '1'; b1 <= '1'; b2 <= '0'; b3 <= '0';
    b4 <= '1'; b5 <= '1'; b6 <= '0'; b7 <= '0';
    wait for period;
    
    write(l, string'("Test completed"));
    writeline(output, l);
    wait;
  end process;

end architecture;
