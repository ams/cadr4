library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74182_tb is
end;

architecture testbench of sn74182_tb is

  signal cin_n   : std_logic;
  signal y0      : std_logic;
  signal x0      : std_logic;
  signal cout0_n : std_logic;
  signal y1      : std_logic;
  signal x1      : std_logic;
  signal cout1_n : std_logic;
  signal y2      : std_logic;
  signal x2      : std_logic;
  signal cout2_n : std_logic;
  signal y3      : std_logic;
  signal x3      : std_logic;
  signal yout    : std_logic;
  signal xout    : std_logic;

  type vec4 is array(0 to 3) of std_logic;

  -- Test vector: {cin_n, x0, y0, x1, y1, x2, y2, x3, y3, exp_cout0_n, exp_cout1_n, exp_cout2_n, exp_xout, exp_yout}
  type testvec is record
    cin_n : std_logic;
    x     : vec4;
    y     : vec4;
    exp_cout : vec4; -- [0]=cout0_n, [1]=cout1_n, [2]=cout2_n, [3]=unused
    exp_xout : std_logic;
    exp_yout : std_logic;
  end record;

  type testvec_array is array (natural range <>) of testvec;
  constant tests : testvec_array := (
    -- Test case 1: All propagate, no generate, no carry in
    ( '1', ( '1','1','1','1' ), ( '0','0','0','0' ), ( '0','0','0','0' ), '1', '0' ),
    -- Test case 2: All propagate, carry in
    ( '0', ( '1','1','1','1' ), ( '0','0','0','0' ), ( '1','1','1','1' ), '1', '0' ),
    -- Test case 3: All generate
    ( '1', ( '0','0','0','0' ), ( '1','1','1','1' ), ( '0','0','0','0' ), '0', '1' ),
    -- Test case 6: Partial generate
    ( '1', ( '0','0','0','0' ), ( '1','1','0','0' ), ( '0','0','1','1' ), '0', '0' ),
    -- Test case 8: All inputs high
    ( '1', ( '1','1','1','1' ), ( '1','1','1','1' ), ( '0','0','0','0' ), '1', '1' ),
    -- Test case 10: Single stage generate
    ( '1', ( '0','0','0','0' ), ( '1','0','0','0' ), ( '0','1','1','1' ), '0', '0' ),
    -- Test case 12: Single generate at LSB
    ( '1', ( '0','0','0','0' ), ( '1','0','0','0' ), ( '0','1','1','1' ), '0', '0' )
  );

begin

  uut : sn74182 port map(
    xout => xout,
    yout => yout,
    x3   => x3,
    y3   => y3,
    cout2_n => cout2_n,
    x2      => x2,
    y2      => y2,
    cout1_n => cout1_n,
    x1      => x1,
    y1      => y1,
    cout0_n => cout0_n,
    x0      => x0,
    y0      => y0,
    cin_n => cin_n
  );

  process
    variable start_time : time;
    variable end_time : time;
  begin
    for i in tests'range loop
      -- Apply inputs
      cin_n <= tests(i).cin_n;
      x0 <= tests(i).x(0); y0 <= tests(i).y(0);
      x1 <= tests(i).x(1); y1 <= tests(i).y(1);
      x2 <= tests(i).x(2); y2 <= tests(i).y(2);
      x3 <= tests(i).x(3); y3 <= tests(i).y(3);
      
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
      if not (cout0_n = tests(i).exp_cout(0) and 
              cout1_n = tests(i).exp_cout(1) and 
              cout2_n = tests(i).exp_cout(2) and 
              xout = tests(i).exp_xout and 
              yout = tests(i).exp_yout) then
        report "Test " & integer'image(i) & " failed: " &
          "cin_n=" & std_logic'image(cin_n) &
          ", x0=" & std_logic'image(x0) & ", y0=" & std_logic'image(y0) &
          ", x1=" & std_logic'image(x1) & ", y1=" & std_logic'image(y1) &
          ", x2=" & std_logic'image(x2) & ", y2=" & std_logic'image(y2) &
          ", x3=" & std_logic'image(x3) & ", y3=" & std_logic'image(y3) &
          ", cout0_n=" & std_logic'image(cout0_n) & " (exp " & std_logic'image(tests(i).exp_cout(0)) & ")" &
          ", cout1_n=" & std_logic'image(cout1_n) & " (exp " & std_logic'image(tests(i).exp_cout(1)) & ")" &
          ", cout2_n=" & std_logic'image(cout2_n) & " (exp " & std_logic'image(tests(i).exp_cout(2)) & ")" &
          ", xout=" & std_logic'image(xout) & " (exp " & std_logic'image(tests(i).exp_xout) & ")" &
          ", yout=" & std_logic'image(yout) & " (exp " & std_logic'image(tests(i).exp_yout) & ")"
          severity error;
      end if;
    end loop;
    wait;
  end process;

end;
