library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

library work;
use work.icmem_book.all;
use work.misc.all;

entity cadr_prom_tb is
end entity;

architecture testbench of cadr_prom_tb is
  -- Address signals
  signal pc0, pc1, pc2, pc3, pc4 : std_logic;
  signal pc5, pc6, pc7, pc8, pc9 : std_logic;
  
  -- PROM outputs (shared between PROM0 and PROM1 since only one is enabled at a time)
  signal i0, i1, i2, i3, i4, i5, i6, i7 : std_logic;
  signal i8, i9, i10, i11, i12, i13, i14, i15 : std_logic;
  signal i16, i17, i18, i19, i20, i21, i22, i23 : std_logic;
  signal i24, i25, i26, i27, i28, i29, i30, i31 : std_logic;
  signal i32, i33, i34, i35, i36, i37, i38, i39 : std_logic;
  signal i40, i41, i42, i43, i44, i45, i47, i48 : std_logic;
  
  -- Combined 48-bit output (i46 is missing)
  signal prom_data : std_logic_vector(47 downto 0);
  
  -- Address vector (9-bit for each PROM)
  signal address : std_logic_vector(8 downto 0);
  
  -- Load reference data as constant
  constant reference_rom : std_logic_vector := load_rom_file("rom/promh.mcr.9.hex");
  constant rom_bytes : integer := reference_rom'length / 8;  -- Number of bytes in file
  constant rom_words : integer := rom_bytes / 6;  -- Number of 48-bit words (6 bytes each, since 2724/6=454)
  
