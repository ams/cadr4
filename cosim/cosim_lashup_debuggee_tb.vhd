library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cosim_lashup_debuggee_tb is
end entity;

architecture sim of cosim_lashup_debuggee_tb is
    -- Clock and reset
    signal clk : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    -- Debug interface signals (must match VPI expectations)
    signal \-debug in req\ : std_logic := '1';  -- active low
    signal \debug in ack\ : std_logic := '0';
    signal \debug in a0\ : std_logic := '0';
    signal \debug in a1\ : std_logic := '0';
    signal \debug in wr\ : std_logic := '0';
    
    -- Debug data bus (individual signals as VPI expects)
    signal dbd0, dbd1, dbd2, dbd3, dbd4, dbd5, dbd6, dbd7 : std_logic := 'Z';
    signal dbd8, dbd9, dbd10, dbd11, dbd12, dbd13, dbd14, dbd15 : std_logic := 'Z';
    
    -- Internal signals for simulation
    signal sim_running : boolean := true;
    
    -- Simple memory for testing debug reads/writes (4 addresses, 16-bit each)
    type memory_array is array (0 to 3) of std_logic_vector(15 downto 0);
    signal debug_memory : memory_array := (
        0 => x"0000",
        1 => x"1111", 
        2 => x"2222",
        3 => x"3333"
    );
    
    -- Debug protocol state machine
    type debug_state_type is (IDLE, PROCESS_REQ, SEND_ACK, WAIT_REQ_RELEASE);
    signal debug_state : debug_state_type := IDLE;
    
begin
    -- Clock generation
    clk <= not clk after 5 ns when sim_running else '0';
    
    -- Reset generation
    reset_n <= '0', '1' after 100 ns;
    
    -- Debug protocol responder - implements 4-address 16-bit memory
    debug_responder: process(clk, reset_n)
        variable addr : integer range 0 to 3;
        variable data_in : std_logic_vector(15 downto 0);
        variable data_out : std_logic_vector(15 downto 0);
    begin
        if reset_n = '0' then
            \debug in ack\ <= '0';
            debug_state <= IDLE;
            -- Set data bus to high impedance
            dbd0 <= 'Z'; dbd1 <= 'Z'; dbd2 <= 'Z'; dbd3 <= 'Z';
            dbd4 <= 'Z'; dbd5 <= 'Z'; dbd6 <= 'Z'; dbd7 <= 'Z';
            dbd8 <= 'Z'; dbd9 <= 'Z'; dbd10 <= 'Z'; dbd11 <= 'Z';
            dbd12 <= 'Z'; dbd13 <= 'Z'; dbd14 <= 'Z'; dbd15 <= 'Z';
            
        elsif rising_edge(clk) then
            case debug_state is
                when IDLE =>
                    \debug in ack\ <= '0';
                    -- Set data bus to high impedance during idle
                    dbd0 <= 'Z'; dbd1 <= 'Z'; dbd2 <= 'Z'; dbd3 <= 'Z';
                    dbd4 <= 'Z'; dbd5 <= 'Z'; dbd6 <= 'Z'; dbd7 <= 'Z';
                    dbd8 <= 'Z'; dbd9 <= 'Z'; dbd10 <= 'Z'; dbd11 <= 'Z';
                    dbd12 <= 'Z'; dbd13 <= 'Z'; dbd14 <= 'Z'; dbd15 <= 'Z';
                    
                    if \-debug in req\ = '0' then -- Request asserted (active low)
                        report "Debug request detected, transitioning to PROCESS_REQ";
                        debug_state <= PROCESS_REQ;
                    end if;
                    
                when PROCESS_REQ =>
                    -- Calculate address from a1, a0 (only 2 bits = 4 addresses)
                    addr := to_integer(unsigned(std_logic_vector'(\debug in a1\ & \debug in a0\)));
                    
                    if \debug in wr\ = '1' then
                        -- Write operation: read data from bus and store in memory
                        data_in := dbd15 & dbd14 & dbd13 & dbd12 & dbd11 & dbd10 & dbd9 & dbd8 &
                                  dbd7 & dbd6 & dbd5 & dbd4 & dbd3 & dbd2 & dbd1 & dbd0;
                        debug_memory(addr) <= data_in;
                        report "Debug WRITE to addr " & integer'image(addr) & " data 0x" & to_hstring(data_in);
                    else
                        -- Read operation: put memory data on bus
                        data_out := debug_memory(addr);
                        dbd15 <= data_out(15); dbd14 <= data_out(14); dbd13 <= data_out(13); dbd12 <= data_out(12);
                        dbd11 <= data_out(11); dbd10 <= data_out(10); dbd9 <= data_out(9); dbd8 <= data_out(8);
                        dbd7 <= data_out(7); dbd6 <= data_out(6); dbd5 <= data_out(5); dbd4 <= data_out(4);
                        dbd3 <= data_out(3); dbd2 <= data_out(2); dbd1 <= data_out(1); dbd0 <= data_out(0);
                        report "Debug READ from addr " & integer'image(addr) & " data 0x" & to_hstring(data_out);
                    end if;
                    
                    debug_state <= SEND_ACK;
                    
                when SEND_ACK =>
                    -- Assert acknowledge
                    \debug in ack\ <= '1';
                    report "Debug ACK asserted";
                    debug_state <= WAIT_REQ_RELEASE;
                    
                when WAIT_REQ_RELEASE =>
                    -- Wait for request to be released
                    if \-debug in req\ = '1' then -- Request deasserted
                        \debug in ack\ <= '0';
                        debug_state <= IDLE;
                    end if;
            end case;
        end if;
    end process;
    
    -- Simulation control - run for a longer time to allow UDP debugging
    sim_control: process
    begin
        wait for 60 sec;  -- Run simulation for 60 seconds to allow manual UDP testing
        sim_running <= false;
        report "Simulation completed after 60 seconds" severity note;
        wait;
    end process;
    
    -- Memory status reporter (optional - reports memory contents periodically)
    memory_reporter: process
    begin
        wait until reset_n = '1';
        wait for 1 ms;  -- Initial delay
        
        while sim_running loop
            report "Memory contents: [0]=0x" & to_hstring(debug_memory(0)) & 
                   " [1]=0x" & to_hstring(debug_memory(1)) & 
                   " [2]=0x" & to_hstring(debug_memory(2)) & 
                   " [3]=0x" & to_hstring(debug_memory(3));
            wait for 10 sec;  -- Report every 10 seconds
        end loop;
        wait;
    end process;
    
end architecture;
