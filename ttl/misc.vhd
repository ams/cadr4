library ieee;
use ieee.std_logic_1164.all;

package misc is

  procedure clkgen(signal clk : out std_logic; constant frequency : real);

  component timedelay is
    generic (
      initial   : time     := 50 ns;
      increment : time     := 10 ns;
      taps      : positive := 5
      );
    port (
      input   : in  std_logic;
      delayed : out std_logic_vector(taps-1 downto 0)
      );
  end component;

  function pullup(s   : std_logic) return std_logic;
  function pulldown(s : std_logic) return std_logic;

  component ff_jk is
    port (
      clk    : in  std_logic;
      j, k   : in  std_logic;
      q, q_n : out std_logic
      );
  end component;

  component ff_jkpc is
    port (
      clk      : in  std_logic;
      pre, clr : in  std_logic;
      j, k     : in  std_logic;
      q, q_n   : out std_logic
      );
  end component;

  component ff_d is
    port (
      clk    : in  std_logic;
      d      : in  std_logic;
      q, q_n : out std_logic
      );
  end component;

  component ff_dc is
    port (
      clk    : in  std_logic;
      clr    : in  std_logic;
      d      : in  std_logic;
      q, q_n : out std_logic
      );
  end component;

end;

package body misc is

  procedure clkgen(signal clk : out std_logic; constant frequency : real) is
    constant period    : time := 1 sec / frequency;   -- Full period.
    constant high_time : time := period / 2;          -- High time.
    constant low_time  : time := period - high_time;  -- Low time; always >= HIGH_TIME.
  begin
    assert (high_time /= 0 fs)
      report "clkgen: High time is zero; time resolution to large for frequency."
      severity failure;
    loop
      clk <= '1';
      wait for high_time;
      clk <= '0';
      wait for low_time;
    end loop;
  end procedure;

  function pullup(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '1' | 'Z' => pull := '1';
      when others    => pull := 'Z';
    end case;
    return pull;
  end;

  function pulldown(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '0' | 'Z' => pull := '0';
      when others    => pull := 'Z';
    end case;
    return pull;
  end;

end;
