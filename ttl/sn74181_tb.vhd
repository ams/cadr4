library IEEE;
use IEEE.std_logic_1164.all;

entity sn74181_tb is
end sn74181_tb;

architecture behaviour of sn74181_tb is
  signal S, A, B, F : std_logic_vector (3 downto 0);
  signal M, nC_in, nC_out, A_EQ_B, X, Y : std_logic;
begin
  dut: entity work.sn74181(rtl) port map (S0 => S(0), S1 => S(1), S2 => S(2), S3 => S(3),
                                          A0 => A(0), A1 => A(1), A2 => A(2), A3 => A(3),
                                          B0 => B(0), B1 => B(1), B2 => B(2), B3 => B(3),
                                          F0 => F(0), F1 => F(1), F2 => F(2), F3 => F(3),
                                          M => M, X => X, Y => Y, A_EQ_B => A_EQ_B, nC_in => nC_in, nC_out => nC_out
                                          );
  process begin
    nC_in <= '1';
    M <= '0'; -- 0 arithmetic, 1 logic
    S <= "1001"; -- 0001 -> A + B, 1001 -> A PLUS B
    A <= "0001";
    B <= "0001";
    wait for 5 ns;
    assert F = "0010" and nC_out = '1' report "Incorrect: 0001 plus 0001" severity error;

    S <= "0110"; -- 0110 -> A MINUS B MINUS 1
    wait for 5 ns;
    assert A_EQ_B = '1' report "Incorrect: 0001 = 0001" severity error;

    S <= "1001";
    A <= "1111";
    B <= "0001";
    wait for 5 ns;
    assert F = "0000" and nC_out = '0' report "Incorrect: 1111 plus 0001" severity error;

    M <= '1';
    S <= "0110"; -- xor
    A <= "0011";
    B <= "1110";
    wait for 5 ns;
    assert F = "1101" report "Incorrect: 0011 xor 1110" severity error;

    M <= '0'; -- arithmetic
    S <= "1001"; -- PLUS
    A <= "0000";
    B <= "0000";
    nC_in <= '0';
    wait for 5 ns;
    assert F = "0001" report "Incorrect: 0 + 0 + C" severity error;
    wait;
  end process;
end behaviour;
