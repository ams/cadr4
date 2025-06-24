library ieee;
use ieee.std_logic_1164.all;

use work.ecc.ttldm_250;

entity ttldm_250_tb is
end;

architecture testbench of ttldm_250_tb is

  signal o_250ns : std_logic;
  signal o_200ns : std_logic;
  signal o_150ns : std_logic;
  signal o_100ns : std_logic;
  signal o_50ns  : std_logic;
  signal input   : std_logic;

begin

  uut : ttldm_250 port map(
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
    wait for 100 ns;

    -- Test 1: Rising edge and verify delays
    input <= '1';
    wait for 50 ns;
    wait for 1 ps; -- small delta delay
    assert o_50ns = '1' report "o_50ns should be '1' after 50ns delay";
    assert o_100ns = '0' report "o_100ns should not have changed yet";

    wait for 50 ns; -- total 100ns
    assert o_100ns = '1' report "o_100ns should be '1' after 100ns delay";
    assert o_150ns = '0' report "o_150ns should not have changed yet";

    wait for 50 ns; -- total 150ns
    assert o_150ns = '1' report "o_150ns should be '1' after 150ns delay";
    assert o_200ns = '0' report "o_200ns should not have changed yet";

    wait for 50 ns; -- total 200ns
    assert o_200ns = '1' report "o_200ns should be '1' after 200ns delay";
    assert o_250ns = '0' report "o_250ns should not have changed yet";

    wait for 50 ns; -- total 250ns
    assert o_250ns = '1' report "o_250ns should be '1' after 250ns delay";

    -- Test 2: Falling edge
    input <= '0';
    wait for 300 ns;
    assert o_50ns = '0' and o_100ns = '0' and o_150ns = '0' and o_200ns = '0' and o_250ns = '0'
      report "All outputs should be '0' after falling edge delay";

    wait;
  end process;

end;
