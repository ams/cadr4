-- 8-bit ALU Testbench using 2x SN74181 + 1x SN74182
-- This tests the integration of SN74181 ALUs with SN74182 carry lookahead
-- Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.sn74.all;
use work.misc.all;

entity alu_8bit_tb is
end entity;

architecture testbench of alu_8bit_tb is
  -- 8-bit inputs (active-high data)
  signal a_input : std_logic_vector(7 downto 0);
  signal b_input : std_logic_vector(7 downto 0);
  signal mode : std_logic; -- 1=logic, 0=arithmetic (matches SN74181 M input)
  signal sel : std_logic_vector(3 downto 0); -- function select
  signal cnb : std_logic; -- carry in (active low, matches SN74181 CNb input)
  
  -- 8-bit output (active-high data, active-low carry-out)
  signal f_output : std_logic_vector(7 downto 0);
  signal coutb : std_logic; -- carry out (active low)
  
  -- Internal signals for ALU0 (bits 0-3)
  signal alu0_f : std_logic_vector(3 downto 0);
  signal alu0_x, alu0_y : std_logic;
  signal alu0_cout : std_logic;
  
  -- Internal signals for ALU1 (bits 4-7)  
  signal alu1_f : std_logic_vector(3 downto 0);
  signal alu1_x, alu1_y : std_logic;
  signal alu1_cout : std_logic;
  
  -- Carry lookahead signals
  signal cla_cout0, cla_cout1 : std_logic;
  signal cla_x, cla_y : std_logic;
  
  -- Internal carry signals (active low)
  signal cout0_n, cout1_n : std_logic;

begin

  -- Keep carry out as active-low (matches SN74181 CN4b output)
  coutb <= alu1_cout;
  
  -- Lower 4-bit ALU (ALU0): bits 0-3
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
  
  -- Upper 4-bit ALU (ALU1): bits 4-7
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
  
  -- Carry Lookahead Generator
  cla: sn74182 port map (
    CN_e => cnb,
    PB_e => '1' & '1' & alu1_x & alu0_x,  -- PB[3:0] = unused, unused, alu1_x, alu0_x
    GB_e => '0' & '0' & alu1_y & alu0_y,  -- GB[3:0] = unused, unused, alu1_y, alu0_y
    CNX_e => cout0_n,
    CNY_e => cout1_n,
    CNZ_e => open,  -- Unused
    PBo_e => cla_x,
    GBo_e => cla_y
  );
  
  -- Combine ALU outputs
  f_output <= alu1_f & alu0_f;
  
  -- Test process
  test_proc: process
    file test_vectors : text;
    variable test_line : line;
    variable a_val, b_val, expected_val : std_logic_vector(7 downto 0);
    variable mode_val, cin_val, dummy_carry_val : std_logic;
    variable sel_val : std_logic_vector(3 downto 0);
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
  begin
    report "=== Starting 8-bit ALU Tests (2x SN74181 + 1x SN74182) ===";
    report "Interface: Active-high data, Mode=1 for logic, CNb=active-low carry-in";
    
    file_open(test_vectors, "build/alu_8bit_tb.txt", read_mode);
    
    while not endfile(test_vectors) loop
      readline(test_vectors, test_line);
      read(test_line, a_val);
      read(test_line, b_val);
      read(test_line, mode_val);
      read(test_line, sel_val);
      read(test_line, cin_val);  -- This is already CNb (active-low carry-in)
      read(test_line, expected_val);
      read(test_line, dummy_carry_val);  -- Read but ignore carry value for now
      
      test_count := test_count + 1;
      
      -- Apply inputs (cin_val is already active-low CNb)
      a_input <= a_val;
      b_input <= b_val;
      mode <= mode_val;
      sel <= sel_val;
      cnb <= cin_val;  -- cin_val is already active-low CNb
      
      -- Wait for propagation
      wait for 20 ns;
      
      if f_output = expected_val then
        pass_count := pass_count + 1;
        report "PASS: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(a_val) & " B=" & to_hstring(b_val) & 
               " M=" & std_logic'image(mode_val) & " S=" & to_bstring(sel_val) & 
               " CNb=" & std_logic'image(cnb) & " F=" & to_hstring(f_output);
      else
        report "FAIL: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(a_val) & " B=" & to_hstring(b_val) & 
               " M=" & std_logic'image(mode_val) & " S=" & to_bstring(sel_val) & 
               " CNb=" & std_logic'image(cnb) & 
               " Expected=" & to_hstring(expected_val) & 
               " Got=" & to_hstring(f_output) severity error;
      end if;
    end loop;
    
    file_close(test_vectors);
    report "=== 8-bit ALU Tests Complete: " & integer'image(pass_count) & "/" & integer'image(test_count) & " passed ===";
    wait;
  end process;

end architecture; 