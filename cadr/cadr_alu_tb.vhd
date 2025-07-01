-- CADR ALU Testbench
-- Tests the complete CADR ALU subsystem using ALU0, ALU1, and ALUC4 components
-- Focus on 32-bit arithmetic operations with proper carry handling

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library work;
use work.cadr_book.all;
use work.misc.all;

entity cadr_alu_tb is
end entity;

architecture testbench of cadr_alu_tb is
  -- Input signals for the 32-bit ALU
  signal a_input : std_logic_vector(31 downto 0);
  signal m_input : std_logic_vector(31 downto 0);
  signal ir_input : std_logic_vector(7 downto 0);
  
  -- Output signals
  signal alu_output : std_logic_vector(31 downto 0);
  signal alu32 : std_logic;
  
  -- control signal inputs that are hardcoded
  signal irjump, \-irjump\ : std_logic;
  signal \-ir12\, \-ir13\, \-iralu\ : std_logic;
  signal \-div\, \-mul\: std_logic;

  -- All signals are named identically to the port names
  signal aluadd, alusub : std_logic;
  signal aluf0a, aluf1a, aluf2a, aluf3a : std_logic;
  signal aluf0b, aluf1b, aluf2b, aluf3b : std_logic;
  signal \-aluf0\, \-aluf1\, \-aluf2\, \-aluf3\ : std_logic;
  signal alumode, \-alumode\ : std_logic;
  signal \-cin0\, \-cin4\, \-cin8\, \-cin12\ : std_logic;
  signal \-cin16\, \-cin20\, \-cin24\, \-cin28\, \-cin32\ : std_logic;
  signal xout3, yout3, xout7, yout7 : std_logic;
  signal xout11, yout11, xout15, yout15 : std_logic;
  signal xout19, yout19, xout23, yout23 : std_logic;
  signal xout27, yout27, xout31, yout31 : std_logic;
  signal xx0, xx1, yy0, yy1 : std_logic;
  -- -ir is derived from ir_input
  signal \-ir0\, \-ir1\, \-ir2\, \-ir3\, \-ir4\ : std_logic;
  signal \-mulnop\ : std_logic;
  signal divaddcond, divsubcond, \-divposlasttime\ : std_logic;
  signal a31a, a31b, \-a31\ : std_logic;
  signal osel0a, osel0b, osel1a, osel1b : std_logic;
  signal q0 : std_logic;
  signal \a=m_0\, \a=m_1\ : std_logic;
  signal m31b : std_logic;
  signal hi12 : std_logic;