begin
  -- Instantiate PROM0 (first 512 entries)
  prom0_inst : cadr_prom0
    port map (
      \-prompc0\ => not pc0,
      \-prompc1\ => not pc1,
      \-prompc2\ => not pc2,
      \-prompc3\ => not pc3,
      \-prompc4\ => not pc4,
      \-prompc5\ => not pc5,
      \-prompc6\ => not pc6,
      \-prompc7\ => not pc7,
      \-prompc8\ => not pc8,
      \-promce0\ => pc9,
      i0 => i0, i1 => i1, i2 => i2, i3 => i3,
      i4 => i4, i5 => i5, i6 => i6, i7 => i7,
      i8 => i8, i9 => i9, i10 => i10, i11 => i11,
      i12 => i12, i13 => i13, i14 => i14, i15 => i15,
      i16 => i16, i17 => i17, i18 => i18, i19 => i19,
      i20 => i20, i21 => i21, i22 => i22, i23 => i23,
      i24 => i24, i25 => i25, i26 => i26, i27 => i27,
      i28 => i28, i29 => i29, i30 => i30, i31 => i31,
      i32 => i32, i33 => i33, i34 => i34, i35 => i35,
      i36 => i36, i37 => i37, i38 => i38, i39 => i39,
      i40 => i40, i41 => i41, i42 => i42, i43 => i43,
      i44 => i44, i45 => i45, i47 => i47, i48 => i48
    );
  
  -- Instantiate PROM1 (second 512 entries)
  prom1_inst : cadr_prom1
    port map (
      \-prompc0\ => not pc0,
      \-prompc1\ => not pc1,
      \-prompc2\ => not pc2,
      \-prompc3\ => not pc3,
      \-prompc4\ => not pc4,
      \-prompc5\ => not pc5,
      \-prompc6\ => not pc6,
      \-prompc7\ => not pc7,
      \-prompc8\ => not pc8,
      \-promce1\ => not pc9,
      i0 => i0, i1 => i1, i2 => i2, i3 => i3,
      i4 => i4, i5 => i5, i6 => i6, i7 => i7,
      i8 => i8, i9 => i9, i10 => i10, i11 => i11,
      i12 => i12, i13 => i13, i14 => i14, i15 => i15,
      i16 => i16, i17 => i17, i18 => i18, i19 => i19,
      i20 => i20, i21 => i21, i22 => i22, i23 => i23,
      i24 => i24, i25 => i25, i26 => i26, i27 => i27,
      i28 => i28, i29 => i29, i30 => i30, i31 => i31,
      i32 => i32, i33 => i33, i34 => i34, i35 => i35,
      i36 => i36, i37 => i37, i38 => i38, i39 => i39,
      i40 => i40, i41 => i41, i42 => i42, i43 => i43,
      i44 => i44, i45 => i45, i47 => i47, i48 => i48
    );
  
  -- Combine individual signals into vector for easier handling
  prom_data <= i48 & i47 & i45 & i44 & i43 & i42 & i41 & i40 &
               i39 & i38 & i37 & i36 & i35 & i34 & i33 & i32 &
               i31 & i30 & i29 & i28 & i27 & i26 & i25 & i24 &
               i23 & i22 & i21 & i20 & i19 & i18 & i17 & i16 &
               i15 & i14 & i13 & i12 & i11 & i10 & i9 & i8 &
               i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;
  

  
  -- Test process
  test_proc : process
    variable addr_vec : std_logic_vector(9 downto 0);  -- 10-bit address for full space
    variable expected_data : std_logic_vector(47 downto 0);
    variable actual_data : std_logic_vector(47 downto 0);
    variable error_count : integer := 0;
    variable ref_entry : integer;
    
  begin
         -- Report loaded data info
     report "Loaded " & integer'image(rom_bytes) & " bytes (" & integer'image(rom_words) & " words) from rom/promh.mcr.9.hex";
    
    -- Test PROM system against reference data
    report "Testing CADR PROM system against reference data...";
    
    -- Test full 1024-address space (addresses 0-1023)
    -- Bit 9 (10th bit) naturally selects PROM: 0-511 -> PROM0, 512-1023 -> PROM1
    report "Testing full PROM address space (0-1023)...";
    
    for pc_val in 0 to 1023 loop  -- Iterate through pc values (reference data addresses)
      -- Set full 10-bit pc value (pc9 is bit 9, pc0-pc8 are bits 0-8)
      addr_vec := std_logic_vector(to_unsigned(pc_val, 10));
      pc0 <= addr_vec(0); pc1 <= addr_vec(1); pc2 <= addr_vec(2);
      pc3 <= addr_vec(3); pc4 <= addr_vec(4); pc5 <= addr_vec(5);
      pc6 <= addr_vec(6); pc7 <= addr_vec(7); pc8 <= addr_vec(8);
      pc9 <= addr_vec(9);  -- Bit 9 selects PROM (0=PROM0, 1=PROM1)
      wait for 10 ns;
      
      actual_data := prom_data;
      
      -- pc_val is directly the reference data index
      ref_entry := pc_val;
      
      -- Get expected data from reference (if available)
      if ref_entry < rom_words then
        -- Extract 48-bit entry from flat vector (6 bytes per entry, MSB first)
        expected_data := reference_rom(ref_entry*48+47 downto ref_entry*48);
        
        -- Compare actual vs expected
        if actual_data /= expected_data then
          if pc9 = '0' then
            report "PROM0 pc=" & to_ostring(to_unsigned(pc_val, 16)) & 
                   " (ref[" & to_ostring(to_unsigned(ref_entry, 16)) & "]): expected " & to_ostring(expected_data) & 
                   " (0x" & to_hstring(expected_data) & "), got " & to_ostring(actual_data) & 
                   " (0x" & to_hstring(actual_data) & ")"
              severity error;
          else
            report "PROM1 pc=" & to_ostring(to_unsigned(pc_val, 16)) & 
                   " (ref[" & to_ostring(to_unsigned(ref_entry, 16)) & "]): expected " & 
                   to_ostring(expected_data) & " (0x" & to_hstring(expected_data) & "), got " & 
                   to_ostring(actual_data) & " (0x" & to_hstring(actual_data) & ")"
              severity error;
          end if;
          error_count := error_count + 1;
        end if;
      else
        -- Address beyond reference data should be zero
        expected_data := (others => '0');
        -- because all zeroes have parity 1
        expected_data(47) := '1';
        if actual_data /= expected_data then
          report "PC " & to_ostring(to_unsigned(pc_val, 16)) & 
                 " should output zero (beyond reference data), expected " & to_ostring(expected_data) & 
                 " (0x" & to_hstring(expected_data) & "), got " & to_ostring(actual_data) & 
                 " (0x" & to_hstring(actual_data) & ")"
            severity error;
          error_count := error_count + 1;
        end if;
      end if;
    end loop;
    
    -- Report results
    if error_count = 0 then
      report "PROM testbench completed successfully - all data matches reference!";
    else
      report "PROM testbench completed with " & integer'image(error_count) & " errors";
    end if;
    
    wait;
  end process;
  
end architecture; 