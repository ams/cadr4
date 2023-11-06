library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74241 is
  port (
    aenb_n : in  std_logic;
    ain0   : in  std_logic;
    bout3  : out std_logic;
    ain1   : in  std_logic;
    bout2  : out std_logic;
    ain2   : in  std_logic;
    bout1  : out std_logic;
    ain3   : in  std_logic;
    bout0  : out std_logic;
    bin0   : in  std_logic;
    aout3  : out std_logic;
    bin1   : in  std_logic;
    aout2  : out std_logic;
    bin2   : in  std_logic;
    aout1  : out std_logic;
    bin3   : in  std_logic;
    aout0  : out std_logic;
    benb   : in  std_logic
    );
end;

architecture ttl of sn74241 is
begin

end;
