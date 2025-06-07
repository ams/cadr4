library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sn74;
use work.dip;

entity dip_74s169_tb is
end entity;

architecture test of dip_74s169_tb is
  -- ttl component
  component sn74169 is
    port (
      co_n    : out std_logic;
      i3      : in  std_logic;
      i2      : in  std_logic;
      i1      : in  std_logic;
      i0      : in  std_logic;
      o3      : out std_logic;
      o2      : out std_logic;
      o1      : out std_logic;
      o0      : out std_logic;
      enb_t_n : in  std_logic;
      enb_p_n : in  std_logic;
      load_n  : in  std_logic;
      up_dn   : in  std_logic;
      clk     : in  std_logic
      );
  end component;


  -- dip signals
  signal p1  : std_logic;
  signal p2  : std_logic;
  signal p3  : std_logic;
  signal p4  : std_logic;
  signal p5  : std_logic;
  signal p6  : std_logic;
  signal p7  : std_logic;
  signal p8  : std_logic;
  signal p9  : std_logic;
  signal p10 : std_logic;
  signal p11 : std_logic;
  signal p12 : std_logic;
  signal p13 : std_logic;
  signal p14 : std_logic;
  signal p15 : std_logic;
  signal p16 : std_logic;

  -- ttl signals
  signal co_n    : std_logic;
  signal i3      : std_logic;
  signal i2      : std_logic;
  signal i1      : std_logic;
  signal i0      : std_logic;
  signal o3      : std_logic;
  signal o2      : std_logic;
  signal o1      : std_logic;
  signal o0      : std_logic;
  signal enb_t_n : std_logic;
  signal enb_p_n : std_logic;
  signal load_n  : std_logic;
  signal up_dn   : std_logic;
  signal clk     : std_logic;

  constant clk_period : time := 100 ns;
  signal test_finished : boolean := false;

begin
  u_dip : entity work.dip_74s169
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p7  => p7,
      p8  => p8,
      p9  => p9,
      p10 => p10,
      p11 => p11,
      p12 => p12,
      p13 => p13,
      p14 => p14,
      p15 => p15,
      p16 => p16
      );

  u_ttl : sn74169
    port map (
      co_n    => co_n,
      i3      => i3,
      i2      => i2,
      i1      => i1,
      i0      => i0,
      o3      => o3,
      o2      => o2,
      o1      => o1,
      o0      => o0,
      enb_t_n => enb_t_n,
      enb_p_n => enb_p_n,
      load_n  => load_n,
      up_dn   => up_dn,
      clk     => clk
      );

  -- clk process
  p_clk : process
  begin
    while not test_finished loop
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end loop;
    wait;
  end process;

  -- Connect dip and ttl signals
  p1  <= up_dn;
  p2  <= clk;
  p3  <= i0;
  p4  <= i1;
  p5  <= i2;
  p6  <= i3;
  p7  <= enb_p_n;
  p9  <= load_n;
  p10 <= enb_t_n;

  p8  <= '0';
  p16 <= '1';

  -- Verification
  p_verify: process(clk)
  begin
    if rising_edge(clk) then
      assert p11 = o3 and p12 = o2 and p13 = o1 and p14 = o0 and p15 = co_n
        report "Mismatch between dip and ttl outputs"
        severity failure;
    end if;
  end process;

  -- Test sequence
  p_stim : process
  begin
    -- test load
    load_n  <= '0';
    i3      <= '1';
    i2      <= '0';
    i1      <= '1';
    i0      <= '0';
    wait for clk_period;
    load_n <= '1';

    -- test count up
    up_dn   <= '1';
    enb_p_n <= '0';
    enb_t_n <= '0';
    for i in 0 to 16 loop
      wait for clk_period;
    end loop;

    -- test count down
    up_dn <= '0';
    for i in 0 to 16 loop
      wait for clk_period;
    end loop;

    -- test enables
    enb_p_n <= '1';
    wait for clk_period * 2;
    enb_p_n <= '0';
    enb_t_n <= '1';
    wait for clk_period * 2;
    enb_t_n <= '0';

    report "dip_74s169_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 