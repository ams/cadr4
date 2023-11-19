library ieee;
use ieee.std_logic_1164.all;

library cadr4;

entity cadr4_tb is
end cadr4_tb;

architecture testbench of cadr4_tb is

  component cpu
    port (
      \-boot1\ : in std_logic;
      \-boot2\ : in std_logic
      );
  end component;

  signal \-boot1\ : std_logic;
  signal \-boot2\ : std_logic;

  for uut : cpu use entity cadr4.cpu;

begin

  uut : cpu port map (\-boot1\ => \-boot1\,
                      \-boot2\ => \-boot2\
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
