library ieee;
use ieee.std_logic_1164.all;

entity timedelay is
  generic (
    single_tap_delay : time := 5 ns
    );
  port (
    input  : in  std_logic;
    tap1   : out std_logic;
    tap2   : out std_logic;
    tap3   : out std_logic;
    tap4   : out std_logic;
    output : out std_logic
    );
end timedelay;

-- transport delay has to be used !!!
architecture behavioral of timedelay is
begin
  tap1 <= transport input after single_tap_delay;
  tap2 <= transport input after single_tap_delay * 2;
  tap3 <= transport input after single_tap_delay * 3;
  tap4 <= transport input after single_tap_delay * 4;
  output <= transport input after single_tap_delay * 5;
end;