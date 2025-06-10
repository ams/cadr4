library ieee;
use ieee.std_logic_1164.all;

entity timedelay is
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
end timedelay;

architecture behavioral of timedelay is
begin
  tap1 <= input after single_tap_delay;
  tap2 <= tap1 after single_tap_delay;
  tap3 <= tap2 after single_tap_delay;
  tap4 <= tap3 after single_tap_delay;
  output <= tap4 after single_tap_delay;
end;