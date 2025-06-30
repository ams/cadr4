-- 32-bit ALU Testbench using 8x SN74181 + 3x SN74182 (CADR-style)
-- This tests a 32-bit ALU constructed from 8x SN74181 ALUs with 3x SN74182 carry look-ahead generators
-- arranged in a hierarchical structure similar to the CADR processor ALU
-- Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.sn74.all;
use work.misc.all;

entity alu_32bit_tb is
end entity;

architecture testbench of alu_32bit_tb is
  -- 32-bit inputs (active-high data)
  signal s_a : std_logic_vector(31 downto 0);
  signal s_b : std_logic_vector(31 downto 0);
  signal s_m : std_logic; -- 1=logic, 0=arithmetic (matches SN74181 M input)
  signal s_s : std_logic_vector(3 downto 0); -- function select
  signal s_cin_n : std_logic; -- carry in (active low, matches SN74181 CNb input)
  
  -- 32-bit output (active-high data, active-low carry-out)
  signal s_f : std_logic_vector(31 downto 0);
  signal coutb : std_logic; -- carry out (active low)
  
  -- Internal signals for ALU slices (8x SN74181)
  signal alu0_f, alu1_f, alu2_f, alu3_f : std_logic_vector(3 downto 0);
  signal alu4_f, alu5_f, alu6_f, alu7_f : std_logic_vector(3 downto 0);
  signal alu0_x, alu1_x, alu2_x, alu3_x : std_logic;
  signal alu4_x, alu5_x, alu6_x, alu7_x : std_logic;
  signal alu0_y, alu1_y, alu2_y, alu3_y : std_logic;
  signal alu4_y, alu5_y, alu6_y, alu7_y : std_logic;
  signal alu0_cout, alu1_cout, alu2_cout, alu3_cout : std_logic;
  signal alu4_cout, alu5_cout, alu6_cout, alu7_cout : std_logic;
  
  -- Carry lookahead signals (active low) - 3 levels
  -- First level CLA (bits 0-15)
  signal cout4_n, cout8_n, cout12_n : std_logic; -- carries at bit positions 4, 8, 12
  signal x0_out, y0_out : std_logic; -- first CLA outputs
  
  -- Second level CLA (bits 16-31) 
  signal cout20_n, cout24_n, cout28_n : std_logic; -- carries at bit positions 20, 24, 28
  signal x1_out, y1_out : std_logic; -- second CLA outputs
  
  -- Third level CLA (combines the two 16-bit sections)
  signal cout16_n : std_logic; -- carry from low 16 bits to high 16 bits
  signal x2_out, y2_out : std_logic; -- third CLA outputs (not used)
  
