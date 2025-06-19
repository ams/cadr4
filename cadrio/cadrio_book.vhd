library ieee;
use ieee.std_logic_1164.all;

package cadrio_book is

  component cadrio_iobcsr is
    port (
      \-boot1\: out std_logic
    );
  end component;

end package;
