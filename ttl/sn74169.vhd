-- Synchronous 4-Bit Up/Down Binary Counters

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74169 is
  port (
    co_n : out std_logic;
    i3   : in  std_logic;
    i2   : in  std_logic;
    i1   : in  std_logic;
    i0   : in  std_logic;

    o3 : out std_logic;
    o2 : out std_logic;
    o1 : out std_logic;
    o0 : out std_logic;

    enb_t_n : in std_logic;
    enb_p_n : in std_logic;
    load_n  : in std_logic;
    up_dn   : in std_logic;
    clk     : in std_logic
    );
end;

architecture ttl of sn74169 is
begin

end;