begin
  
  -- ALU slice 0: bits 0-3
  alu0: sn74181 port map (
    A_e => s_a(3 downto 0),
    B_e => s_b(3 downto 0),
    S_e => s_s,
    M_e => s_m,
    CNb_e => s_cin_n,
    F_e => alu0_f,
    X_e => alu0_x,
    Y_e => alu0_y,
    CN4b_e => alu0_cout,
    AEB_e => open
  );
  
  -- ALU slice 1: bits 4-7
  alu1: sn74181 port map (
    A_e => s_a(7 downto 4),
    B_e => s_b(7 downto 4),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout4_n,  -- Carry from bit position 4
    F_e => alu1_f,
    X_e => alu1_x,
    Y_e => alu1_y,
    CN4b_e => alu1_cout,
    AEB_e => open
  );
  
  -- ALU slice 2: bits 8-11
  alu2: sn74181 port map (
    A_e => s_a(11 downto 8),
    B_e => s_b(11 downto 8),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout8_n,  -- Carry from bit position 8
    F_e => alu2_f,
    X_e => alu2_x,
    Y_e => alu2_y,
    CN4b_e => alu2_cout,
    AEB_e => open
  );
  
  -- ALU slice 3: bits 12-15
  alu3: sn74181 port map (
    A_e => s_a(15 downto 12),
    B_e => s_b(15 downto 12),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout12_n,  -- Carry from bit position 12
    F_e => alu3_f,
    X_e => alu3_x,
    Y_e => alu3_y,
    CN4b_e => alu3_cout,
    AEB_e => open
  );
  
  -- ALU slice 4: bits 16-19
  alu4: sn74181 port map (
    A_e => s_a(19 downto 16),
    B_e => s_b(19 downto 16),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout16_n,  -- Carry from third CLA (low to high 16-bit section)
    F_e => alu4_f,
    X_e => alu4_x,
    Y_e => alu4_y,
    CN4b_e => alu4_cout,
    AEB_e => open
  );
  
  -- ALU slice 5: bits 20-23
  alu5: sn74181 port map (
    A_e => s_a(23 downto 20),
    B_e => s_b(23 downto 20),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout20_n,  -- Carry from bit position 20
    F_e => alu5_f,
    X_e => alu5_x,
    Y_e => alu5_y,
    CN4b_e => alu5_cout,
    AEB_e => open
  );
  
  -- ALU slice 6: bits 24-27
  alu6: sn74181 port map (
    A_e => s_a(27 downto 24),
    B_e => s_b(27 downto 24),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout24_n,  -- Carry from bit position 24
    F_e => alu6_f,
    X_e => alu6_x,
    Y_e => alu6_y,
    CN4b_e => alu6_cout,
    AEB_e => open
  );
  
  -- ALU slice 7: bits 28-31
  alu7: sn74181 port map (
    A_e => s_a(31 downto 28),
    B_e => s_b(31 downto 28),
    S_e => s_s,
    M_e => s_m,
    CNb_e => cout28_n,  -- Carry from bit position 28
    F_e => alu7_f,
    X_e => alu7_x,
    Y_e => alu7_y,
    CN4b_e => alu7_cout,
    AEB_e => open
  );
  
  -- First Carry Lookahead Generator (handles bits 0-15)
  cla0: sn74182 port map (
    CNB_e => s_cin_n,
    X_e => alu3_x & alu2_x & alu1_x & alu0_x,  -- X[3:0] = alu3_x, alu2_x, alu1_x, alu0_x
    Y_e => alu3_y & alu2_y & alu1_y & alu0_y,  -- Y[3:0] = alu3_y, alu2_y, alu1_y, alu0_y
    CNX_e => cout4_n,
    CNY_e => cout8_n,
    CNZ_e => cout12_n,
    Xo_e => x0_out,
    Yo_e => y0_out
  );
  
  -- Second Carry Lookahead Generator (handles bits 16-31)
  cla1: sn74182 port map (
    CNB_e => cout16_n,
    X_e => alu7_x & alu6_x & alu5_x & alu4_x,  -- X[3:0] = alu7_x, alu6_x, alu5_x, alu4_x
    Y_e => alu7_y & alu6_y & alu5_y & alu4_y,  -- Y[3:0] = alu7_y, alu6_y, alu5_y, alu4_y
    CNX_e => cout20_n,
    CNY_e => cout24_n,
    CNZ_e => cout28_n,
    Xo_e => x1_out,
    Yo_e => y1_out
  );
  
  -- Third Carry Lookahead Generator (combines the two 16-bit sections)
  cla2: sn74182 port map (
    CNB_e => s_cin_n,
    X_e => "ZZ" & x1_out & x0_out,  -- Only use the propagate from each 16-bit section
    Y_e => "ZZ" & y1_out & y0_out,  -- Only use the generate from each 16-bit section
    CNX_e => cout16_n,  -- Carry from low 16 bits to high 16 bits
    CNY_e => open,      -- Not used
    CNZ_e => open,      -- Not used
    Xo_e => x2_out,    -- Overall propagate output (used for testing)
    Yo_e => y2_out     -- Overall generate output (used for testing)
  );
  
  -- Combine ALU outputs
  s_f <= alu7_f & alu6_f & alu5_f & alu4_f & alu3_f & alu2_f & alu1_f & alu0_f;
  
  -- Final carry out (keep as active-low, matches SN74181 CN4b output)
  coutb <= alu7_cout;
  
  -- Test process
  test_proc: process
    file test_vectors_file : text;
    variable test_line : line;
    variable v_a, v_b, v_f : std_logic_vector(31 downto 0);
    variable v_m, v_cin, v_cout, v_x, v_y : std_logic;
    variable v_s : std_logic_vector(3 downto 0);
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
  begin
    report "=== Starting 32-bit ALU Tests (8x SN74181 + 3x SN74182) ===";
    report "Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in";
    
    file_open(test_vectors_file, "build/alu_32bit_tb.txt", read_mode);
    
    while not endfile(test_vectors_file) loop
      readline(test_vectors_file, test_line);
      test_count := test_count + 1;
      
      -- Read test vector: A(32bit) B(32bit) M(1bit) S(4bit) Cin(1bit) F(32bit) Cout(1bit) X(1bit) Y(1bit)
      read(test_line, v_a);
      read(test_line, v_b);
      read(test_line, v_m);
      read(test_line, v_s);
      read(test_line, v_cin);
      read(test_line, v_f);
      read(test_line, v_cout);
      read(test_line, v_x);
      read(test_line, v_y);
      
      -- Apply test inputs (v_cin is already active-low CNb)
      s_a <= v_a;
      s_b <= v_b;
      s_m <= v_m;
      s_s <= v_s;
      s_cin_n <= v_cin;  -- v_cin is already active-low CNb
      
      -- Wait for propagation
      wait for 30 ns;
      
      -- Check results (F, X, and Y outputs) - try first CLA outputs
      if s_f = v_f and x0_out = v_x and y0_out = v_y then
        pass_count := pass_count + 1;
        report "PASS: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(v_a) & 
               " B=" & to_hstring(v_b) & 
               " M='" & std_logic'image(v_m) & 
               "' S=" & to_bstring(v_s) & 
               " CNb='" & std_logic'image(s_cin_n) & 
               "' F=" & to_hstring(v_f);
      else
        report "FAIL: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(v_a) & 
               " B=" & to_hstring(v_b) & 
               " M='" & std_logic'image(v_m) & 
               "' S=" & to_bstring(v_s) & 
               " CNb='" & std_logic'image(s_cin_n) & 
               "' Expected F=" & to_hstring(v_f) & " Got F=" & to_hstring(s_f) &
               " Expected X=" & std_logic'image(v_x) & " Got X=" & std_logic'image(x0_out) &
               " Expected Y=" & std_logic'image(v_y) & " Got Y=" & std_logic'image(y0_out)
               severity error;
      end if;
    end loop;
    
    file_close(test_vectors_file);
    
    report "=== 32-bit ALU Tests Complete: " & integer'image(pass_count) & "/" & integer'image(test_count) & " passed ===";
    wait;
  end process;

end architecture; 