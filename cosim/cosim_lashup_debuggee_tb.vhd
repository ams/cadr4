library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cosim_lashup_debuggee_tb is
end entity;

architecture sim of cosim_lashup_debuggee_tb is
    -- Debug interface signals (must match VPI expectations)
    signal \-debug in req\ : std_logic;  -- active low
    signal \debug in ack\ : std_logic;
    signal \debug in a0\ : std_logic;
    signal \debug in a1\ : std_logic;
    signal \debug in wr\ : std_logic;
    
    -- Debug data bus (individual signals as VPI expects)
    signal dbd0, dbd1, dbd2, dbd3, dbd4, dbd5, dbd6, dbd7 : std_logic;
    signal dbd8, dbd9, dbd10, dbd11, dbd12, dbd13, dbd14, dbd15 : std_logic;
    
    -- Simple memory for testing debug reads/writes (4 addresses, 16-bit each)
    type memory_array is array (0 to 3) of std_logic_vector(15 downto 0);
    
    -- Clock signal to keep simulation running
    signal clk : std_logic := '0';
    
begin
    -- Initialize data bus to high impedance
    dbd0 <= 'Z'; dbd1 <= 'Z'; dbd2 <= 'Z'; dbd3 <= 'Z';
    dbd4 <= 'Z'; dbd5 <= 'Z'; dbd6 <= 'Z'; dbd7 <= 'Z';
    dbd8 <= 'Z'; dbd9 <= 'Z'; dbd10 <= 'Z'; dbd11 <= 'Z';
    dbd12 <= 'Z'; dbd13 <= 'Z'; dbd14 <= 'Z'; dbd15 <= 'Z';
    
    -- ACK signal will be driven only by the debug_responder process
    
    -- Asynchronous debug protocol responder - implements 4-address 16-bit memory
    debug_responder: process(\-debug in req\)
        variable addr : integer range 0 to 3;
        variable data_in : std_logic_vector(15 downto 0);
        variable data_out : std_logic_vector(15 downto 0);
        variable debug_memory : memory_array;
    begin
        report "DEBUG PROCESS ENTRY: REQ=" & std_logic'image(\-debug in req\) & 
               " A0=" & std_logic'image(\debug in a0\) & 
               " A1=" & std_logic'image(\debug in a1\) & 
               " WR=" & std_logic'image(\debug in wr\);
        if \-debug in req\ = '0' then -- Request asserted (active low)
            report "REQ is 0 - processing request";
            -- Calculate address from a1, a0 (only 2 bits = 4 addresses)
            addr := to_integer(unsigned(std_logic_vector'(\debug in a1\ & \debug in a0\)));
            
            if \debug in wr\ = '1' then
                -- Write operation: read data from bus and store in memory
                data_in := dbd15 & dbd14 & dbd13 & dbd12 & dbd11 & dbd10 & dbd9 & dbd8 &
                          dbd7 & dbd6 & dbd5 & dbd4 & dbd3 & dbd2 & dbd1 & dbd0;
                debug_memory(addr) := data_in;
                report "Debug WRITE to addr " & integer'image(addr) & " data 0x" & to_hstring(data_in);
                report "Memory contents: [0]=0x" & to_hstring(debug_memory(0)) & 
                       " [1]=0x" & to_hstring(debug_memory(1)) & 
                       " [2]=0x" & to_hstring(debug_memory(2)) & 
                       " [3]=0x" & to_hstring(debug_memory(3));
            else
                -- Read operation: put memory data on bus
                data_out := debug_memory(addr);
                dbd15 <= data_out(15); dbd14 <= data_out(14); dbd13 <= data_out(13); dbd12 <= data_out(12);
                dbd11 <= data_out(11); dbd10 <= data_out(10); dbd9 <= data_out(9); dbd8 <= data_out(8);
                dbd7 <= data_out(7); dbd6 <= data_out(6); dbd5 <= data_out(5); dbd4 <= data_out(4);
                dbd3 <= data_out(3); dbd2 <= data_out(2); dbd1 <= data_out(1); dbd0 <= data_out(0);
                report "Debug READ from addr " & integer'image(addr) & " data 0x" & to_hstring(data_out);
            end if;
            
            -- Assert acknowledge immediately
            \debug in ack\ <= '1';
            report "Debug ACK asserted - scheduling ACK=1";
            
        else
            -- Request deasserted, clear acknowledge and set data bus to high impedance
            \debug in ack\ <= '0';
            report "Debug ACK deasserted - scheduling ACK=0";
            dbd0 <= 'Z'; dbd1 <= 'Z'; dbd2 <= 'Z'; dbd3 <= 'Z';
            dbd4 <= 'Z'; dbd5 <= 'Z'; dbd6 <= 'Z'; dbd7 <= 'Z';
            dbd8 <= 'Z'; dbd9 <= 'Z'; dbd10 <= 'Z'; dbd11 <= 'Z';
            dbd12 <= 'Z'; dbd13 <= 'Z'; dbd14 <= 'Z'; dbd15 <= 'Z';
        end if;
    end process;
    
    -- Clock generator to keep simulation running
    clk <= not clk after 1 ns;
    
end architecture;
