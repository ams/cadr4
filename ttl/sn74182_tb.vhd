library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sn74.all;

entity sn74182_tb is
end;

architecture testbench of sn74182_tb is

  signal CN_e    : std_logic;
  signal X_e     : std_logic_vector(3 downto 0);
  signal Y_e     : std_logic_vector(3 downto 0);
  signal CNX_e   : std_logic;
  signal CNY_e   : std_logic;
  signal CNZ_e   : std_logic;
  signal Xo_e    : std_logic;
  signal Yo_e    : std_logic;

  type vec4 is array(0 to 3) of std_logic;

  -- Test vector: {CN_e, X_e, Y_e, exp_CNX_e, exp_CNY_e, exp_CNZ_e, exp_Xo_e, exp_Yo_e}
  type testvec is record
    CN_e : std_logic;
    PB : vec4;
    GB : vec4;
    exp_CNX : std_logic; -- CNX_e (cout0_n)
    exp_CNY : std_logic; -- CNY_e (cout1_n)
    exp_CNZ : std_logic; -- CNZ_e (cout2_n)
    exp_Xo : std_logic; -- Xo_e (group propagate)
    exp_Yo : std_logic; -- Yo_e (group generate)
  end record;

  type testvec_array is array (natural range <>) of testvec;
  constant tests : testvec_array := (
    -- Test case 1: All propagate, original carry was 1
    -- CN_e='0' (CNB=0, original carry was 1), X_e='1111', Y_e='0000' (all propagate, no generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 0 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0
    ( '0', ( '1','1','1','1' ), ( '0','0','0','0' ), '1', '1', '1', '1', '0' ),
    
    -- Test case 2: All propagate, original carry was 0  
    -- CN_e='1' (CNB=1, original carry was 0), X_e='1111', Y_e='0000' (all propagate, no generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 1 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0
    ( '1', ( '1','1','1','1' ), ( '0','0','0','0' ), '1', '1', '1', '1', '0' ),
    
    -- Test case 3: All generate
    -- CN_e='0' (CNB=0, original carry was 1), X_e='0000', Y_e='1111' (no propagate, all generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 0 AND 1) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 1 = 1
    ( '0', ( '0','0','0','0' ), ( '1','1','1','1' ), '1', '1', '1', '0', '1' ),
    
    -- Test case 4: Partial generate
    -- CN_e='0' (CNB=0, original carry was 1), X_e='0000', Y_e='1100' (generate at positions 0,1 only)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 0 AND 1) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '0', ( '0','0','0','0' ), ( '1','1','0','0' ), '1', '1', '1', '0', '0' ),
    
    -- Test case 5: All inputs high (both propagate and generate)
    -- CN_e='0' (CNB=0, original carry was 1), X_e='1111', Y_e='1111' (all propagate and generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 1 OR 0 AND 1) = NOT(1) = 0
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(1 OR 1 OR 0) = NOT(1) = 0
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(1 OR 1 OR 1 OR 0) = NOT(1) = 0
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 1 OR 1 OR 1 OR 1 = 1
    ( '0', ( '1','1','1','1' ), ( '1','1','1','1' ), '0', '0', '0', '1', '1' ),
    
    -- Test case 6: Single stage generate at LSB
    -- CN_e='0' (CNB=0, original carry was 1), X_e='0000', Y_e='1000' (generate only at position 0)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 0 AND 1) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '0', ( '0','0','0','0' ), ( '1','0','0','0' ), '1', '1', '1', '0', '0' ),
    
    -- Test case 7: Mixed propagate and generate with carry
    -- CN_e='1' (CNB=1, original carry was 0), X_e='1010', Y_e='0101' (alternating pattern)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 1 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 AND 1 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(1 AND 0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 0 OR 1 OR 0 = 1
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '1', ( '1','0','1','0' ), ( '0','1','0','1' ), '1', '1', '1', '1', '0' ),
    
    -- Additional test case 8: No propagate, no generate
    -- CN_e='0' (CNB=0, original carry was 1), X_e='0000', Y_e='0000' (no propagate, no generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 0 OR 0 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- Xo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- Yo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '0', ( '0','0','0','0' ), ( '0','0','0','0' ), '1', '1', '1', '0', '0' )
  );

