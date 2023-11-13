library ieee;
use ieee.std_logic_1164.all;

entity cadr4_tb is
end;

architecture testbench of cadr4_tb is

  component cadr4 is
    port (
      \-boot1\       : in std_logic;
      \-boot2\       : in std_logic;
      \-power_reset\ : in std_logic
      );
  end component;

  signal \-boot1\       : std_logic;
  signal \-boot2\       : std_logic;
  signal \-power_reset\ : std_logic;

begin

  uut : cadr4 port map (\-boot1\ => \-boot1\,
                        \-boot2\ => \-boot2\,
                        \-power_reset\ => \-power_reset\
                        );

  process
  begin
    wait for 5 ns;

    \-boot1\ <= '1' after 10 ns;
    \-boot2\ <= '1' after 10 ns;

    wait for 10 ns;

    \-boot1\ <= '0' after 10 ns;
    \-boot2\ <= '0' after 10 ns;

    wait for 10 ns;

    wait;
  end process;

end;
