library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity td250_tb is
end;

architecture testbench of td250_tb is

  signal o_250ns : std_logic;
  signal o_200ns : std_logic;
  signal o_150ns : std_logic;
  signal o_100ns : std_logic;
  signal o_50ns  : std_logic;
  signal input   : std_logic;

begin

  uut : td250 port map(
    input   => input,
    o_50ns  => o_50ns,
    o_100ns => o_100ns,
    o_150ns => o_150ns,
    o_200ns => o_200ns,
    o_250ns => o_250ns
    );

  process
  begin
    -- Initialize
    input <= '0';
    wait for 250 ns;

    -- Test 1: Rising edge and verify delays
    input <= '1';
    wait for 249 ns;
    assert o_50ns = '0' report "o_50ns should not have changed yet";
    wait for 2 ns; -- total 251ns
    assert o_50ns = '1' report "o_50ns should be '1' after 250ns delay";
    assert o_100ns = '0' report "o_100ns should not have changed yet";

    wait for 50 ns; -- total 301ns
    assert o_100ns = '1' report "o_100ns should be '1' after 300ns delay";
    assert o_150ns = '0' report "o_150ns should not have changed yet";

    wait for 50 ns; -- total 351ns
    assert o_150ns = '1' report "o_150ns should be '1' after 350ns delay";
    assert o_200ns = '0' report "o_200ns should not have changed yet";

    wait for 50 ns; -- total 401ns
    assert o_200ns = '1' report "o_200ns should be '1' after 400ns delay";
    assert o_250ns = '0' report "o_250ns should not have changed yet";

    wait for 50 ns; -- total 451ns
    assert o_250ns = '1' report "o_250ns should be '1' after 450ns delay";

    -- Test 2: Falling edge
    input <= '0';
    wait for 451 ns;
    assert o_50ns = '0' and o_100ns = '0' and o_150ns = '0' and o_200ns = '0' and o_250ns = '0'
      report "All outputs should be '0' after falling edge delay";

    wait;
  end process;

end;
