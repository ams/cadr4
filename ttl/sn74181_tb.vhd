library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sn74.all;

entity sn74181_tb is
end;

architecture testbench of sn74181_tb is

  -- Initialize signals to avoid metavalue assertions
  signal cin_n  : std_logic := '1';  -- Carry in (active low)
  signal s0     : std_logic := '0';
  signal s1     : std_logic := '0';
  signal s2     : std_logic := '0';
  signal s3     : std_logic := '0';
  signal m      : std_logic := '0';
  signal a0     : std_logic := '0';
  signal a1     : std_logic := '0';
  signal a2     : std_logic := '0';
  signal a3     : std_logic := '0';
  signal b0     : std_logic := '0';
  signal b1     : std_logic := '0';
  signal b2     : std_logic := '0';
  signal b3     : std_logic := '0';
  signal f0     : std_logic;
  signal f1     : std_logic;
  signal f2     : std_logic;
  signal f3     : std_logic;
  signal aeb    : std_logic;
  signal x      : std_logic;
  signal y      : std_logic;
  signal cout_n : std_logic;  -- Carry out (active low)

  -- Debug signals to access internal values
  signal debug_e_vec : std_logic_vector(3 downto 0);
  signal debug_d_vec : std_logic_vector(3 downto 0);
  signal debug_c_vec : std_logic_vector(3 downto 0);
  signal debug_y_int : std_logic;
  signal debug_x_cin_n : std_logic;

