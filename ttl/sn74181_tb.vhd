library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

use work.sn74.all;

entity sn74181_tb is
end;

architecture testbench of sn74181_tb is

  -- Inputs
  signal s_cin_n : std_logic := '1';                                   -- Carry in (active low)
  signal s_s     : std_logic_vector(3 downto 0) := (others => '0');
  signal s_m     : std_logic                    := '0';
  signal s_a     : std_logic_vector(3 downto 0) := (others => '0');
  signal s_b     : std_logic_vector(3 downto 0) := (others => '0');

  -- Outputs
  signal s_f      : std_logic_vector(3 downto 0);
  signal s_aeb    : std_logic;
  signal s_x      : std_logic;
  signal s_y      : std_logic;
  signal s_cout_n : std_logic;                                        -- Carry out (active low)

begin

  uut : entity work.sn74181(structural)
    port map (
      CNb_e  => s_cin_n,
      S_e    => s_s,
      M_e    => s_m,
      A_e    => s_a,
      B_e    => s_b,
      F_e    => s_f,
      AEB_e  => s_aeb,
      X_e    => s_x,
      Y_e    => s_y,
      CN4b_e => s_cout_n);

  test_proc: process
    file test_vectors : text;
    variable test_line : line;
    variable a_val, b_val, s_val, expected_f : std_logic_vector(3 downto 0);
    variable mode_val, cin_val, expected_cn4b, expected_x, expected_y : std_logic;
    variable test_count : integer := 0;
  begin
    file_open(test_vectors, "ttl/sn74181_tb.txt", read_mode);
    
    while not endfile(test_vectors) loop
      readline(test_vectors, test_line);
      
      -- Read space-delimited fields
      read(test_line, a_val);
      read(test_line, b_val);
      read(test_line, mode_val);
      read(test_line, s_val);
      read(test_line, cin_val);
      read(test_line, expected_f);
      read(test_line, expected_cn4b);
      read(test_line, expected_x);
      read(test_line, expected_y);

      s_a <= a_val;
      s_b <= b_val;
      s_m <= mode_val;
      s_s <= s_val;
      s_cin_n <= cin_val;
      wait for 10 ns;
      
      test_count := test_count + 1;
      
      -- Check F, X, and Y outputs
      if s_f = expected_f and s_x = expected_x and s_y = expected_y then
        -- Test passed
      else
        report "FAIL: Test " & integer'image(test_count) & 
               " | A=" & to_bstring(s_a) & " B=" & to_bstring(s_b) & " S=" & to_bstring(s_s) & " CNb=" & std_logic'image(s_cin_n) &
               " | F expected " & to_bstring(expected_f) & " got " & to_bstring(s_f) &
               " | X expected " & std_logic'image(expected_x) & " got " & std_logic'image(s_x) &
               " | Y expected " & std_logic'image(expected_y) & " got " & std_logic'image(s_y) severity error;
      end if;
    end loop;
    file_close(test_vectors);

    wait;
  end process;

end;


