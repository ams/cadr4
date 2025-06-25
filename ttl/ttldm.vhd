-- Logic Delay Module
-- Engineered Components Company TTLDM Generic Model
-- doc/ttl/ttldm.pdf

library ieee;
use ieee.std_logic_1164.all;

entity ttldm is
  generic (
    single_tap_delay : time := 5 ns
    );
  port (
    input  : in  std_logic;
    tap1   : out std_logic := '0';
    tap2   : out std_logic := '0';
    tap3   : out std_logic := '0';
    tap4   : out std_logic := '0';
    output : out std_logic := '0'
    );
end ttldm;

architecture behavioral of ttldm is
  signal input_int : std_logic;
  signal input_var : std_logic;
begin
  input_int <= 'H'; input_int <= input;
  
  input_var <= to_x01(input_int);
  tap1 <= transport input_var after single_tap_delay;
  tap2 <= transport input_var after single_tap_delay * 2;
  tap3 <= transport input_var after single_tap_delay * 3;
  tap4 <= transport input_var after single_tap_delay * 4;
  output <= transport input_var after single_tap_delay * 5;
end;