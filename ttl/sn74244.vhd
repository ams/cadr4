-- Octal Buffers and Line Drivers With 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74244 is
  port (
    aenb_n                     : in  std_logic;
    ain0, ain1, ain2, ain3     : in  std_logic;
    aout0, aout1, aout2, aout3 : out std_logic;

    benb_n                     : in  std_logic
    bin0, bin1, bin2, bin3     : in  std_logic;
    bout0, bout1, bout2, bout3 : out std_logic;
    );
end;

architecture ttl of sn74244 is
begin

end;
