-- 16-bit ALU Testbench using 4x SN74181 + 1x SN74182
-- This tests the integration of SN74181 ALUs with SN74182 carry lookahead
-- for a complete 16-bit ALU
-- Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.sn74.all;
use work.misc.all;

entity alu_16bit_tb is
end entity;

architecture testbench of alu_16bit_tb is
  -- 16-bit inputs (active-high data)
  signal a_input : std_logic_vector(15 downto 0);
  signal b_input : std_logic_vector(15 downto 0);
  signal mode : std_logic; -- 1=logic, 0=arithmetic (matches SN74181 M input)
  signal sel : std_logic_vector(3 downto 0); -- function select
  signal cnb : std_logic; -- carry in (active low, matches SN74181 CNb input)
  
  -- 16-bit output (active-high data, active-low carry-out)
  signal f_output : std_logic_vector(15 downto 0);
  signal coutb : std_logic; -- carry out (active low)
  
  -- Internal signals for ALU slices
  signal alu0_f, alu1_f, alu2_f, alu3_f : std_logic_vector(3 downto 0);
  signal alu0_x, alu1_x, alu2_x, alu3_x : std_logic;
  signal alu0_y, alu1_y, alu2_y, alu3_y : std_logic;
  signal alu0_cout, alu1_cout, alu2_cout, alu3_cout : std_logic;
  
  -- Carry lookahead signals (active low)
  signal cout0_n, cout1_n, cout2_n : std_logic; -- intermediate carries (active low)
  signal xout, yout : std_logic; -- CLA outputs
  
begin
  
  -- ALU slice 0: bits 0-3
  alu0: entity work.sn74181(structural) port map (
    A_e => a_input(3 downto 0),
    B_e => b_input(3 downto 0),
    S_e => sel,
    M_e => mode,
    CNb_e => cnb,
    F_e => alu0_f,
    X_e => alu0_x,
    Y_e => alu0_y,
    CN4b_e => alu0_cout,
    AEB_e => open
  );
  
  -- ALU slice 1: bits 4-7
  alu1: entity work.sn74181(structural) port map (
    A_e => a_input(7 downto 4),
    B_e => b_input(7 downto 4),
    S_e => sel,
    M_e => mode,
    CNb_e => cout0_n,  -- Carry from CLA
    F_e => alu1_f,
    X_e => alu1_x,
    Y_e => alu1_y,
    CN4b_e => alu1_cout,
    AEB_e => open
  );
  
  -- ALU slice 2: bits 8-11
  alu2: entity work.sn74181(structural) port map (
    A_e => a_input(11 downto 8),
    B_e => b_input(11 downto 8),
    S_e => sel,
    M_e => mode,
    CNb_e => cout1_n,  -- Carry from CLA
    F_e => alu2_f,
    X_e => alu2_x,
    Y_e => alu2_y,
    CN4b_e => alu2_cout,
    AEB_e => open
  );
  
  -- ALU slice 3: bits 12-15
  alu3: entity work.sn74181(structural) port map (
    A_e => a_input(15 downto 12),
    B_e => b_input(15 downto 12),
    S_e => sel,
    M_e => mode,
    CNb_e => cout2_n,  -- Carry from CLA
    F_e => alu3_f,
    X_e => alu3_x,
    Y_e => alu3_y,
    CN4b_e => alu3_cout,
    AEB_e => open
  );
  
  -- Carry Lookahead Generator
  cla: sn74182 port map (
    CN_e => cnb,
    PB_e => alu3_x & alu2_x & alu1_x & alu0_x,  -- PB[3:0] = alu3_x, alu2_x, alu1_x, alu0_x
    GB_e => alu3_y & alu2_y & alu1_y & alu0_y,  -- GB[3:0] = alu3_y, alu2_y, alu1_y, alu0_y
    CNX_e => cout0_n,
    CNY_e => cout1_n,
    CNZ_e => cout2_n,
    PBo_e => xout,
    GBo_e => yout
  );
  
  -- Combine ALU outputs
  f_output <= alu3_f & alu2_f & alu1_f & alu0_f;
  
  -- Final carry out (keep as active-low, matches SN74181 CN4b output)
  coutb <= alu3_cout;
  
  -- Test process
  test_proc: process
    file test_vectors_file : text;
    variable test_line : line;
    variable v_a, v_b, v_f : std_logic_vector(15 downto 0);
    variable v_m, v_cin, v_cout : std_logic;
    variable v_s : std_logic_vector(3 downto 0);
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
  begin
    report "=== Starting 16-bit ALU Tests (4x SN74181 + 1x SN74182) ===";
    report "Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in";
    
    file_open(test_vectors_file, "build/alu_16bit_tb.txt", read_mode);
    
    while not endfile(test_vectors_file) loop
      readline(test_vectors_file, test_line);
      test_count := test_count + 1;
      
      -- Read test vector: A(16bit) B(16bit) M(1bit) S(4bit) Cin(1bit) F(16bit) Cout(1bit)
      read(test_line, v_a);
      read(test_line, v_b);
      read(test_line, v_m);
      read(test_line, v_s);
      read(test_line, v_cin);
      read(test_line, v_f);
      read(test_line, v_cout);
      
      -- Apply test inputs (v_cin is already active-low CNb)
      a_input <= v_a;
      b_input <= v_b;
      mode <= v_m;
      sel <= v_s;
      cnb <= v_cin;  -- v_cin is already active-low CNb
      
      -- Wait for propagation
      wait for 20 ns;
      
      -- Check results
      if f_output = v_f then
        pass_count := pass_count + 1;
        report "PASS: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(v_a) & 
               " B=" & to_hstring(v_b) & 
               " M='" & std_logic'image(v_m) & 
               "' S=" & to_bstring(v_s) & 
               " CNb='" & std_logic'image(cnb) & 
               "' F=" & to_hstring(v_f);
      else
        report "FAIL: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(v_a) & 
               " B=" & to_hstring(v_b) & 
               " M='" & std_logic'image(v_m) & 
               "' S=" & to_bstring(v_s) & 
               " CNb='" & std_logic'image(cnb) & 
               "' Expected=" & to_hstring(v_f) & 
               " Got=" & to_hstring(f_output)
               severity error;
      end if;
    end loop;
    
    file_close(test_vectors_file);
    
    report "=== 16-bit ALU Tests Complete: " & integer'image(pass_count) & "/" & integer'image(test_count) & " passed ===";
    wait;
  end process;

end architecture; 