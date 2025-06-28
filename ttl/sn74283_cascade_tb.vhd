-- Testbench for 14-bit cascaded adder using 4 sn74283 components
-- This mimics the exact configuration used in cadr_npc

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sn74.all;

entity sn74283_cascade_tb is
end entity;

architecture testbench of sn74283_cascade_tb is
  -- Input signals for the 14-bit adder
  signal a_input : std_logic_vector(13 downto 0);
  signal b_input : std_logic_vector(13 downto 0);
  signal cin : std_logic;
  
  -- Output signals
  signal sum_output : std_logic_vector(13 downto 0);
  signal cout : std_logic;
  
  -- Internal carry signals between stages
  signal carry3, carry7, carry11 : std_logic;
  
  -- Expected result for verification
  signal expected_result : std_logic_vector(14 downto 0);
  
  -- Test control
  signal test_done : boolean := false;

begin

  -- Stage 1: Bits 0-3 (LSB stage)
  adder_stage1 : sn74283
    port map (
      ci => cin,
      a0 => a_input(0),
      a1 => a_input(1),
      a2 => a_input(2),
      a3 => a_input(3),
      b0 => b_input(0),
      b1 => b_input(1),
      b2 => b_input(2),
      b3 => b_input(3),
      s0 => sum_output(0),
      s1 => sum_output(1),
      s2 => sum_output(2),
      s3 => sum_output(3),
      co => carry3
    );

  -- Stage 2: Bits 4-7
  adder_stage2 : sn74283
    port map (
      ci => carry3,
      a0 => a_input(4),
      a1 => a_input(5),
      a2 => a_input(6),
      a3 => a_input(7),
      b0 => b_input(4),
      b1 => b_input(5),
      b2 => b_input(6),
      b3 => b_input(7),
      s0 => sum_output(4),
      s1 => sum_output(5),
      s2 => sum_output(6),
      s3 => sum_output(7),
      co => carry7
    );

  -- Stage 3: Bits 8-11
  adder_stage3 : sn74283
    port map (
      ci => carry7,
      a0 => a_input(8),
      a1 => a_input(9),
      a2 => a_input(10),
      a3 => a_input(11),
      b0 => b_input(8),
      b1 => b_input(9),
      b2 => b_input(10),
      b3 => b_input(11),
      s0 => sum_output(8),
      s1 => sum_output(9),
      s2 => sum_output(10),
      s3 => sum_output(11),
      co => carry11
    );

  -- Stage 4: Bits 12-13 (MSB stage, only 2 bits used)
  adder_stage4 : sn74283
    port map (
      ci => carry11,
      a0 => a_input(12),
      a1 => a_input(13),
      a2 => '0',  -- Unused bit (tied to ground)
      a3 => '0',  -- Unused bit (tied to ground)
      b0 => b_input(12),
      b1 => b_input(13),
      b2 => '0',  -- Unused bit (tied to ground)
      b3 => '0',  -- Unused bit (tied to ground)
      s0 => sum_output(12),
      s1 => sum_output(13),
      s2 => open, -- Unused output
      s3 => open, -- Unused output
      co => cout
    );

  -- Calculate expected result (15-bit to include carry out)
  expected_result <= std_logic_vector(unsigned('0' & a_input) + unsigned('0' & b_input) + ("00000000000000" & cin));

  -- Test process
  test_proc : process
    variable test_count : integer := 0;
    variable errors : integer := 0;
    
    procedure test_addition(a_val : integer; b_val : integer; c_val : std_logic; test_name : string) is
      variable actual_result : std_logic_vector(14 downto 0);
    begin
      test_count := test_count + 1;
      
      -- Apply inputs
      a_input <= std_logic_vector(to_unsigned(a_val, 14));
      b_input <= std_logic_vector(to_unsigned(b_val, 14));
      cin <= c_val;
      
      -- Wait for propagation
      wait for 10 ns;
      
      -- Check result (sum_output is 14-bit, cout is the 15th bit)
      actual_result := cout & sum_output;
      
      if actual_result /= expected_result then
        report "ERROR in " & test_name & ": " &
               "A=" & integer'image(a_val) & 
               ", B=" & integer'image(b_val) & 
               ", Cin=" & std_logic'image(c_val) &
               " -> Expected: " & integer'image(to_integer(unsigned(expected_result))) &
               ", Got: " & integer'image(to_integer(unsigned(actual_result))) &
               " (cout=" & std_logic'image(cout) & ", sum=" & integer'image(to_integer(unsigned(sum_output))) & ")"
               severity error;
        errors := errors + 1;
      else
        report "PASS " & test_name & ": " &
               "A=" & integer'image(a_val) & 
               ", B=" & integer'image(b_val) & 
               ", Cin=" & std_logic'image(c_val) &
               " -> Result: " & integer'image(to_integer(unsigned(actual_result)))
               severity note;
      end if;
    end procedure;

  begin
    report "Starting 14-bit cascaded adder testbench..." severity note;
    
    -- Test 1: Simple addition without carry
    test_addition(1234, 5678, '0', "Simple addition");
    
    -- Test 2: Addition with carry in
    test_addition(1234, 5678, '1', "Addition with carry in");
    
    -- Test 3: Maximum values
    test_addition(16383, 16383, '0', "Maximum values (14-bit)");
    test_addition(16383, 16383, '1', "Maximum values with carry");
    
    -- Test 4: Zero addition
    test_addition(0, 0, '0', "Zero addition");
    test_addition(0, 0, '1', "Zero addition with carry");
    
    -- Test 5: One operand zero
    test_addition(12345, 0, '0', "One operand zero");
    test_addition(0, 9876, '1', "Other operand zero with carry");
    
    -- Test 6: Powers of 2 (test carry propagation)
    test_addition(255, 1, '0', "8-bit boundary carry");
    test_addition(4095, 1, '0', "12-bit boundary carry");
    test_addition(8191, 1, '0', "13-bit boundary carry");
    
    -- Test 7: Alternating bit patterns
    test_addition(10922, 5461, '0', "Alternating patterns"); -- 0x2AAA + 0x1555
    
    -- Test 8: All 1s in different bit ranges
    test_addition(15, 240, '0', "Low nibble + high nibble");
    test_addition(255, 3840, '0', "Low byte + high nibble");
    test_addition(4095, 12288, '0', "Low 12-bit + high 2-bit");
    
    -- Test 9: Specific values that test MSB functionality
    test_addition(8192, 4096, '0', "MSB bit 13 + bit 12");
    test_addition(12288, 3072, '1', "MSB bits with carry");
    
    -- Test 10: Random-like patterns
    test_addition(6789, 1357, '0', "Random pattern 1");
    test_addition(2468, 13579, '1', "Random pattern 2");
    
    -- Summary
    wait for 10 ns;
    if errors = 0 then
      report "SUCCESS: All " & integer'image(test_count) & " tests passed!" severity note;
    else
      report "FAILURE: " & integer'image(errors) & " out of " & integer'image(test_count) & " tests failed!" severity error;
    end if;
    
    test_done <= true;
    wait;
  end process;

end architecture; 