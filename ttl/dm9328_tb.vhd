library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm9328;

entity dm9328_tb is
end entity;

architecture testbench of dm9328_tb is

  signal clr_n  : std_logic;
  signal aq_n   : std_logic;
  signal aq     : std_logic;
  signal asel   : std_logic;
  signal ai1    : std_logic;
  signal ai0    : std_logic;
  signal aclk   : std_logic;
  signal comclk : std_logic;
  signal bclk   : std_logic;
  signal bi0    : std_logic;
  signal bi1    : std_logic;
  signal bsel   : std_logic;
  signal bq     : std_logic;
  signal bq_n   : std_logic;

begin

  uut : dm9328 port map(
    clr_n  => clr_n,
    aq_n   => aq_n,
    aq     => aq,
    asel   => asel,
    ai1    => ai1,
    ai0    => ai0,
    aclk   => aclk,
    comclk => comclk,
    bclk   => bclk,
    bi0    => bi0,
    bi1    => bi1,
    bsel   => bsel,
    bq     => bq,
    bq_n   => bq_n
    );

  process
  begin
    -- initialize signals
    aclk <= '0';
    bclk <= '0';
    ai0 <= '0';
    ai1 <= '0';
    bi0 <= '0';
    bi1 <= '0';
    asel <= '0';
    bsel <= '0';
    comclk <= '0';
    
    -- clear registers
    clr_n <= '0'; 
    wait for 1 ns; 
    clr_n <= '1';
    wait for 1 ns;
    assert aq = '0' and aq_n = '1' and bq = '0' and bq_n = '1';

    -- shift ones into register A using ai0
    asel <= '0'; 
    ai0 <= '1';
    wait for 1 ns;
    for i in 0 to 7 loop
      aclk <= '1'; 
      wait for 1 ns; 
      aclk <= '0'; 
      wait for 1 ns;
    end loop;
    wait for 1 ns;
    assert aq = '1' and aq_n = '0';

    -- shift ones into register B using bi1
    bsel <= '1'; 
    bi1 <= '1';
    wait for 1 ns;
    for i in 0 to 7 loop
      bclk <= '1'; 
      wait for 1 ns; 
      bclk <= '0'; 
      wait for 1 ns;
    end loop;
    wait for 1 ns;
    assert bq = '1' and bq_n = '0';

    wait;
  end process;

end architecture;
