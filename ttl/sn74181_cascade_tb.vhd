-- Testbench for 32-bit cascaded ALU using 8 sn74181 and 3 sn74182 components
-- This mimics the exact configuration used in CADR ALU0, ALU1, and ALUC4

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sn74.all;

entity sn74181_cascade_tb is
end entity;

architecture testbench of sn74181_cascade_tb is
  -- Input signals for the 32-bit ALU
  signal a_input : std_logic_vector(31 downto 0);
  signal b_input : std_logic_vector(31 downto 0);
  signal cin_n : std_logic;  -- Carry in (active low)
  signal mode : std_logic;   -- 0=arithmetic, 1=logic
  signal func : std_logic_vector(3 downto 0);  -- Function select
  
  -- Output signals
  signal f_output : std_logic_vector(31 downto 0);
  signal cout_n : std_logic;  -- Carry out (active low)
  signal aeb : std_logic;     -- A equals B
  
  -- Internal carry signals (active low)
  signal cout0_n, cout4_n, cout8_n, cout12_n : std_logic;
  signal cout16_n, cout20_n, cout24_n, cout28_n : std_logic;
  
  -- Internal X and Y signals for carry lookahead
  signal x0, y0, x4, y4, x8, y8, x12, y12 : std_logic;
  signal x16, y16, x20, y20, x24, y24, x28, y28 : std_logic;
  
  -- Group X and Y signals from 74182 chips
  signal x_group0, y_group0 : std_logic;  -- For bits 0-15
  signal x_group1, y_group1 : std_logic;  -- For bits 16-31
  
  -- Expected result for verification
  signal expected_result : std_logic_vector(32 downto 0);  -- 33 bits to include carry
  