begin

  -- Unit Under Test
  uut : sn74182 port map(
    Xo_e  => Xo_e,
    Yo_e  => Yo_e,
    CNZ_e => CNZ_e,
    CNY_e => CNY_e,
    CNX_e => CNX_e,
    X_e   => X_e,
    Y_e   => Y_e,
    CN_e  => CN_e
  );

  test_process : process
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
    variable fail_count : integer := 0;
    
    function to_string(v : vec4) return string is
    begin
      return std_logic'image(v(3)) & std_logic'image(v(2)) & std_logic'image(v(1)) & std_logic'image(v(0));
    end function;
    
    procedure run_test(i : integer; t : testvec) is
    begin
      test_count := test_count + 1;
      
      -- Apply inputs
      CN_e <= t.CN_e;
      X_e <= t.PB(3) & t.PB(2) & t.PB(1) & t.PB(0);
      Y_e <= t.GB(3) & t.GB(2) & t.GB(1) & t.GB(0);
      
      -- Wait for propagation
      wait for 20 ns;
      
      -- Check outputs
      if (CNX_e = t.exp_CNX and 
          CNY_e = t.exp_CNY and 
          CNZ_e = t.exp_CNZ and 
          Xo_e = t.exp_Xo and 
          Yo_e = t.exp_Yo) then
        pass_count := pass_count + 1;
        report "PASS: Test " & integer'image(i) & " - " &
               "CN=" & std_logic'image(t.CN_e) &
               ", PB=" & to_string(t.PB) &
               ", GB=" & to_string(t.GB) &
               " => CNX=" & std_logic'image(CNX_e) &
               ", CNY=" & std_logic'image(CNY_e) &
               ", CNZ=" & std_logic'image(CNZ_e) &
               ", Xo=" & std_logic'image(Xo_e) &
               ", Yo=" & std_logic'image(Yo_e);
      else
        fail_count := fail_count + 1;
        report "FAIL: Test " & integer'image(i) & " - " &
               "CN=" & std_logic'image(t.CN_e) &
               ", PB=" & to_string(t.PB) &
               ", GB=" & to_string(t.GB) &
               " => Expected: CNX=" & std_logic'image(t.exp_CNX) &
               ", CNY=" & std_logic'image(t.exp_CNY) &
               ", CNZ=" & std_logic'image(t.exp_CNZ) &
               ", Xo=" & std_logic'image(t.exp_Xo) &
               ", Yo=" & std_logic'image(t.exp_Yo) &
               " | Got: CNX=" & std_logic'image(CNX_e) &
               ", CNY=" & std_logic'image(CNY_e) &
               ", CNZ=" & std_logic'image(CNZ_e) &
               ", Xo=" & std_logic'image(Xo_e) &
               ", Yo=" & std_logic'image(Yo_e)
               severity error;
      end if;
    end procedure;
    
  begin
    report "=== Starting SN74182 Tests with Known Correct Values ===";
    
    -- Run all test cases
    for i in tests'range loop
      run_test(i, tests(i));
    end loop;
    
    -- Final Report
    report "=== SN74182 Test Summary ===";
    report "Total Tests: " & integer'image(test_count);
    report "Passed: " & integer'image(pass_count);
    report "Failed: " & integer'image(fail_count);
    
    if fail_count = 0 then
      report "*** ALL TESTS PASSED - SN74182 FUNCTIONAL IMPLEMENTATION VERIFIED ***" severity note;
    else
      report "*** " & integer'image(fail_count) & " TESTS FAILED ***" severity error;
    end if;
    
    wait;
  end process;

end;
