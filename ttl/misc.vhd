library ieee;
use ieee.std_logic_1164.all;

package misc is

  function pullup(s   : std_logic) return std_logic;
  function pulldown(s : std_logic) return std_logic;

  component ff_jk is
    port (
      clk    : in  std_logic;
      j, k   : in  std_logic;
      q, q_n : out std_logic
      );
  end component;

end package misc;

package body misc is

  function pullup(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '1' | 'Z' => pull := '1';
      when others    => pull := 'Z';
    end case;
    return pull;
  end pullup;

  function pulldown(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '0' | 'Z' => pull := '0';
      when others    => pull := 'Z';
    end case;
    return pull;
  end pulldown;

end package body misc;
