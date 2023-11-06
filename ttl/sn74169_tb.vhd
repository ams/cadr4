library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74169_tb is
end;

architecture testbench of sn74169_tb is

  signal clk     : std_logic;
  signal up_dn   : std_logic;
  signal load_n  : std_logic;
  signal enb_p_n : std_logic;
  signal enb_t_n : std_logic;
  signal o0      : std_logic;
  signal o1      : std_logic;
  signal o2      : std_logic;
  signal o3      : std_logic;
  signal i0      : std_logic;
  signal i1      : std_logic;
  signal i2      : std_logic;
  signal i3      : std_logic;
  signal co_n    : std_logic;

begin

  uut : sn74169 port map(
    co_n => co_n,
    i3   => i3,
    i2   => i2,
    i1   => i1,
    i0   => i0,

    o3 => o3,
    o2 => o2,
    o1 => o1,
    o0 => o0,

    enb_t_n => enb_t_n,
    enb_p_n => enb_p_n,
    load_n  => load_n,
    up_dn   => up_dn,
    clk     => clk
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
