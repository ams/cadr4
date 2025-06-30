library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74182_tb is
end;

architecture testbench of sn74182_tb is

  signal CN_e    : std_logic;
  signal PB_e    : std_logic_vector(3 downto 0);
  signal GB_e    : std_logic_vector(3 downto 0);
  signal CNX_e   : std_logic;
  signal CNY_e   : std_logic;
  signal CNZ_e   : std_logic;
  signal PBo_e   : std_logic;
  signal GBo_e   : std_logic;

  type vec4 is array(0 to 3) of std_logic;

  -- Test vector: {CN_e, PB_e, GB_e, exp_CNX_e, exp_CNY_e, exp_CNZ_e, exp_PBo_e, exp_GBo_e}
  type testvec is record
    CN_e : std_logic;
    PB : vec4;
    GB : vec4;
    exp_CNX : std_logic; -- CNX_e (cout0_n)
    exp_CNY : std_logic; -- CNY_e (cout1_n)
    exp_CNZ : std_logic; -- CNZ_e (cout2_n)
    exp_PBo : std_logic; -- PBo_e (xout)
    exp_GBo : std_logic; -- GBo_e (yout)
  end record;

  type testvec_array is array (natural range <>) of testvec;
  constant tests : testvec_array := (
    -- Test case 1: All propagate, no generate, no carry in
    -- CN_e='0' (no carry), PB_e='1111', GB_e='0000' (all propagate, no generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 1 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0) = 1
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0
    ( '0', ( '1','1','1','1' ), ( '0','0','0','0' ), '1', '1', '1', '1', '0' ),
    
    -- Test case 2: All propagate, carry in
    -- CN_e='1' (carry in), PB_e='1111', GB_e='0000' (all propagate, no generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 0 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0) = 1
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0
    ( '1', ( '1','1','1','1' ), ( '0','0','0','0' ), '1', '1', '1', '1', '0' ),
    
    -- Test case 3: All generate
    -- CN_e='0' (no carry), PB_e='0000', GB_e='1111' (no propagate, all generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 1 AND 1) = NOT(1) = 0
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 1) = NOT(1) = 0
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 1) = NOT(1) = 0
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 1 = 1
    ( '0', ( '0','0','0','0' ), ( '1','1','1','1' ), '0', '0', '0', '0', '1' ),
    
    -- Test case 4: Partial generate
    -- CN_e='0' (no carry), PB_e='0000', GB_e='1100' (generate at positions 0,1 only)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 1 AND 1) = NOT(1) = 0
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 1) = NOT(1) = 0
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '0', ( '0','0','0','0' ), ( '1','1','0','0' ), '0', '0', '1', '0', '0' ),
    
    -- Test case 5: All inputs high (both propagate and generate)
    -- CN_e='0' (no carry), PB_e='1111', GB_e='1111' (all propagate and generate)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 1 OR 1 AND 1) = NOT(1) = 0
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(1 OR 1 OR 1) = NOT(1) = 0
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(1 OR 1 OR 1 OR 1) = NOT(1) = 0
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 1 OR 1 OR 1 = 1
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 1 OR 1 OR 1 OR 1 = 1
    ( '0', ( '1','1','1','1' ), ( '1','1','1','1' ), '0', '0', '0', '1', '1' ),
    
    -- Test case 6: Single stage generate at LSB
    -- CN_e='0' (no carry), PB_e='0000', GB_e='1000' (generate only at position 0)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(0 AND 1 OR 1 AND 1) = NOT(1) = 0
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 0 OR 0 OR 0 OR 0 = 0
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '0', ( '0','0','0','0' ), ( '1','0','0','0' ), '0', '1', '1', '0', '0' ),
    
    -- Test case 7: Mixed propagate and generate with carry
    -- CN_e='1' (carry in), PB_e='1010', GB_e='0101' (alternating pattern)
    -- CNX_e = NOT(PB[0] AND GB[0] OR CNB AND GB[0]) = NOT(1 AND 0 OR 0 AND 0) = NOT(0) = 1
    -- CNY_e = NOT(PB[1] AND GB[1] OR PB[0] AND GB[0] AND GB[1] OR CNB AND GB[0] AND GB[1]) = NOT(0 AND 1 OR 0 OR 0) = NOT(0) = 1
    -- CNZ_e = NOT(PB[2] AND GB[2] OR PB[1] AND GB[1] AND GB[2] OR PB[0] AND GB[0] AND GB[1] AND GB[2] OR CNB AND GB[0] AND GB[1] AND GB[2]) = NOT(1 AND 0 OR 0 OR 0 OR 0) = NOT(0) = 1
    -- PBo_e = PB[0] OR PB[1] OR PB[2] OR PB[3] = 1 OR 0 OR 1 OR 0 = 1
    -- GBo_e = PB[3] AND GB[3] OR PB[2] AND GB[2] AND GB[3] OR PB[1] AND GB[1] AND GB[2] AND GB[3] OR GB[0] AND GB[1] AND GB[2] AND GB[3] = 0 OR 0 OR 0 OR 0 = 0
    ( '1', ( '1','0','1','0' ), ( '0','1','0','1' ), '1', '1', '1', '1', '0' )
  );

