library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am252519_tb is
end;

architecture testbench of am252519_tb is

  signal q3b        : std_logic;
  signal q2b        : std_logic;
  signal q1b        : std_logic;
  signal q0b        : std_logic;
  signal q3a        : std_logic;
  signal q2a        : std_logic;
  signal q1a        : std_logic;
  signal q0a        : std_logic;
  signal asyn_clr_n : std_logic;
  signal clk_enb_n  : std_logic;
  signal clk        : std_logic;
  signal out_enb_n  : std_logic;
  signal i3         : std_logic;
  signal i2         : std_logic;
  signal i1         : std_logic;
  signal i0         : std_logic;
  signal inv        : std_logic;
  signal o_enb_n    : std_logic;

begin

  uut : am252519 port map(
    o_enb_n    => o_enb_n,
    inv        => inv,
    i0         => i0,
    i1         => i1,
    i2         => i2,
    i3         => i3,
    out_enb_n  => out_enb_n,
    clk        => clk,
    clk_enb_n  => clk_enb_n,
    asyn_clr_n => asyn_clr_n,
    q0a        => q0a,
    q1a        => q1a,
    q2a        => q2a,
    q3a        => q3a,
    q0b        => q0b,
    q1b        => q1b,
    q2b        => q2b,
    q3b        => q3b
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
