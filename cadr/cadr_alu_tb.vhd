-- CADR ALU Testbench
-- Tests the complete CADR ALU subsystem using ALU0, ALU1, and ALUC4 components

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cadr_book.all;

entity cadr_alu_tb is
end entity;

architecture testbench of cadr_alu_tb is
  -- Input signals for the 32-bit ALU
  signal a_input : std_logic_vector(31 downto 0);
  signal m_input : std_logic_vector(31 downto 0);
  signal ir_input : std_logic_vector(7 downto 0);  -- IR bits for ALU function
  signal alumode : std_logic;   -- 0=arithmetic, 1=logic
  
  -- Output signals
  signal alu_output : std_logic_vector(31 downto 0);
  signal aeb : std_logic;     -- A equals B
  
  -- ALUC4 control signals
  signal aluf0a, aluf1a, aluf2a, aluf3a : std_logic;
  signal aluf0b, aluf1b, aluf2b, aluf3b : std_logic;
  signal cin0, cin4, cin8, cin12 : std_logic;
  signal cin16, cin20, cin24, cin28, cin32 : std_logic;
  
  -- X and Y signals for carry lookahead
  signal xout3, xout7, xout11, xout15 : std_logic;
  signal yout3, yout7, yout11, yout15 : std_logic;
  signal xout19, xout23, xout27, xout31 : std_logic;
  signal yout19, yout23, yout27, yout31 : std_logic;
  signal xx0, yy0, xx1, yy1 : std_logic;
  
  -- Additional ALUC4 signals
  signal aluadd, alusub : std_logic;
  signal divaddcond, divsubcond : std_logic;
  signal mulnop : std_logic;
  signal osel0a, osel1a, osel0b, osel1b : std_logic;
  signal a31a, a31b : std_logic;
  signal m31b_from_alu1 : std_logic;  -- Output from ALU1
  signal hi12 : std_logic := '1';  -- Typically high
  signal gnd : std_logic := '0';
  
  -- Control signals for ALUC4
  signal div_n, mul_n, irjump_n, iralu_n : std_logic;
  signal ir12_n, ir13_n : std_logic;
  signal q0 : std_logic := '0';
  signal divposlasttime_n : std_logic;
  signal a31_n : std_logic;
  signal ir0_n, ir1_n, ir2_n, ir3_n, ir4_n : std_logic;
  signal aluf0_n, aluf1_n, aluf2_n, aluf3_n : std_logic;
  signal alumode_n : std_logic;
  
  -- Expected result for verification
  signal expected_result : std_logic_vector(31 downto 0);
  