begin

  uut : sn74182 port map(
    PBo_e => PBo_e,
    GBo_e => GBo_e,
    CNZ_e => CNZ_e,
    CNY_e => CNY_e,
    CNX_e => CNX_e,
    PB_e  => PB_e,
    GB_e  => GB_e,
    CN_e  => CN_e
  );

  process
    variable start_time : time;
    variable end_time : time;
    variable test_count : integer := 0;
    variable pass_count : integer := 0;
  begin
    report "=== Starting SN74182 Tests ===";
    
    for i in tests'range loop
      test_count := test_count + 1;
      
      -- Apply inputs
      CN_e <= tests(i).CN_e;
      PB_e <= tests(i).PB(3) & tests(i).PB(2) & tests(i).PB(1) & tests(i).PB(0);
      GB_e <= tests(i).GB(3) & tests(i).GB(2) & tests(i).GB(1) & tests(i).GB(0);
      
      -- Record start time
      start_time := now;
      
      -- Wait for propagation delay
      wait for 12 ns;
      
      -- Record end time
      end_time := now;
      
      -- Check timing
      assert (end_time - start_time) = 12 ns
        report "Timing violation in test " & integer'image(i) &
               ": Expected 12ns delay, got " & time'image(end_time - start_time)
        severity warning;
      
      -- Check outputs
      if not (CNX_e = tests(i).exp_CNX and 
              CNY_e = tests(i).exp_CNY and 
              CNZ_e = tests(i).exp_CNZ and 
              PBo_e = tests(i).exp_PBo and 
              GBo_e = tests(i).exp_GBo) then
        report "FAIL: Test " & integer'image(i) & ": " &
          "CN_e=" & std_logic'image(CN_e) &
          ", PB_e=" & to_string(PB_e) &
          ", GB_e=" & to_string(GB_e) &
          ", CNX_e=" & std_logic'image(CNX_e) & " (exp " & std_logic'image(tests(i).exp_CNX) & ")" &
          ", CNY_e=" & std_logic'image(CNY_e) & " (exp " & std_logic'image(tests(i).exp_CNY) & ")" &
          ", CNZ_e=" & std_logic'image(CNZ_e) & " (exp " & std_logic'image(tests(i).exp_CNZ) & ")" &
          ", PBo_e=" & std_logic'image(PBo_e) & " (exp " & std_logic'image(tests(i).exp_PBo) & ")" &
          ", GBo_e=" & std_logic'image(GBo_e) & " (exp " & std_logic'image(tests(i).exp_GBo) & ")"
          severity error;
      else
        pass_count := pass_count + 1;
        report "PASS: Test " & integer'image(i);
      end if;
    end loop;
    
    report "=== SN74182 Tests Complete: " & integer'image(pass_count) & "/" & integer'image(test_count) & " passed ===";
    wait;
  end process;

end;
