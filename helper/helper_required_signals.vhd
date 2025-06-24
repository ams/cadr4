library ieee;
use ieee.std_logic_1164.all;

use work.helper.all;

entity helper_required_signals is
  port (
    -- mbcpin    
    mclk7: in std_logic;
    -- below are all spy related
    \-eadr0\: out std_logic := '1';
    \-eadr1\: out std_logic := '1';
    \-eadr2\: out std_logic := '1';
    \-eadr3\: out std_logic := '1';
    \-dbread\: out std_logic := '1';
    \-dbwrite\: out std_logic := '1';
    -- initiates a clock reset
    \-busint.lm.reset\: out std_logic := '1';
    -- initiates a boot
    \-boot1\: out std_logic := '1';
    -- same as power reset or prog.bus.reset
    \-bus.reset\: in std_logic;
    \lm drive enb\: out std_logic := '0';
    -- same as power reset
    \bus.power.reset l\: in std_logic
  );
end entity;

architecture structural of helper_required_signals is
begin
  process
  begin
    wait for 200 ns;
    \-boot1\ <= '0';
    wait for 20 ns;
    \-boot1\ <= 'Z';
    wait;
  end process;
end architecture;