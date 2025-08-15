-- Logic Delay Module
-- Engineered Components Company TTLDM Generic Model

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

-- This is a critical component for the clock to tick properly.
-- Proper clock after power on reset is:
-- -TPR40 being a 40ns low pulse with 220ns period.
-- TPCLK having 220ns period with 160ns high pulse, 60ns low pulse.

-- The outputs of TTLDM should be initialized to H or 1 for this to work.
-- If not H or 1, S'R' latches do not work properly in clock1 and clock2 
-- because -tpr/-tpw signals are used as S' or R' and H or 1 is a not care
-- value. If they are 0, it is an illegal state.

-- The input is TTL, pulled weak high.
-- Maybe one interpretation is because they are pulled high, the outputs are 
-- also expected to be H with no inputs.

entity ttldm is
  generic (
    single_tap_delay : time := 5 ns
    );
  port (
    input  : in  std_logic;
    tap1   : out std_logic := 'H';
    tap2   : out std_logic := 'H';
    tap3   : out std_logic := 'H';
    tap4   : out std_logic := 'H';
    output : out std_logic := 'H'
    );
end ttldm;

architecture behavioral of ttldm is
  signal input_int : std_logic;
begin
  input_int <= ttl_input(input);
  tap1 <= transport input_int after single_tap_delay;
  tap2 <= transport input_int after single_tap_delay * 2;
  tap3 <= transport input_int after single_tap_delay * 3;
  tap4 <= transport input_int after single_tap_delay * 4;
  output <= transport input_int after single_tap_delay * 5;
end;