begin
  
  -- Generate input IR bit signals for ALUC4
  -- hi12
  hi12 <= '1';
  -- ir13 and ir12 is not important, these generate oasel signals
  \-ir12\ <= '1';
  \-ir13\ <= '1';
  -- testing alu instruction not jump
  \-iralu\ <= '0';
  irjump <= '0';
  \-irjump\ <= not irjump;
  -- not doing any div or mul
  \-div\ <= '1';
  \-mul\ <= '1';
  -- q0 is not important, not doing any div or mul
  q0 <= '0';
  -- a31 is duplicated into a31a and a31b in alatch
  a31a <= a_input(31);
  a31b <= a_input(31);

  -- because in port cant have an expression
  \-ir0\ <= not ir_input(0);
  \-ir1\ <= not ir_input(1);
  \-ir2\ <= not ir_input(2);
  \-ir3\ <= not ir_input(3);
  \-ir4\ <= not ir_input(4);

  -- ALUC4 instance - ALU control unit
  aluc4_inst: cadr_aluc4 port map (
    \-div\ => \-div\,
    hi12 => hi12,
    \-iralu\ => \-iralu\,
    \-irjump\ => \-irjump\,
    irjump => irjump,
    \-ir12\ => \-ir12\,
    \-ir13\ => \-ir13\,
    ir0 => ir_input(0),
    ir1 => ir_input(1),
    ir2 => ir_input(2),
    ir3 => ir_input(3),
    ir4 => ir_input(4),
    ir5 => ir_input(5),
    ir6 => ir_input(6),
    ir7 => ir_input(7),
    \-mul\ => \-mul\,
    q0 => q0,
    a31a => a31a,
    a31b => a31b,
    xout15 => xout15,
    xout31 => xout31,
    xout3 => xout3,
    xout7 => xout7,
    xout11 => xout11,
    xout19 => xout19,
    xout23 => xout23,
    xout27 => xout27,
    yout15 => yout15,
    yout31 => yout31,
    yout3 => yout3,
    yout7 => yout7,
    yout11 => yout11,
    yout19 => yout19,
    yout23 => yout23,
    yout27 => yout27,
    \-a31\ => \-a31\,
    \-divposlasttime\ => \-divposlasttime\,
    \-ir0\ => \-ir0\,
    \-ir1\ => \-ir1\,
    \-ir2\ => \-ir2\,
    \-ir3\ => \-ir3\,
    \-ir4\ => \-ir4\,
    aluadd => aluadd,
    alusub => alusub,
    \-aluf0\ => \-aluf0\,
    \-aluf1\ => \-aluf1\,
    \-aluf2\ => \-aluf2\,
    \-aluf3\ => \-aluf3\,
    aluf0a => aluf0a,
    aluf0b => aluf0b,
    aluf1a => aluf1a,
    aluf1b => aluf1b,
    aluf2a => aluf2a,
    aluf2b => aluf2b,
    aluf3a => aluf3a,
    aluf3b => aluf3b,
    \-alumode\ => \-alumode\,
    alumode => alumode,
    \-cin0\ => \-cin0\,
    \-cin4\ => \-cin4\,
    \-cin8\ => \-cin8\,
    \-cin12\ => \-cin12\,
    \-cin16\ => \-cin16\,
    \-cin20\ => \-cin20\,
    \-cin24\ => \-cin24\,
    \-cin28\ => \-cin28\,
    \-cin32\ => \-cin32\,
    divaddcond => divaddcond,
    divsubcond => divsubcond,
    \-mulnop\ => \-mulnop\,
    osel0a => osel0a,
    osel0b => osel0b,
    osel1a => osel1a,
    osel1b => osel1b,
    xx0 => xx0,
    xx1 => xx1,
    yy0 => yy0,
    yy1 => yy1
  );

  -- ALU0 instance - lower 16 bits
  alu0_inst: cadr_alu0 port map (
    \-cin0\ => \-cin0\,
    \-cin4\ => \-cin4\,
    \-cin8\ => \-cin8\,
    \-cin12\ => \-cin12\,
    a0 => a_input(0), a1 => a_input(1), a2 => a_input(2), a3 => a_input(3),
    a4 => a_input(4), a5 => a_input(5), a6 => a_input(6), a7 => a_input(7),
    a8 => a_input(8), a9 => a_input(9), a10 => a_input(10), a11 => a_input(11),
    a12 => a_input(12), a13 => a_input(13), a14 => a_input(14), a15 => a_input(15),
    m0 => m_input(0), m1 => m_input(1), m2 => m_input(2), m3 => m_input(3),
    m4 => m_input(4), m5 => m_input(5), m6 => m_input(6), m7 => m_input(7),
    m8 => m_input(8), m9 => m_input(9), m10 => m_input(10), m11 => m_input(11),
    m12 => m_input(12), m13 => m_input(13), m14 => m_input(14), m15 => m_input(15),
    aluf0b => aluf0b, aluf1b => aluf1b, aluf2b => aluf2b, aluf3b => aluf3b,
    alumode => alumode,
    alu0 => alu_output(0), alu1 => alu_output(1), alu2 => alu_output(2), alu3 => alu_output(3),
    alu4 => alu_output(4), alu5 => alu_output(5), alu6 => alu_output(6), alu7 => alu_output(7),
    alu8 => alu_output(8), alu9 => alu_output(9), alu10 => alu_output(10), alu11 => alu_output(11),
    alu12 => alu_output(12), alu13 => alu_output(13), alu14 => alu_output(14), alu15 => alu_output(15),
    xout3 => xout3, yout3 => yout3, xout7 => xout7, yout7 => yout7,
    xout11 => xout11, yout11 => yout11, xout15 => xout15, yout15 => yout15,
    \a=m\ => \a=m_0\
  );

  -- ALU1 instance - upper 16 bits  
  alu1_inst: cadr_alu1 port map (
    \-cin16\ => \-cin16\,
    \-cin20\ => \-cin20\,
    \-cin24\ => \-cin24\,
    \-cin28\ => \-cin28\,
    \-cin32\ => \-cin32\,
    a16 => a_input(16), a17 => a_input(17), a18 => a_input(18), a19 => a_input(19),
    a20 => a_input(20), a21 => a_input(21), a22 => a_input(22), a23 => a_input(23),
    a24 => a_input(24), a25 => a_input(25), a26 => a_input(26), a27 => a_input(27),
    a28 => a_input(28), a29 => a_input(29), a30 => a_input(30),
    a31a => a_input(31), a31b => a_input(31),
    m16 => m_input(16), m17 => m_input(17), m18 => m_input(18), m19 => m_input(19),
    m20 => m_input(20), m21 => m_input(21), m22 => m_input(22), m23 => m_input(23),
    m24 => m_input(24), m25 => m_input(25), m26 => m_input(26), m27 => m_input(27),
    m28 => m_input(28), m29 => m_input(29), m30 => m_input(30), m31 => m_input(31),
    aluf0a => aluf0a, aluf1a => aluf1a, aluf2a => aluf2a, aluf3a => aluf3a,
    alumode => alumode, hi12 => hi12,
    alu16 => alu_output(16), alu17 => alu_output(17), alu18 => alu_output(18), alu19 => alu_output(19),
    alu20 => alu_output(20), alu21 => alu_output(21), alu22 => alu_output(22), alu23 => alu_output(23),
    alu24 => alu_output(24), alu25 => alu_output(25), alu26 => alu_output(26), alu27 => alu_output(27),
    alu28 => alu_output(28), alu29 => alu_output(29), alu30 => alu_output(30), alu31 => alu_output(31),
    alu32 => alu32,
    xout19 => xout19, yout19 => yout19, xout23 => xout23, yout23 => yout23,
    xout27 => xout27, yout27 => yout27, xout31 => xout31, yout31 => yout31,
    m31b => m31b, \a=m\ => \a=m_1\
  );
  
  -- Test process
  test_proc: process
    file test_vectors_file : text;
    variable test_line : line;
    variable v_a, v_b, v_f : std_logic_vector(31 downto 0);
    variable v_m, v_cin, v_cout, v_x, v_y : std_logic;
    variable v_s : std_logic_vector(3 downto 0);
    variable ir2, ir3, ir4, ir5, ir6, ir7 : std_logic;
    variable full_ir : std_logic_vector(7 downto 0);
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
  begin
    
    file_open(test_vectors_file, "cadr/alu_32bit_tb.txt", read_mode);
    
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

      -- Convert 74181-style inputs to CADR IR format
      -- pay attention to polarity and position changes here
      ir3 := v_s(3);
      ir4 := v_s(2);
      ir6 := not v_s(1);
      ir5 := not v_s(0);
      ir7 := not v_m;
      ir2 := not v_cin;  -- Invert CIN for active-low carry system
      -- ir1 and ir0 are tied to "00"
      full_ir := ir7 & ir6 & ir5 & ir4 & ir3 & ir2 & "00";
      
      -- Connect v_a to ALU's M port and v_b to ALU's A port
      a_input <= v_b;
      m_input <= v_a;
      ir_input <= full_ir;
      wait for 30 ns;
      
      if alu_output = v_f then
        pass_count := pass_count + 1;
      else
        report "FAIL: Test " & integer'image(test_count) & 
               " | A=" & to_hstring(v_a) & 
               " B=" & to_hstring(v_b) & 
               " M='" & std_logic'image(v_m) & 
               "' S=" & to_bstring(v_s) & 
               " CIN='" & std_logic'image(v_cin) & 
               "' Expected F=" & to_hstring(v_f) & " Got F=" & to_hstring(alu_output) &
               " IR=" & to_bstring(full_ir) &
               " alumode=" & std_logic'image(alumode) &
               " aluf3b=" & std_logic'image(aluf3b) &
               " aluf2b=" & std_logic'image(aluf2b) &
               " aluf1b=" & std_logic'image(aluf1b) &
               " aluf0b=" & std_logic'image(aluf0b) &
               " -cin0=" & std_logic'image(\-cin0\) &
               " -cin4=" & std_logic'image(\-cin4\) &
               " -cin8=" & std_logic'image(\-cin8\) &
               " -cin12=" & std_logic'image(\-cin12\)
               severity error;
      end if;
    end loop;
    
    file_close(test_vectors_file);
    
    wait;
  end process;

end architecture; 