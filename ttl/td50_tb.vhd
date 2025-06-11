library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity td50_tb is
end;

architecture testbench of td50_tb is

  signal o_10ns : std_logic;
  signal o_20ns : std_logic;
  signal o_30ns : std_logic;
  signal o_40ns : std_logic;
  signal o_50ns : std_logic;
  signal input  : std_logic;

begin

  uut : td50 port map(
    input  => input,
    o_10ns => o_10ns,
    o_20ns => o_20ns,
    o_30ns => o_30ns,
    o_40ns => o_40ns,
    o_50ns => o_50ns
    );

  process
  begin
    -- Initialize
    input <= '0';
    wait for 25 ns;

    -- Test 1: Rising edge and verify delays
    input <= '1';
    wait for 10 ns;
    wait for 1 ps; -- small delta delay
    assert o_10ns = '1' report "o_10ns should be '1' after 10ns delay";
    assert o_20ns = '0' report "o_20ns should not have changed yet";

    wait for 10 ns; -- total 20ns
    assert o_20ns = '1' report "o_20ns should be '1' after 20ns delay";
    assert o_30ns = '0' report "o_30ns should not have changed yet";

    wait for 10 ns; -- total 30ns
    assert o_30ns = '1' report "o_30ns should be '1' after 30ns delay";
    assert o_40ns = '0' report "o_40ns should not have changed yet";

    wait for 10 ns; -- total 40ns
    assert o_40ns = '1' report "o_40ns should be '1' after 40ns delay";
    assert o_50ns = '0' report "o_50ns should not have changed yet";

    wait for 10 ns; -- total 50ns
    assert o_50ns = '1' report "o_50ns should be '1' after 50ns delay";

    -- Test 2: Falling edge
    input <= '0';
    wait for 100 ns;
    assert o_10ns = '0' and o_20ns = '0' and o_30ns = '0' and o_40ns = '0' and o_50ns = '0'
      report "All outputs should be '0' after falling edge delay";

    wait;
  end process;

end;
