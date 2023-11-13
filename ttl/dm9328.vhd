-- Dual 8-Bit Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9328 is
  port (
    comclk : in std_logic;
    clr_n  : in std_logic;

    aclk     : in  std_logic;
    ai0, ai1 : in  std_logic;
    aq, aq_n : out std_logic;
    asel     : in  std_logic;

    bclk     : in  std_logic;
    bi0, bi1 : in  std_logic;
    bq, bq_n : out std_logic;
    bsel     : in  std_logic
    );
end dm9328;

architecture ttl of dm9328 is
begin

end ttl;
