-- Dual 8-Bit Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9328 is
  port (
    clr_n  : in  std_logic;
    aq_n   : out std_logic;
    aq     : out std_logic;
    asel   : in  std_logic;
    ai1    : in  std_logic;
    ai0    : in  std_logic;
    aclk   : in  std_logic;
    comclk : in  std_logic;
    bclk   : in  std_logic;
    bi0    : in  std_logic;
    bi1    : in  std_logic;
    bsel   : in  std_logic;
    bq     : out std_logic;
    bq_n   : out std_logic
    );
end dm9328;

architecture ttl of dm9328 is
begin

end ttl;
