library IEEE;
use IEEE.std_logic_1164.all;

entity cadr_alu_tb is
end cadr_alu_tb;

architecture behaviour of cadr_alu_tb is
  signal A: std_logic_vector (31 downto 0);
  signal M: std_logic_vector (31 downto 0);
  signal nCIN0: std_logic;

  signal ALUMODE: std_logic;
  signal F: std_logic_vector (3 downto 0);

  signal ALU: std_logic_vector (32 downto 0);
begin
  dut: entity work.cadr_alu(rtl) port map (A => A, M => M, nCIN0 => nCIN0, ALUMODE => ALUMODE, F => F, ALU => ALU
                                           );
  process begin
    -- A <= "11111111111111111111111111111111";
    -- M <= "00000000000000000000000000000001";
    M <= "00000000000000000111111111111111";
    A <= "00000000000000000000000000000001";
    ALUMODE <= '0'; -- arithmetic
    F <= "0000"; -- F = A
    nCIN0 <= '1';
    wait for 5 ns;
    assert ALU = "000000000000000000111111111111111" report "Error: passthrough A 00..11.." severity error;

    M <= "10101010101010101010101010101010";
    wait for 5 ns;
    assert ALU = "110101010101010101010101010101010" report "Error: passthrough A 1010.." severity error;

    F <= "1001"; -- F = A PLUS B
    M <= "10101010101010101010101010101010";
    A <= "01010101010101010101010101010101";
    wait for 5 ns;
    assert ALU = "111111111111111111111111111111111" report "Error: add 10.. to 01.." severity error;

    M <= "00000000000000001111111111111111";
    A <= "00000000000000000000000000000001";

    wait for 5 ns;
    assert ALU = "000000000000000010000000000000000" report "Error: add #xffff to 1" severity error;

    M <= "11111111111111111111111111111111";
    A <= "11111111111111111111111111111111";

    wait for 5 ns;
    assert ALU = "111111111111111111111111111111110" report "Error: add #xffffffff to itself" severity error;
    wait;
  end process;
end behaviour;