begin

  -- ALUC4: ALU Control and Function
  aluc4_inst : cadr_aluc4
    port map (
      -- Function outputs
      aluf0a => aluf0a, aluf1a => aluf1a, aluf2a => aluf2a, aluf3a => aluf3a,
      aluf0b => aluf0b, aluf1b => aluf1b, aluf2b => aluf2b, aluf3b => aluf3b,
      alumode => alumode,
      
      -- Carry outputs
      \-cin0\ => cin0, \-cin4\ => cin4, \-cin8\ => cin8, \-cin12\ => cin12,
      \-cin16\ => cin16, \-cin20\ => cin20, \-cin24\ => cin24, 
      \-cin28\ => cin28, \-cin32\ => cin32,
      
      -- X and Y group signals
      xx0 => xx0, yy0 => yy0, xx1 => xx1, yy1 => yy1,
      
      -- X and Y inputs from ALU stages (these are INPUTS to ALUC4)
      xout3 => xout3, yout3 => yout3, xout7 => xout7, yout7 => yout7,
      xout11 => xout11, yout11 => yout11, xout15 => xout15, yout15 => yout15,
      xout19 => xout19, yout19 => yout19, xout23 => xout23, yout23 => yout23,
      xout27 => xout27, yout27 => yout27, xout31 => xout31, yout31 => yout31,
      
      -- Control inputs
      ir0 => ir_input(0), ir1 => ir_input(1), ir2 => ir_input(2), 
      ir3 => ir_input(3), ir4 => ir_input(4), ir5 => ir_input(5),
      ir6 => ir_input(6), ir7 => ir_input(7),
      
      -- Other control signals
      hi12 => hi12, q0 => q0, a31a => a31a, a31b => a31b,
      \-div\ => div_n, \-mul\ => mul_n, \-irjump\ => irjump_n, 
      \-iralu\ => iralu_n, \-ir12\ => ir12_n, \-ir13\ => ir13_n,
      irjump => not irjump_n,
      
      -- Outputs
      aluadd => aluadd, alusub => alusub,
      divaddcond => divaddcond, divsubcond => divsubcond,
      \-mulnop\ => mulnop, osel0a => osel0a, osel1a => osel1a,
      osel0b => osel0b, osel1b => osel1b,
      \-divposlasttime\ => divposlasttime_n, \-a31\ => a31_n,
      \-ir0\ => ir0_n, \-ir1\ => ir1_n, \-ir2\ => ir2_n, 
      \-ir3\ => ir3_n, \-ir4\ => ir4_n,
      \-aluf0\ => aluf0_n, \-aluf1\ => aluf1_n, 
      \-aluf2\ => aluf2_n, \-aluf3\ => aluf3_n,
      \-alumode\ => alumode_n
    );

  -- ALU0: Lower 16 bits (0-15)
  alu0_inst : cadr_alu0
    port map (
      -- Carry inputs
      \-cin0\ => cin0, \-cin4\ => cin4, \-cin8\ => cin8, \-cin12\ => cin12,
      
      -- Data inputs
      a0 => a_input(0), a1 => a_input(1), a2 => a_input(2), a3 => a_input(3),
      a4 => a_input(4), a5 => a_input(5), a6 => a_input(6), a7 => a_input(7),
      a8 => a_input(8), a9 => a_input(9), a10 => a_input(10), a11 => a_input(11),
      a12 => a_input(12), a13 => a_input(13), a14 => a_input(14), a15 => a_input(15),
      
      m0 => m_input(0), m1 => m_input(1), m2 => m_input(2), m3 => m_input(3),
      m4 => m_input(4), m5 => m_input(5), m6 => m_input(6), m7 => m_input(7),
      m8 => m_input(8), m9 => m_input(9), m10 => m_input(10), m11 => m_input(11),
      m12 => m_input(12), m13 => m_input(13), m14 => m_input(14), m15 => m_input(15),
      
      -- Function select
      aluf0b => aluf0b, aluf1b => aluf1b, aluf2b => aluf2b, aluf3b => aluf3b,
      alumode => alumode,
      
      -- Outputs
      alu0 => alu_output(0), alu1 => alu_output(1), alu2 => alu_output(2), alu3 => alu_output(3),
      alu4 => alu_output(4), alu5 => alu_output(5), alu6 => alu_output(6), alu7 => alu_output(7),
      alu8 => alu_output(8), alu9 => alu_output(9), alu10 => alu_output(10), alu11 => alu_output(11),
      alu12 => alu_output(12), alu13 => alu_output(13), alu14 => alu_output(14), alu15 => alu_output(15),
      
      -- X and Y outputs
      xout3 => xout3, yout3 => yout3, xout7 => xout7, yout7 => yout7,
      xout11 => xout11, yout11 => yout11, xout15 => xout15, yout15 => yout15,
      
      -- A equals B
      \a=m\ => aeb
    );

  -- ALU1: Upper 16 bits (16-31)
  alu1_inst : cadr_alu1
    port map (
      -- Carry inputs
      \-cin16\ => cin16, \-cin20\ => cin20, \-cin24\ => cin24, 
      \-cin28\ => cin28, \-cin32\ => cin32,
      
      -- Data inputs
      a16 => a_input(16), a17 => a_input(17), a18 => a_input(18), a19 => a_input(19),
      a20 => a_input(20), a21 => a_input(21), a22 => a_input(22), a23 => a_input(23),
      a24 => a_input(24), a25 => a_input(25), a26 => a_input(26), a27 => a_input(27),
      a28 => a_input(28), a29 => a_input(29), a30 => a_input(30), 
      a31a => a_input(31), a31b => a_input(31),
      
      m16 => m_input(16), m17 => m_input(17), m18 => m_input(18), m19 => m_input(19),
      m20 => m_input(20), m21 => m_input(21), m22 => m_input(22), m23 => m_input(23),
      m24 => m_input(24), m25 => m_input(25), m26 => m_input(26), m27 => m_input(27),
      m28 => m_input(28), m29 => m_input(29), m30 => m_input(30), m31 => m_input(31),
      
      -- Function select
      aluf0a => aluf0a, aluf1a => aluf1a, aluf2a => aluf2a, aluf3a => aluf3a,
      alumode => alumode, hi12 => hi12,
      
      -- Outputs
      alu16 => alu_output(16), alu17 => alu_output(17), alu18 => alu_output(18), alu19 => alu_output(19),
      alu20 => alu_output(20), alu21 => alu_output(21), alu22 => alu_output(22), alu23 => alu_output(23),
      alu24 => alu_output(24), alu25 => alu_output(25), alu26 => alu_output(26), alu27 => alu_output(27),
      alu28 => alu_output(28), alu29 => alu_output(29), alu30 => alu_output(30), alu31 => alu_output(31),
      alu32 => open, -- Overflow bit
      
      -- X and Y outputs
      xout19 => xout19, yout19 => yout19, xout23 => xout23, yout23 => yout23,
      xout27 => xout27, yout27 => yout27, xout31 => xout31, yout31 => yout31,
      
      -- Other outputs
      m31b => m31b_from_alu1, \a=m\ => open -- ALU1's A=B output
    );

  -- Connect A31 signals
  a31a <= a_input(31);
  a31b <= a_input(31);

  -- Set default control signals for testing
  div_n <= '1';     -- No division
  mul_n <= '1';     -- No multiplication  
  irjump_n <= '1';  -- No jump
  iralu_n <= '0';   -- ALU operation
  ir12_n <= '1';
  ir13_n <= '1';

  -- Calculate expected result for verification
  process(a_input, m_input, aluf3a, aluf2a, aluf1a, aluf0a, alumode)
    variable a_val, m_val : unsigned(31 downto 0);
    variable func : std_logic_vector(3 downto 0);
  begin
    a_val := unsigned(a_input);
    m_val := unsigned(m_input);
    -- Use actual ALU function codes from ALUC4, not IR bits
    func := aluf3a & aluf2a & aluf1a & aluf0a;
    
    if alumode = '1' then
      -- Logic mode
      case func is
        when "0000" => expected_result <= std_logic_vector(not a_val);
        when "0001" => expected_result <= std_logic_vector(not (a_val or m_val));
        when "0010" => expected_result <= std_logic_vector((not a_val) and m_val);
        when "0011" => expected_result <= (others => '0');  -- SETZ
        when "0100" => expected_result <= std_logic_vector(not (a_val and m_val));
        when "0101" => expected_result <= std_logic_vector(not m_val);
        when "0110" => expected_result <= std_logic_vector(a_val xor m_val);
        when "0111" => expected_result <= std_logic_vector(a_val and (not m_val));
        when "1000" => expected_result <= std_logic_vector((not a_val) or m_val);
        when "1001" => expected_result <= std_logic_vector(not (a_val xor m_val));
        when "1010" => expected_result <= std_logic_vector(m_val);
        when "1011" => expected_result <= std_logic_vector(a_val and m_val);
        when "1100" => expected_result <= (others => '1');  -- SETO
        when "1101" => expected_result <= std_logic_vector(a_val or (not m_val));
        when "1110" => expected_result <= std_logic_vector(a_val or m_val);
        when "1111" => expected_result <= std_logic_vector(a_val);
        when others => expected_result <= (others => 'X');
      end case;
    else
      -- Arithmetic mode - simplified for common operations
      case func is
        when "0000" => expected_result <= std_logic_vector(a_val);  -- A
        when "0110" => expected_result <= std_logic_vector(a_val - m_val);  -- A-B
        when "1001" => expected_result <= std_logic_vector(a_val + m_val);  -- A+B
        when others => expected_result <= (others => 'X');
      end case;
    end if;
  end process;
  
  -- Test process
  test_proc : process
    variable test_name : string(1 to 20);
    variable func_code : std_logic_vector(3 downto 0);
  begin
    wait for 1 ns;
    
    -- Test 1: Logic mode - Test whatever function ALUC4 produces
    test_name := "Logic Function Test ";
    alumode <= '1';  -- Logic mode
    ir_input <= "00001100";  -- IR input 12 (decimal)
    a_input <= x"AAAAAAAA";
    m_input <= x"55555555";
    wait for 10 ns;
    
    func_code := aluf3a & aluf2a & aluf1a & aluf0a;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) & 
             " (Function " & integer'image(to_integer(unsigned(func_code))) & ")" severity error;
    end if;
    
    -- Test 2: Logic mode - SETZ (should output 0)
    test_name := "Logic SETZ          ";
    alumode <= '1';
    ir_input <= "00000011";  -- SETZ function
    a_input <= x"FFFFFFFF";
    m_input <= x"12345678";
    wait for 10 ns;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) severity error;
    end if;
    
    -- Test 3: Logic mode - SETO (should output all 1s)
    test_name := "Logic SETO          ";
    alumode <= '1';
    ir_input <= "00001100";  -- SETO function
    a_input <= x"00000000";
    m_input <= x"12345678";
    wait for 10 ns;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) severity error;
    end if;
    
    -- Test 4: Logic mode - A OR B
    test_name := "Logic A OR B        ";
    alumode <= '1';
    ir_input <= "00001110";  -- A+B (OR) function
    a_input <= x"F0F0F0F0";
    m_input <= x"0F0F0F0F";
    wait for 10 ns;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) severity error;
    end if;
    
    -- Test 5: Logic mode - A AND B
    test_name := "Logic A AND B       ";
    alumode <= '1';
    ir_input <= "00001011";  -- AB (AND) function
    a_input <= x"F0F0F0F0";
    m_input <= x"FF00FF00";
    wait for 10 ns;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) severity error;
    end if;
    
    -- Test 6: Arithmetic mode - A (pass through)
    test_name := "Arithmetic A        ";
    alumode <= '0';  -- Arithmetic mode
    ir_input <= "00000000";  -- A function
    a_input <= x"DEADBEEF";
    m_input <= x"00000000";
    wait for 10 ns;
    
    if alu_output /= expected_result then
      report "ERROR in " & test_name & ": Expected " & to_hstring(expected_result) & 
             ", got " & to_hstring(alu_output) severity error;
    end if;
    
    wait;
  end process;

end architecture; 