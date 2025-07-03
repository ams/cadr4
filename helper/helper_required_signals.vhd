library ieee;
use ieee.std_logic_1164.all;

use work.helper.all;

entity helper_required_signals is
  port (
    -- mcpins
    \-halt\: out std_logic := '1';
    -- mbcpin    
    mclk7: in std_logic;
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
end architecture;