begin

  uut : entity work.sn74181(behavioral) port map(
    cout_n => cout_n,
    y      => y,
    x      => x,
    aeb    => aeb,
    f3     => f3,
    f2     => f2,
    f1     => f1,
    f0     => f0,
    b3     => b3,
    b2     => b2,
    b1     => b1,
    b0     => b0,
    a3     => a3,
    a2     => a2,
    a1     => a1,
    a0     => a0,
    m      => m,
    s3     => s3,
    s2     => s2,
    s1     => s1,
    s0     => s0,
    cin_n  => cin_n
  );

  -- Debug process to examine internal signals
  debug_process: process
  begin
    wait for 1 ns; -- Let signals settle
    -- Access internal signals (this won't work directly, but helps identify the issue)
    -- debug_e_vec <= uut.e_vec; -- This would require internal signal access
    wait;
  end process;

  process
    variable f_result : std_logic_vector(3 downto 0);
  begin
    
    -- Test Logic Mode (M = 1) - Table 2 Active High Data
    m <= '1';
    cin_n <= '1'; -- Don't care in logic mode
    
    -- Test data: A=1010 (10), B=0110 (6)
    a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0'; -- A=10
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '0'; -- B=6
    
    -- S=0000: F = NOT A
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0101" report "Logic S=0000 (NOT A) failed" severity error;
    
    -- S=0001: F = NOT(A+B)
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0001" report "Logic S=0001 (NOT(A+B)) failed" severity error;
    
    -- S=0010: F = (NOT A)B
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0100" report "Logic S=0010 ((NOT A)B) failed" severity error;
    
    -- S=0011: F = 0
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0000" report "Logic S=0011 (0) failed" severity error;
    
    -- S=0100: F = NOT(AB)
    s3 <= '0'; s2 <= '1'; s1 <= '0'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1101" report "Logic S=0100 (NOT(AB)) failed" severity error;
    
    -- S=0101: F = NOT B
    s3 <= '0'; s2 <= '1'; s1 <= '0'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1001" report "Logic S=0101 (NOT B) failed" severity error;
    
    -- S=0110: F = A XOR B
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1100" report "Logic S=0110 (A XOR B) failed" severity error;
    
    -- S=0111: F = A(NOT B)
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1000" report "Logic S=0111 (A(NOT B)) failed" severity error;
    
    -- S=1000: F = (NOT A)+B
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0111" report "Logic S=1000 ((NOT A)+B) failed" severity error;
    
    -- S=1001: F = NOT(A XOR B)
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0011" report "Logic S=1001 (NOT(A XOR B)) failed" severity error;
    
    -- S=1010: F = B
    s3 <= '1'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0110" report "Logic S=1010 (B) failed" severity error;
    
    -- S=1011: F = AB
    s3 <= '1'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0010" report "Logic S=1011 (AB) failed" severity error;
    
    -- S=1100: F = 1
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1111" report "Logic S=1100 (1) failed" severity error;
    
    -- S=1101: F = A+(NOT B)
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1011" report "Logic S=1101 (A+(NOT B)) failed" severity error;
    
    -- S=1110: F = A+B
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1110" report "Logic S=1110 (A+B) failed" severity error;
    
    -- S=1111: F = A
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '1';
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1010" report "Logic S=1111 (A) failed" severity error;
    
    -- Test SETZ function (S=0011) with X inputs to verify output is still 0
    m <= '1'; -- Logic mode
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '1'; -- S=0011: SETZ function
    
    -- Test with all X inputs
    a3 <= 'X'; a2 <= 'X'; a1 <= 'X'; a0 <= 'X'; -- A=XXXX
    b3 <= 'X'; b2 <= 'X'; b1 <= 'X'; b0 <= 'X'; -- B=XXXX
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0000" report "SETZ with A=XXXX, B=XXXX should output F=0000" severity error;
    
    -- Test with mixed X and valid inputs
    a3 <= 'X'; a2 <= '1'; a1 <= 'X'; a0 <= '0'; -- A=X1X0
    b3 <= '1'; b2 <= 'X'; b1 <= '0'; b0 <= 'X'; -- B=1X0X
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0000" report "SETZ with A=X1X0, B=1X0X should output F=0000" severity error;
    
    -- Test with some X inputs
    a3 <= 'X'; a2 <= 'X'; a1 <= '1'; a0 <= '1'; -- A=XX11
    b3 <= '0'; b2 <= '0'; b1 <= 'X'; b0 <= 'X'; -- B=00XX
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0000" report "SETZ with A=XX11, B=00XX should output F=0000" severity error;
    
    -- Test Arithmetic Mode (M = 0) - Table 2 Active High Data
    m <= '0';
    
    -- Test data: A=5 (0101), B=3 (0011)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    
    -- S=0000: F = A (Cn=0) / A+1 (Cn=1)
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0101" report "Arith S=0000 Cn=0 (A) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0110" report "Arith S=0000 Cn=1 (A+1) failed" severity error;
    
    -- S=0001: F = A+B (logical OR) (Cn=0) / (A+B)+1 (Cn=1)
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0111" report "Arith S=0001 Cn=0 (A+B logical OR) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1000" report "Arith S=0001 Cn=1 ((A+B)+1) failed" severity error;
    
    -- S=0010: F = A+(NOT B) (A OR NOT B) (Cn=0) / (A+(NOT B))+1 (Cn=1)
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1101" report "Arith S=0010 Cn=0 (A+(NOT B) logical OR) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1110" report "Arith S=0010 Cn=1 ((A+(NOT B))+1) failed" severity error;
    
    -- S=0110: F = A-B-1 (Cn=0) / A-B (Cn=1)
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0001" report "Arith S=0110 Cn=0 (A-B-1) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0010" report "Arith S=0110 Cn=1 (A-B) failed" severity error;
    
    -- S=1100: F = A+A (Cn=0) / A+A+1 (Cn=1) [shift left]
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '0';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1010" report "Arith S=1100 Cn=0 (A+A) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1011" report "Arith S=1100 Cn=1 (A+A+1) failed" severity error;
    
    -- S=1001: F = A PLUS B (arithmetic addition) (Cn=0) / (A PLUS B) PLUS 1 (Cn=1)
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1000" report "Arith S=1001 Cn=0 (A PLUS B) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "1001" report "Arith S=1001 Cn=1 (A PLUS B PLUS 1) failed" severity error;
    
    -- S=1111: F = A-1 (Cn=0) / A (Cn=1)
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '1';
    cin_n <= '1'; -- Cn=0
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0100" report "Arith S=1111 Cn=0 (A-1) failed" severity error;
    
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    assert f_result = "0101" report "Arith S=1111 Cn=1 (A) failed" severity error;
    
    -- Test A equals B according to datasheet specification
    m <= '0'; -- Arithmetic mode
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: subtract mode
    cin_n <= '1'; -- Cn=H (with carry) as required by datasheet
    
    -- Test case 1: A=B=5
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- In subtract mode with A=B, result should be A-B-1 = -1 = 1111 (2's complement)
    -- According to datasheet, AEB should be Z (open-collector high) when A=B in this mode

    assert aeb = 'Z' report "AEB should be Z (open-collector high) when A=B=5 in subtract mode" severity error;
    
    -- Test case 2: A=7, B=7
    a3 <= '0'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- A=7
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1'; -- B=7
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;

    assert aeb = 'Z' report "AEB should be Z (open-collector high) when A=B=7 in subtract mode" severity error;
    
    -- Test case 3: A≠B (A=5, B=3)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- In subtract mode with A≠B, result should be A-B-1 = 5-3-1 = 1

    assert aeb = '0' report "AEB should be 0 when A/=B in subtract mode" severity error;
    
    -- Test case 4: A≠B (A=8, B=3)
    a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- A=8
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- In subtract mode with A≠B, result should be A-B-1 = 8-3-1 = 4

    assert aeb = '0' report "AEB should be 0 when A/=B (8,3) in subtract mode" severity error;

    -- Test legacy AEB behavior (what the current implementation actually does)
    m <= '1'; -- Logic mode
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '0'; -- S=1100: F = 1 (all ones)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    -- When A=B in S=1100 mode, F should be 1111, so AEB should be Z (open-collector high)
    assert aeb = 'Z' report "Legacy AEB test: A equals B failed when A=B=5" severity error;
    
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    -- When A≠B in S=1100 mode, F should still be 1111, so AEB should still be Z
    -- This shows the current implementation doesn't actually detect A=B properly
    assert aeb = 'Z' report "Legacy AEB test: should be Z in S=1100 mode regardless of A,B" severity error;
    
    -- Test with S=0110 (A XOR B) where F=0000 when A=B
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: F = A XOR B
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5 (same as A)
    wait for 10 ns;
    -- A XOR B should be 0000 when A=B, but AEB logic expects F=1111
    -- So AEB should be 0 in this case
    assert aeb = '0' report "Legacy AEB test: A XOR B with A=B should give AEB=0" severity error;
    
    -- Test AEB with different values where A≠B
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    -- A XOR B should be non-zero when A≠B, so AEB should be 0
    assert aeb = '0' report "Legacy AEB test: A XOR B with A/=B should give AEB=0" severity error;
    
    -- Test carry propagate (X) and carry generate (Y)
    m <= '0'; -- Arithmetic mode
    a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- A=15
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '1'; -- B=1
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '1'; -- A+B
    cin_n <= '0'; -- Cn=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;

    -- This should generate carry out (Y=1) and overflow
    assert cout_n = '0' report "Carry out should be active (cout_n=0) for 15+1+1" severity error;
    
    -- Test X and Y outputs specifically for A=B comparison
    m <= '0'; -- Arithmetic mode
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: subtract mode (A-B-1)
    cin_n <= '1'; -- Cn=0 (no carry in)
    
    -- Test case 1: A=B=5 in subtract mode
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A-B-1 = 5-5-1 = -1 = 1111 in 2's complement

    assert f_result = "1111" report "F should be 1111 for A=B=5 in subtract mode" severity error;
    assert aeb = 'Z' report "AEB should be Z when F=1111" severity error;
    -- For subtract mode with A=B, we expect specific X and Y values for proper cascading
    -- X should be '0' (no propagate when all bits are equal in subtract)
    -- Y should be '1' (generate when result is all 1s)
    assert x = '0' report "X should be 0 for A=B=5 in subtract mode" severity error;
    assert y = '1' report "Y should be 1 for A=B=5 in subtract mode (generates carry)" severity error;
    
    -- Test case 2: A=B=7 in subtract mode  
    a3 <= '0'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- A=7
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1'; -- B=7
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;

    assert f_result = "1111" report "F should be 1111 for A=B=7 in subtract mode" severity error;
    assert aeb = 'Z' report "AEB should be Z when F=1111" severity error;
    assert x = '0' report "X should be 0 for A=B=7 in subtract mode" severity error;
    assert y = '1' report "Y should be 1 for A=B=7 in subtract mode (generates carry)" severity error;
    
    -- Test case 3: A>B in subtract mode
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A-B-1 = 5-3-1 = 1

    assert f_result = "0001" report "F should be 0001 for A=5, B=3 in subtract mode" severity error;
    assert aeb = '0' report "AEB should be 0 when A>B" severity error;
    
    -- Test case 4: A<B in subtract mode
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- A=3
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A-B-1 = 3-5-1 = -3 = 1101 in 2's complement

    assert f_result = "1101" report "F should be 1101 for A=3, B=5 in subtract mode" severity error;
    assert aeb = '0' report "AEB should be 0 when A<B" severity error;
    
    -- Test X and Y in addition mode for comparison
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '1'; -- S=1001: A+B
    cin_n <= '1'; -- Cn=0 (no carry in)
    
    -- Test case: A=5, B=3 in addition mode
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A+B = 5+3 = 8

    assert f_result = "1000" report "F should be 1000 for A=5, B=3 in addition mode" severity error;
    
    -- Test case: A=15, B=1 in addition mode (should overflow)
    a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- A=15
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '1'; -- B=1
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A+B = 15+1 = 16 = 0000 with carry out

    assert f_result = "0000" report "F should be 0000 for A=15, B=1 in addition mode (overflow)" severity error;
    assert cout_n = '0' report "Carry out should be active (cout_n=0) for 15+1 overflow" severity error;
    
    -- Test cascading behavior for A=B comparison
    m <= '0'; -- Arithmetic mode
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: subtract mode
    cin_n <= '1'; -- Cn=0 (no carry in to first stage)
    
    -- First stage: A=B=5
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;

    -- For A=B in subtract mode with Cn=H, result should be -1 (1111) and cout_n should be '1' (no borrow)
    -- According to datasheet: when Cn=H and A=B, Cn+4=H (meaning A≤B, which is true for A=B)
    assert f_result = "1111" report "Stage 1: F should be 1111 for A=B=5" severity error;
    assert cout_n = '1' report "Stage 1: cout_n should be 1 (no borrow) for A=B=5 with Cn=H" severity error;
    
    -- Simulate second stage with cin_n = cout_n from first stage (should be '1')
    cin_n <= '1'; -- This simulates connecting cout_n from stage 1 to cin_n of stage 2
    -- Second stage: A=B=7  
    a3 <= '0'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- A=7
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1'; -- B=7
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;

    -- With cin_n='1' (no carry in), A-B-1 = A-B-1 = -1 = 1111 for A=B
    -- According to datasheet: when Cn=H and A=B, Cn+4=H (no borrow)
    assert f_result = "1111" report "Stage 2: F should be 1111 for A=B=7 with Cn=H" severity error;
    assert cout_n = '1' report "Stage 2: cout_n should be 1 (no borrow) for A=B=7 with Cn=H" severity error;
    
    -- Manual calculation test for A=B=5 in subtract mode
    m <= '0'; -- Arithmetic mode
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: subtract mode
    cin_n <= '1'; -- Cn=0 (no carry in)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5 (0101)
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5 (0101)
    wait for 10 ns;
    
    -- According to Verilog reference, let's trace through:
    -- Emodule: 
    --   Bb = NOT B = NOT(0101) = 1010
    --   ABS3 = A AND B AND S3 = 0101 AND 0101 AND 0 = 0000 
    --   ABbS2 = A AND Bb AND S2 = 0101 AND 1010 AND 1 = 0000
    --   E = NOR(ABS3, ABbS2) = NOR(0000, 0000) = 1111
    --
    -- Dmodule:
    --   BbS1 = Bb AND S1 = 1010 AND 1 = 1010
    --   BS0 = B AND S0 = 0101 AND 0 = 0000  
    --   D = NOR(BbS1, BS0, A) = NOR(1010, 0000, 0101) = NOR(1111) = 0000
    --
    -- CLAmodule: E->Gb, D->Pb, CNb=1
    --   X = NAND(Gb) = NAND(1111) = 0
    --   For Y: all Pb terms are 0, so Y = NOR(0,0,0,0) = 1
    --   XCNb = NAND(Gb,CNb) = NAND(1111,1) = NAND(1) = 0  
    --   CN4b = NAND(Y,XCNb) = NAND(1,0) = 1
    --
    -- Expected: cout_n should be 1, but we're getting 1 in our test, so that's correct!
    -- Let me check what we're actually asserting...
    
    f_result := f3 & f2 & f1 & f0;

    
    -- Wait, let me recalculate. For A-B-1 where A=B=5:
    -- Result should be 5-5-1 = -1 = 1111 in 2's complement
    -- But what should cout_n be? Let's think about this...
    -- In 2's complement, -1 is represented as 1111
    -- When we compute 5-5-1 in 4-bit arithmetic:
    -- 5 - 5 - 1 = 0101 + 1010 + 0 = 1111 (with no carry out)
    -- So cout_n should indeed be '1' (inactive, no carry)
    
    assert f_result = "1111" report "F should be 1111 for A=B=5 subtract" severity error;
    -- The cout_n='1' is actually CORRECT! The issue is in my understanding.
    -- For A=B in subtract mode, there should be NO carry out, so cout_n='1' is right.
    
    -- Let me test a case that SHOULD generate carry out
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- A=3
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5  
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- A-B-1 = 3-5-1 = -3 = 1101 in 2's complement
    -- This should involve borrowing, so there might be a carry out

    
    -- Actually, let me check what the datasheet says about carry out for subtraction...
    -- In subtraction A-B-1, cout_n is the borrow output
    -- cout_n='0' means borrow occurred, cout_n='1' means no borrow
    -- For A=B: no borrow needed, so cout_n='1' is correct
    -- For A<B: borrow needed, so cout_n='0' should occur
    

    
    -- Test A=B cascading with SN74182 behavior
    m <= '0'; -- Arithmetic mode
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0'; -- S=0110: subtract mode
    
    -- Test what happens with cin_n='0' (carry in from SN74182)
    cin_n <= '0'; -- Cin=1 (carry in from previous stage via SN74182)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    wait for 10 ns;
    f_result := f3 & f2 & f1 & f0;
    -- With carry in, A-B-1+1 = A-B = 0 when A=B

    -- For A=B with carry in, result should be 0000 and AEB should be '0' (since F≠1111)
    assert f_result = "0000" report "F should be 0000 for A=B=5 with carry in" severity error;
    assert aeb = '0' report "AEB should be 0 when F=0000 (not all 1s)" severity error;
    
    -- Test what this means for overall A=B detection across multiple stages
    -- If first stage has A=B and produces cin_n='1' (no carry)
    -- But subsequent stages get cin_n='0' (carry from SN74182)
    -- Then only the first stage will show AEB='Z', others will show AEB='0'
    -- This breaks the wire-AND connection for multi-stage A=B detection!
    

    
    -- Test manual calculation test for A=B=5 in subtract mode"
    
    wait;
  end process;

end;