begin

  -- ALU0 section: 4 × 74S181 chips (bits 0-15)
  -- Stage 0: Bits 0-3
  alu0_stage0 : sn74181
    port map (
      m => mode,
      cin_n => cin_n,
      cout_n => cout0_n,
      aeb => open,
      x => x0,
      y => y0,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(3), a2 => a_input(2), a1 => a_input(1), a0 => a_input(0),
      b3 => b_input(3), b2 => b_input(2), b1 => b_input(1), b0 => b_input(0),
      f3 => f_output(3), f2 => f_output(2), f1 => f_output(1), f0 => f_output(0)
    );
    
  -- Stage 1: Bits 4-7
  alu0_stage1 : sn74181
    port map (
      m => mode,
      cin_n => cout0_n,
      cout_n => cout4_n,
      aeb => open,
      x => x4,
      y => y4,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(7), a2 => a_input(6), a1 => a_input(5), a0 => a_input(4),
      b3 => b_input(7), b2 => b_input(6), b1 => b_input(5), b0 => b_input(4),
      f3 => f_output(7), f2 => f_output(6), f1 => f_output(5), f0 => f_output(4)
    );
    
  -- Stage 2: Bits 8-11
  alu0_stage2 : sn74181
    port map (
      m => mode,
      cin_n => cout4_n,
      cout_n => cout8_n,
      aeb => open,
      x => x8,
      y => y8,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(11), a2 => a_input(10), a1 => a_input(9), a0 => a_input(8),
      b3 => b_input(11), b2 => b_input(10), b1 => b_input(9), b0 => b_input(8),
      f3 => f_output(11), f2 => f_output(10), f1 => f_output(9), f0 => f_output(8)
    );
    
  -- Stage 3: Bits 12-15
  alu0_stage3 : sn74181
    port map (
      m => mode,
      cin_n => cout8_n,
      cout_n => cout12_n,
      aeb => open,
      x => x12,
      y => y12,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(15), a2 => a_input(14), a1 => a_input(13), a0 => a_input(12),
      b3 => b_input(15), b2 => b_input(14), b1 => b_input(13), b0 => b_input(12),
      f3 => f_output(15), f2 => f_output(14), f1 => f_output(13), f0 => f_output(12)
    );
    
  -- ALU1 section: 4 × 74S181 chips (bits 16-31)
  -- Stage 4: Bits 16-19
  alu1_stage0 : sn74181
    port map (
      m => mode,
      cin_n => cout12_n,
      cout_n => cout16_n,
      aeb => open,
      x => x16,
      y => y16,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(19), a2 => a_input(18), a1 => a_input(17), a0 => a_input(16),
      b3 => b_input(19), b2 => b_input(18), b1 => b_input(17), b0 => b_input(16),
      f3 => f_output(19), f2 => f_output(18), f1 => f_output(17), f0 => f_output(16)
    );
    
  -- Stage 5: Bits 20-23
  alu1_stage1 : sn74181
    port map (
      m => mode,
      cin_n => cout16_n,
      cout_n => cout20_n,
      aeb => open,
      x => x20,
      y => y20,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(23), a2 => a_input(22), a1 => a_input(21), a0 => a_input(20),
      b3 => b_input(23), b2 => b_input(22), b1 => b_input(21), b0 => b_input(20),
      f3 => f_output(23), f2 => f_output(22), f1 => f_output(21), f0 => f_output(20)
    );
    
  -- Stage 6: Bits 24-27
  alu1_stage2 : sn74181
    port map (
      m => mode,
      cin_n => cout20_n,
      cout_n => cout24_n,
      aeb => open,
      x => x24,
      y => y24,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(27), a2 => a_input(26), a1 => a_input(25), a0 => a_input(24),
      b3 => b_input(27), b2 => b_input(26), b1 => b_input(25), b0 => b_input(24),
      f3 => f_output(27), f2 => f_output(26), f1 => f_output(25), f0 => f_output(24)
    );
    
  -- Stage 7: Bits 28-31
  alu1_stage3 : sn74181
    port map (
      m => mode,
      cin_n => cout24_n,
      cout_n => cout28_n,
      aeb => open,
      x => x28,
      y => y28,
      s3 => func(3), s2 => func(2), s1 => func(1), s0 => func(0),
      a3 => a_input(31), a2 => a_input(30), a1 => a_input(29), a0 => a_input(28),
      b3 => b_input(31), b2 => b_input(30), b1 => b_input(29), b0 => b_input(28),
      f3 => f_output(31), f2 => f_output(30), f1 => f_output(29), f0 => f_output(28)
    );
    
  -- ALUC4 section: 3 × 74S182 carry lookahead generators
  -- 74S182 #1: Handles carry for bits 0-15 (ALU0)
  aluc4_cla0 : sn74182
    port map (
      xout => x_group0,
      yout => y_group0,
      cout2_n => cout8_n,   -- Carry to bit 8
      cout1_n => cout4_n,   -- Carry to bit 4  
      cout0_n => cout0_n,   -- Carry to bit 0
      x3 => x12, y3 => y12,  -- From stage 3 (bits 12-15)
      x2 => x8,  y2 => y8,   -- From stage 2 (bits 8-11)
      x1 => x4,  y1 => y4,   -- From stage 1 (bits 4-7)
      x0 => x0,  y0 => y0,   -- From stage 0 (bits 0-3)
      cin_n => cin_n
    );
    
  -- 74S182 #2: Handles carry for bits 16-31 (ALU1)
  aluc4_cla1 : sn74182
    port map (
      xout => x_group1,
      yout => y_group1,
      cout2_n => cout24_n,  -- Carry to bit 24
      cout1_n => cout20_n,  -- Carry to bit 20
      cout0_n => cout16_n,  -- Carry to bit 16
      x3 => x28, y3 => y28,  -- From stage 7 (bits 28-31)
      x2 => x24, y2 => y24,  -- From stage 6 (bits 24-27)
      x1 => x20, y1 => y20,  -- From stage 5 (bits 20-23)
      x0 => x16, y0 => y16,  -- From stage 4 (bits 16-19)
      cin_n => cout12_n
    );
    
  -- 74S182 #3: Master carry lookahead for overall 32-bit result
  aluc4_cla_master : sn74182
    port map (
      xout => open,
      yout => open,
      cout2_n => open,
      cout1_n => cout12_n,  -- Carry from ALU0 to ALU1
      cout0_n => open,
      x3 => '0', y3 => '0',  -- Unused
      x2 => '0', y2 => '0',  -- Unused
      x1 => x_group1, y1 => y_group1,  -- Group signals from ALU1
      x0 => x_group0, y0 => y_group0,  -- Group signals from ALU0
      cin_n => cin_n
    );
    
  -- Final carry out is from the last stage
  cout_n <= cout28_n;
  
  -- A equals B is true when all bits are equal (simplified)
  aeb <= '1' when f_output = x"00000000" and mode = '0' and func = "0110" else '0';
  
  -- Calculate expected result for verification
  process(a_input, b_input, cin_n, mode, func)
    variable a_val, b_val : unsigned(31 downto 0);
    variable cin_val : std_logic;
    variable result_33 : unsigned(32 downto 0);
  begin
    a_val := unsigned(a_input);
    b_val := unsigned(b_input);
    cin_val := not cin_n;  -- Convert active low to active high
    
    if mode = '1' then
      -- Logic mode
      case func is
        when "0000" => expected_result <= '0' & std_logic_vector(not a_val);
        when "0001" => expected_result <= '0' & std_logic_vector(not (a_val or b_val));
        when "0010" => expected_result <= '0' & std_logic_vector((not a_val) and b_val);
        when "0011" => expected_result <= (others => '0');  -- SETZ
        when "0100" => expected_result <= '0' & std_logic_vector(not (a_val and b_val));
        when "0101" => expected_result <= '0' & std_logic_vector(not b_val);
        when "0110" => expected_result <= '0' & std_logic_vector(a_val xor b_val);
        when "0111" => expected_result <= '0' & std_logic_vector(a_val and (not b_val));
        when "1000" => expected_result <= '0' & std_logic_vector((not a_val) or b_val);
        when "1001" => expected_result <= '0' & std_logic_vector(not (a_val xor b_val));
        when "1010" => expected_result <= '0' & std_logic_vector(b_val);
        when "1011" => expected_result <= '0' & std_logic_vector(a_val and b_val);
        when "1100" => expected_result <= (others => '1');  -- SETO
        when "1101" => expected_result <= '0' & std_logic_vector(a_val or (not b_val));
        when "1110" => expected_result <= '0' & std_logic_vector(a_val or b_val);
        when "1111" => expected_result <= '0' & std_logic_vector(a_val);
        when others => expected_result <= (others => 'X');
      end case;
    else
      -- Arithmetic mode (simplified - only implementing common operations)
      case func is
        when "0000" => -- A or A+1
          if cin_val = '0' then
            result_33 := resize(a_val, 33);
          else
            result_33 := resize(a_val, 33) + 1;
          end if;
        when "0110" => -- A-B-1 or A-B  
          if cin_val = '0' then
            result_33 := resize(a_val, 33) - resize(b_val, 33) - 1;
          else
            result_33 := resize(a_val, 33) - resize(b_val, 33);
          end if;
        when "1001" => -- A+B or A+B+1
          if cin_val = '0' then
            result_33 := resize(a_val, 33) + resize(b_val, 33);
          else
            result_33 := resize(a_val, 33) + resize(b_val, 33) + 1;
          end if;
        when others => 
          result_33 := (others => 'X');
      end case;
      expected_result <= std_logic_vector(result_33);
    end if;
  end process;
  
  -- Test process
  test_proc : process
    variable actual_result : std_logic_vector(32 downto 0);
    variable test_name : string(1 to 19);
  begin
    report "Starting 32-bit ALU cascade testbench";
    wait for 1 ns;
    
    -- Test 1: Logic mode - XOR operation
    test_name := "Logic XOR          ";
    mode <= '1';
    func <= "0110";  -- XOR
    cin_n <= '1';    -- No carry in logic mode
    a_input <= x"AAAAAAAA";
    b_input <= x"55555555";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    -- Test 2: Logic mode - SETZ (should output 0)
    test_name := "Logic SETZ         ";
    mode <= '1';
    func <= "0011";  -- SETZ
    cin_n <= '1';
    a_input <= x"FFFFFFFF";
    b_input <= x"12345678";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    -- Test 3: Arithmetic mode - Addition
    test_name := "Arithmetic ADD     ";
    mode <= '0';
    func <= "1001";  -- A+B
    cin_n <= '1';    -- No carry in
    a_input <= x"12345678";
    b_input <= x"87654321";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    -- Test 4: Arithmetic mode - Subtraction
    test_name := "Arithmetic SUB     ";
    mode <= '0';
    func <= "0110";  -- A-B
    cin_n <= '0';    -- Carry in for subtraction
    a_input <= x"FFFFFFFF";
    b_input <= x"00000001";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    -- Test 5: Maximum values addition (overflow test)
    test_name := "Arithmetic OVERFLOW";
    mode <= '0';
    func <= "1001";  -- A+B
    cin_n <= '1';    -- No carry in
    a_input <= x"FFFFFFFF";
    b_input <= x"00000001";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    -- Test 6: Identity operation (A)
    test_name := "Arithmetic A       ";
    mode <= '0';
    func <= "0000";  -- A
    cin_n <= '1';    -- No carry in
    a_input <= x"DEADBEEF";
    b_input <= x"00000000";
    wait for 10 ns;
    
    actual_result := (not cout_n) & f_output;
    if actual_result /= expected_result then
      report "ERROR in " & test_name & ": Result mismatch"
             severity error;
    else
      report "PASS: " & test_name;
    end if;
    
    report "32-bit ALU cascade testbench completed";
    wait;
  end process;

end architecture; 