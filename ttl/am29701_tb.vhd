library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.amd.all;

entity am29701_tb is
end entity;

architecture testbench of am29701_tb is

  -- Signals for UUT
  signal s_i1      : std_logic := '0';
  signal s_i2      : std_logic := '0';
  signal s_i3      : std_logic := '0';
  signal s_i4      : std_logic := '0';
  signal s_o1      : std_logic;
  signal s_o2      : std_logic;
  signal s_o3      : std_logic;
  signal s_o4      : std_logic;
  signal s_a0      : std_logic := '0';
  signal s_a1      : std_logic := '0';
  signal s_a2      : std_logic := '0';
  signal s_a3      : std_logic := '0';
  signal s_write_n : std_logic := '1';
  signal s_ce_n    : std_logic := '1';

begin

  uut : am29701 port map(
    i1      => s_i1,
    i2      => s_i2,
    i3      => s_i3,
    i4      => s_i4,
    o1      => s_o1,
    o2      => s_o2,
    o3      => s_o3,
    o4      => s_o4,
    a0      => s_a0,
    a1      => s_a1,
    a2      => s_a2,
    a3      => s_a3,
    write_n => s_write_n,
    ce_n    => s_ce_n
  );

  test_proc: process
    type test_pattern is record
      addr : std_logic_vector(3 downto 0);
      data : std_logic_vector(3 downto 0);
    end record;
    
    type test_array is array (natural range <>) of test_pattern;
    
    constant test_data : test_array := (
      ("0000", "0001"),  -- Address 0, Data 1
      ("0001", "0010"),  -- Address 1, Data 2
      ("0010", "0100"),  -- Address 2, Data 4
      ("0011", "1000"),  -- Address 3, Data 8
      ("0100", "0011"),  -- Address 4, Data 3
      ("0101", "0101"),  -- Address 5, Data 5
      ("0110", "1001"),  -- Address 6, Data 9
      ("0111", "1100"),  -- Address 7, Data 12
      ("1000", "1111"),  -- Address 8, Data 15
      ("1001", "1010"),  -- Address 9, Data 10
      ("1010", "0110"),  -- Address 10, Data 6
      ("1011", "1101"),  -- Address 11, Data 13
      ("1100", "0111"),  -- Address 12, Data 7
      ("1101", "1110"),  -- Address 13, Data 14
      ("1110", "1011"),  -- Address 14, Data 11
      ("1111", "0000")   -- Address 15, Data 0
    );
    
    variable addr_vec : std_logic_vector(3 downto 0);
    variable data_vec : std_logic_vector(3 downto 0);
    variable expected_data : std_logic_vector(3 downto 0);
    
  begin
    -- Test 1: Verify chip is disabled initially (high-Z outputs)
    report "Test 1: Chip disable test";
    s_ce_n <= '1';
    s_write_n <= '1';
    s_a3 <= '0'; s_a2 <= '0'; s_a1 <= '0'; s_a0 <= '0';
    wait for 10 ns;
    assert s_o1 = 'Z' and s_o2 = 'Z' and s_o3 = 'Z' and s_o4 = 'Z'
      report "FAIL: Outputs should be high-Z when chip is disabled" severity error;
    
    -- Test 2: Write data to all addresses
    report "Test 2: Writing test patterns to all addresses";
    s_ce_n <= '0';  -- Enable chip
    
    for i in test_data'range loop
      addr_vec := test_data(i).addr;
      data_vec := test_data(i).data;
      
      -- Set address
      s_a3 <= addr_vec(3);
      s_a2 <= addr_vec(2);
      s_a1 <= addr_vec(1);
      s_a0 <= addr_vec(0);
      
      -- Set data inputs
      s_i4 <= data_vec(3);
      s_i3 <= data_vec(2);
      s_i2 <= data_vec(1);
      s_i1 <= data_vec(0);
      
      -- Write enable
      s_write_n <= '0';
      wait for 5 ns;
      s_write_n <= '1';
      wait for 5 ns;
      
      report "Written " & to_string(data_vec) & " to address " & to_string(addr_vec);
    end loop;
    
    -- Test 3: Read back data from all addresses
    report "Test 3: Reading back data from all addresses";
    s_write_n <= '1';  -- Disable write
    
    for i in test_data'range loop
      addr_vec := test_data(i).addr;
      expected_data := test_data(i).data;
      
      -- Set address
      s_a3 <= addr_vec(3);
      s_a2 <= addr_vec(2);
      s_a1 <= addr_vec(1);
      s_a0 <= addr_vec(0);
      
      wait for 10 ns;
      
      -- Check outputs
      data_vec := std_logic_vector'(s_o4 & s_o3 & s_o2 & s_o1);
      
      if data_vec = expected_data then
        report "PASS: Address " & to_string(addr_vec) & " = " & to_string(data_vec);
      else
        report "FAIL: Address " & to_string(addr_vec) & 
               " expected " & to_string(expected_data) & 
               " got " & to_string(data_vec) severity error;
      end if;
    end loop;
    
    -- Test 4: Test write protection when write_n is high
    report "Test 4: Write protection test";
    s_a3 <= '0'; s_a2 <= '0'; s_a1 <= '0'; s_a0 <= '0';  -- Address 0
    s_i4 <= '1'; s_i3 <= '0'; s_i2 <= '1'; s_i1 <= '0';  -- Try to write 1010
    s_write_n <= '1';  -- Write disabled
    wait for 10 ns;
    
    -- Data should still be the original value (0001)
    data_vec := std_logic_vector'(s_o4 & s_o3 & s_o2 & s_o1);
    if data_vec = "0001" then
      report "PASS: Write protection working";
    else
      report "FAIL: Write protection not working, data changed to " & to_string(data_vec) severity error;
    end if;
    
    -- Test 5: Test chip disable during read
    report "Test 5: Chip disable during read test";
    s_a3 <= '1'; s_a2 <= '0'; s_a1 <= '0'; s_a0 <= '0';  -- Address 8
    s_ce_n <= '0';
    wait for 5 ns;
    assert std_logic_vector'(s_o4 & s_o3 & s_o2 & s_o1) = "1111" report "Setup failed" severity error;
    
    s_ce_n <= '1';  -- Disable chip
    wait for 10 ns;
    assert s_o1 = 'Z' and s_o2 = 'Z' and s_o3 = 'Z' and s_o4 = 'Z'
      report "FAIL: Outputs should be high-Z when chip is disabled during read" severity error;
    
    -- Test 6: Test rapid address changes
    report "Test 6: Rapid address changes test";
    s_ce_n <= '0';  -- Enable chip
    s_write_n <= '1';  -- Read mode
    
    for addr in 0 to 15 loop
      addr_vec := std_logic_vector(to_unsigned(addr, 4));
      s_a3 <= addr_vec(3);
      s_a2 <= addr_vec(2);
      s_a1 <= addr_vec(1);
      s_a0 <= addr_vec(0);
      wait for 2 ns;
      
      -- Verify the data matches what we wrote
      data_vec := std_logic_vector'(s_o4 & s_o3 & s_o2 & s_o1);
      expected_data := test_data(addr).data;
      
      assert data_vec = expected_data
        report "FAIL: Rapid read at address " & integer'image(addr) & 
               " expected " & to_string(expected_data) & 
               " got " & to_string(data_vec) severity error;
    end loop;
    
    report "Test completed";
    wait;
  end process;

end;
