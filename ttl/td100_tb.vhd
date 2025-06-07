library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity td100_tb is
end;

architecture testbench of td100_tb is

  signal o_100ns : std_logic;
  signal o_80ns  : std_logic;
  signal o_60ns  : std_logic;
  signal o_40ns  : std_logic;
  signal o_20ns  : std_logic;
  signal input   : std_logic;

begin

  uut : td100 port map(
    input   => input,
    o_20ns  => o_20ns,
    o_40ns  => o_40ns,
    o_60ns  => o_60ns,
    o_80ns  => o_80ns,
    o_100ns => o_100ns
    );

  process
  begin
    -- Initialize
    input <= '0';
    wait for 100 ns;

    -- Test 1: Rising edge and verify delays
    input <= '1';
    wait for 99 ns;
    assert o_20ns = '0' report "o_20ns should not have changed yet";
    wait for 2 ns; -- total 101ns
    assert o_20ns = '1' report "o_20ns should be '1' after 100ns delay";
    assert o_40ns = '0' report "o_40ns should not have changed yet";
    
    wait for 20 ns; -- total 121ns
    assert o_40ns = '1' report "o_40ns should be '1' after 120ns delay";
    assert o_60ns = '0' report "o_60ns should not have changed yet";
    
    wait for 20 ns; -- total 141ns
    assert o_60ns = '1' report "o_60ns should be '1' after 140ns delay";
    assert o_80ns = '0' report "o_80ns should not have changed yet";
    
    wait for 20 ns; -- total 161ns
    assert o_80ns = '1' report "o_80ns should be '1' after 160ns delay";
    assert o_100ns = '0' report "o_100ns should not have changed yet";
    
    wait for 20 ns; -- total 181ns
    assert o_100ns = '1' report "o_100ns should be '1' after 180ns delay";

    -- Test 2: Falling edge
    input <= '0';
    wait for 181 ns;
    assert o_20ns = '0' and o_40ns = '0' and o_60ns = '0' and o_80ns = '0' and o_100ns = '0'
      report "All outputs should be '0' after falling edge delay";

    wait;
  end process;

end;
