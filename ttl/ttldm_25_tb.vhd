library ieee;
use ieee.std_logic_1164.all;

use work.ecc.ttldm_25;

entity ttldm_25_tb is
end;

architecture testbench of ttldm_25_tb is

  signal o_5ns  : std_logic;
  signal o_10ns : std_logic;
  signal o_15ns : std_logic;
  signal o_20ns : std_logic;
  signal o_25ns : std_logic;
  signal input  : std_logic;

begin

  uut : ttldm_25 port map(
    input  => input,
    o_5ns  => o_5ns,
    o_10ns => o_10ns,
    o_15ns => o_15ns,
    o_20ns => o_20ns,
    o_25ns => o_25ns
    );

  process
  begin
    -- Initialize
    input <= '0';
    wait for 10 ns;

    -- Test 1: Rising edge and verify delays
    input <= '1';
    wait for 5 ns;
    wait for 1 ps; -- small delta delay
    assert o_5ns = '1' report "o_5ns should be '1' after 5ns delay";
    assert o_10ns = '0' report "o_10ns should not have changed yet";

    wait for 5 ns; -- total 10ns
    assert o_10ns = '1' report "o_10ns should be '1' after 10ns delay";
    assert o_15ns = '0' report "o_15ns should not have changed yet";

    wait for 5 ns; -- total 15ns
    assert o_15ns = '1' report "o_15ns should be '1' after 15ns delay";
    assert o_20ns = '0' report "o_20ns should not have changed yet";

    wait for 5 ns; -- total 20ns
    assert o_20ns = '1' report "o_20ns should be '1' after 20ns delay";
    assert o_25ns = '0' report "o_25ns should not have changed yet";

    wait for 5 ns; -- total 25ns
    assert o_25ns = '1' report "o_25ns should be '1' after 25ns delay";

    -- Test 2: Falling edge
    input <= '0';
    wait for 50 ns;
    assert o_5ns = '0' and o_10ns = '0' and o_15ns = '0' and o_20ns = '0' and o_25ns = '0'
      report "All outputs should be '0' after falling edge delay";

    wait;
  end process;

end;
