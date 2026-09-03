library ieee;
use ieee.std_logic_1164.all;

use work.amd.am8304;

entity am8304_tb is
end entity;

architecture testbench of am8304_tb is
  signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic;
  signal b0, b1, b2, b3, b4, b5, b6, b7 : std_logic;
  signal chip_disable, transmit : std_logic;
  -- external devices on the A and B ports, 'Z' when not driving
  signal exta : std_logic_vector(7 downto 0) := (others => 'Z');
  signal extb : std_logic_vector(7 downto 0) := (others => 'Z');

  constant period : time := 100 ns;
begin

  uut : am8304
    port map (
      a0 => a0, a1 => a1, a2 => a2, a3 => a3,
      a4 => a4, a5 => a5, a6 => a6, a7 => a7,
      b0 => b0, b1 => b1, b2 => b2, b3 => b3,
      b4 => b4, b5 => b5, b6 => b6, b7 => b7,
      chip_disable => chip_disable,
      transmit => transmit
    );

  -- External devices (the only other drivers of the port pins)
  a0 <= exta(0); a1 <= exta(1); a2 <= exta(2); a3 <= exta(3);
  a4 <= exta(4); a5 <= exta(5); a6 <= exta(6); a7 <= exta(7);
  b0 <= extb(0); b1 <= extb(1); b2 <= extb(2); b3 <= extb(3);
  b4 <= extb(4); b5 <= extb(5); b6 <= extb(6); b7 <= extb(7);

  process
    -- port values as seen on the pins
    impure function a_port return std_logic_vector is
    begin
      return a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;
    end function;
    impure function b_port return std_logic_vector is
    begin
      return b7 & b6 & b5 & b4 & b3 & b2 & b1 & b0;
    end function;
  begin
    -- Test 1: chip disabled, both ports float (nobody else driving)
    chip_disable <= '1';
    transmit <= '0';
    exta <= (others => 'Z');
    extb <= (others => 'Z');
    wait for period;
    assert a_port = "ZZZZZZZZ"
      report "Test 1a failed: A port should float when disabled (T/R low)" severity error;
    assert b_port = "ZZZZZZZZ"
      report "Test 1b failed: B port should float when disabled (T/R low)" severity error;
    transmit <= '1';
    wait for period;
    assert a_port = "ZZZZZZZZ"
      report "Test 1c failed: A port should float when disabled (T/R high)" severity error;
    assert b_port = "ZZZZZZZZ"
      report "Test 1d failed: B port should float when disabled (T/R high)" severity error;

    -- Test 2: transmit mode (A to B), external device drives A
    chip_disable <= '0';
    transmit <= '1';
    exta <= "10101010";
    extb <= (others => 'Z');
    wait for period;
    assert b_port = "10101010"
      report "Test 2a failed: B should follow A in transmit mode" severity error;
    exta <= "01100110";
    wait for period;
    assert b_port = "01100110"
      report "Test 2b failed: B should follow A in transmit mode" severity error;

    -- Test 3: receive mode (B to A), external device drives B
    transmit <= '0';
    exta <= (others => 'Z');
    extb <= "01010101";
    wait for period;
    assert a_port = "01010101"
      report "Test 3a failed: A should follow B in receive mode" severity error;
    assert b_port = "01010101"
      report "Test 3b failed: B port must not be driven in receive mode" severity error;
    extb <= "11001100";
    wait for period;
    assert a_port = "11001100"
      report "Test 3c failed: A should follow B in receive mode" severity error;

    -- Test 4: disable while receiving, A floats although B is driven
    chip_disable <= '1';
    wait for period;
    assert a_port = "ZZZZZZZZ"
      report "Test 4 failed: A port should float when disabled" severity error;

    -- Test 5: 'Z' on the control inputs reads as high
    chip_disable <= 'Z';  -- disabled
    transmit <= '0';
    wait for period;
    assert a_port = "ZZZZZZZZ"
      report "Test 5a failed: 'Z' on chip disable must disable the chip" severity error;
    chip_disable <= '0';
    transmit <= 'Z';      -- transmit (A to B)
    exta <= "00110011";
    extb <= (others => 'Z');
    wait for period;
    assert b_port = "00110011"
      report "Test 5b failed: 'Z' on T/R must select transmit mode" severity error;
    assert a_port = "00110011"
      report "Test 5c failed: A port must not be driven in transmit mode" severity error;

    wait;
  end process;

end architecture;
