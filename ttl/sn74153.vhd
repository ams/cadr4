-- Dual 4-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74153 is
  port (
    enb1_n : in  std_logic;
    sel1   : in  std_logic;
    g1c3   : in  std_logic;
    g1c2   : in  std_logic;
    g1c1   : in  std_logic;
    g1c0   : in  std_logic;
    g1q    : out std_logic;
    g2q    : out std_logic;
    g2c0   : in  std_logic;
    g2c1   : in  std_logic;
    g2c2   : in  std_logic;
    g2c3   : in  std_logic;
    sel0   : in  std_logic;
    enb2_n : in  std_logic
    );
end;

architecture ttl of sn74153 is
begin

end;
