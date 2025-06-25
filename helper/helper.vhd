library ieee;
use ieee.std_logic_1164.all;

package helper is
  component helper_required_signals is
    port (
      -- mcpins
      \-halt\: out std_logic;
      -- mbcpin
        mclk7: in std_logic;
    -- below are all spy related
    \-eadr0\: out std_logic;
    \-eadr1\: out std_logic;
    \-eadr2\: out std_logic;
    \-eadr3\: out std_logic;
    \-dbread\: out std_logic;
    \-dbwrite\: out std_logic;
    -- initiates a clock reset
    \-busint.lm.reset\: out std_logic;
    -- initiates a boot
    \-boot1\: out std_logic;
    -- same as power reset or prog.bus.reset
    \-bus.reset\: in std_logic;
    \lm drive enb\: out std_logic;
    -- same as power reset
    \bus.power.reset l\: in std_logic
    );
  end component;
end package;