#include <vpi_user.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <errno.h>

#define BUFFER_SIZE 256
#define UDP_PORT 12345

// Global state
static int sockfd = -1;
static struct sockaddr_in servaddr, cliaddr;
static socklen_t cliaddr_len = sizeof(cliaddr);
static char pending_response[BUFFER_SIZE] = {0};
static int has_pending_response = 0;

// Simple flags for debug operation
static int debug_transaction_pending = 0;

// VPI handles for debug interface
static vpiHandle debug_req_n_h, debug_ack_h, debug_a0_h, debug_a1_h, debug_wr_h;
static vpiHandle dbd_h[16];

// Forward declarations
static void register_callback();
PLI_INT32 process_udp_commands_cb(p_cb_data cb_data);
PLI_INT32 check_transaction_completion_cb(p_cb_data cb_data);

// Terminate simulation with error
static void terminate_simulation_with_error(const char* error_msg) {
    vpi_printf("CRITICAL ERROR: %s\n", error_msg);
    vpi_printf("Terminating simulation with error code 1\n");
    vpi_control(vpiFinish, 1);
}

// Helper functions
static vpiHandle get_handle(const char *name) {

    vpiHandle handle = vpi_handle_by_name((char*)name, NULL);

    if (!handle) {
        char error_msg[256];
        sprintf(error_msg, "Cannot find VPI handle for signal '%s'", name);
        terminate_simulation_with_error(error_msg);
        return NULL;
    }
    
    return handle;
}

static PLI_INT32 read_scalar(vpiHandle handle) {
    s_vpi_value value_s;
    value_s.format = vpiIntVal;
    vpi_get_value(handle, &value_s);
    return value_s.value.integer;
}

static void write_scalar(vpiHandle handle, PLI_INT32 val) {
    s_vpi_value value_s;
    value_s.format = vpiIntVal;
    value_s.value.integer = val;
    vpi_put_value(handle, &value_s, NULL, vpiNoDelay);
}

PLI_INT32 callback(p_cb_data cb_data) {
    check_transaction_completion_cb(cb_data);
    process_udp_commands_cb(cb_data);
    register_callback();
    return 0;
}

// Helper function to register callback
static void register_callback() {
    
    s_cb_data cb_data;

    /*
    s_vpi_time time_s;    
    time_s.type = vpiSimTime;
    time_s.high = 0;
    time_s.low = 0;
    time_s.real = 0.0;
    */
    
    cb_data.reason = cbNextSimTime;
    cb_data.cb_rtn = callback;
    cb_data.obj = NULL;
    cb_data.time = NULL; //&time_s;
    cb_data.value = NULL;
    cb_data.user_data = NULL;
    
    vpiHandle cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        terminate_simulation_with_error("Failed to register callback");
    }
}

// Initialize UDP socket
static void init_udp_socket() {
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);

    if (sockfd < 0) {
        terminate_simulation_with_error("UDP socket creation failed");
        return;
    }
    
    // Set socket to non-blocking
    int flags = fcntl(sockfd, F_GETFL, 0);
    fcntl(sockfd, F_SETFL, flags | O_NONBLOCK);
    
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = INADDR_ANY;
    servaddr.sin_port = htons(UDP_PORT);
    
    // Try to bind to the specified port first
    if (bind(sockfd, (const struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {

        // If that fails, try dynamic port allocation
        servaddr.sin_port = 0;  // Let OS choose port

        if (bind(sockfd, (const struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
            close(sockfd);
            terminate_simulation_with_error("UDP socket bind failed for both fixed and dynamic ports");
            return;
        }
        
        // Get the actual port number assigned by OS
        socklen_t addr_len = sizeof(servaddr);

        if (getsockname(sockfd, (struct sockaddr *)&servaddr, &addr_len) < 0) {
            close(sockfd);
            terminate_simulation_with_error("Failed to get socket name");
            return;
        }
        
        int actual_port = ntohs(servaddr.sin_port);

        vpi_printf("UDP server listening on dynamically assigned port %d\n", actual_port);

    } else {

        vpi_printf("UDP server listening on port %d\n", UDP_PORT);

    }
}

// Process incoming UDP commands (called in cbReadWriteSynch)
PLI_INT32 process_udp_commands_cb(p_cb_data cb_data) {
    (void)cb_data;
    
    if (sockfd < 0) return 0;
    
        // Check for new UDP commands if no transaction is pending
    if (!debug_transaction_pending) {

        char buffer[BUFFER_SIZE];
        ssize_t n = recvfrom(sockfd, buffer, BUFFER_SIZE-1, 0, 
                           (struct sockaddr *)&cliaddr, &cliaddr_len);
        
        if (n > 0) {
            buffer[n] = '\0';
            vpi_printf("Received UDP command: %s\n", buffer);
            
            char command;
            int address, data;
            int parse_result;
            int is_write = 0;
            
            if (buffer[0] == 'R') {

                parse_result = sscanf(buffer, "%c %x", &command, &address);

                if (parse_result != 2) {
                    strcpy(pending_response, "2 Invalid read command format");
                    has_pending_response = 1;
                    return 0;
                }

                is_write = 0;
                data = 0;

            } else if (buffer[0] == 'W') {

                parse_result = sscanf(buffer, "%c %x %x", &command, &address, &data);

                if (parse_result != 3) {
                    strcpy(pending_response, "3 Invalid write command format");
                    has_pending_response = 1;
                    return 0;
                }

                is_write = 1;

            } else {

                strcpy(pending_response, "1 Unknown command");
                has_pending_response = 1;
                return 0;

            }
            
            // Perform debug transaction immediately
            vpi_printf("Performing %s transaction, addr=0x%X, data=0x%X\n", 
                      is_write ? "WRITE" : "READ", address, data);
            
            // Set address and write flag
            write_scalar(debug_a0_h, address & 1);
            write_scalar(debug_a1_h, (address >> 1) & 1);
            write_scalar(debug_wr_h, is_write);
            
            // Set data bus for write operations, or set to Z for read operations
            if (is_write) {

                for (int i = 0; i < 16; i++) {
                    write_scalar(dbd_h[i], (data >> i) & 1);
                }

            } else {

                // For read operations, set data bus to high impedance (Z)
                s_vpi_value value_s;
                value_s.format = vpiScalarVal;
                value_s.value.scalar = vpiZ;

                for (int i = 0; i < 16; i++) {
                    vpi_put_value(dbd_h[i], &value_s, NULL, vpiNoDelay);
                }

            }
            
            // Assert debug request (active low)
            write_scalar(debug_req_n_h, 0);
            debug_transaction_pending = 1;
            vpi_printf("Debug request asserted\n");
        }
    }
    
    return 0;
}

// Check for transaction completion (called in cbReadOnlySynch)
PLI_INT32 check_transaction_completion_cb(p_cb_data cb_data) {
    (void)cb_data;
    
    // Check if pending transaction completed
    if (debug_transaction_pending && read_scalar(debug_ack_h)) {
        vpi_printf("Debug ACK received\n");
        
        // Read data from bus for read operations
        int read_data = 0;
        int is_read_op = !read_scalar(debug_wr_h);

        if (is_read_op) {  // Read operation

            // Use vpi_get_value with vpiNoDelay to get current driven values
            s_vpi_value value_s;

            for (int i = 0; i < 16; i++) {
                value_s.format = vpiIntVal;
                vpi_get_value(dbd_h[i], &value_s);

                if (value_s.value.integer == 1) {
                    read_data |= (1 << i);
                }

            }

            vpi_printf("Read data bits from bus: 0x%X\n", read_data);
        }
        
        // Deassert debug request
        write_scalar(debug_req_n_h, 1);
        
        // Don't release forced signals immediately - let them stay forced
        // The signals will be released when the transaction completes
        
        debug_transaction_pending = 0;
        
        // Prepare response
        if (!is_read_op) {  // Write operation

            sprintf(pending_response, "0");
            vpi_printf("Write complete, prepared response: '0'\n");

        } else {  // Read operation

            sprintf(pending_response, "0 %X", read_data);
            vpi_printf("Read complete, prepared response: '0 %X'\n", read_data);

        }

        has_pending_response = 1;
    }
    
    // Send pending UDP responses
    if (has_pending_response) {

        sendto(sockfd, pending_response, strlen(pending_response), 0,
               (const struct sockaddr *)&cliaddr, cliaddr_len);

        vpi_printf("Sent UDP response: %s\n", pending_response);
        
        // Clear the response
        pending_response[0] = '\0';
        has_pending_response = 0;
    }
    
    return 0;
}

// Helper function to search module names and return first found testbench or NULL
static vpiHandle find_testbench_handle(const char** testbench_names, char** found_name) {

    vpiHandle iter = vpi_iterate(vpiModule, NULL);

    if (!iter) {
        vpi_printf("No modules found in design\n");
        return NULL;
    }
    
    vpiHandle mod;

    while ((mod = vpi_scan(iter)) != NULL) {

        char* mod_name = vpi_get_str(vpiName, mod);

        vpi_printf("Found module: %s\n", mod_name ? mod_name : "(NULL)");
        
        // Check if this matches any of our expected testbench names
        for (int i = 0; testbench_names[i] != NULL; i++) {

            if (mod_name && strcmp(mod_name, testbench_names[i]) == 0) {
                *found_name = mod_name;
                vpi_printf("Found matching testbench: %s\n", mod_name);
                return mod;
            }

        }
    }
    
    // No matching testbench found
    vpi_printf("No matching testbench found\n");

    return NULL;
}

// Initialize VPI handles and UDP socket
PLI_INT32 start_of_simulation_cb(p_cb_data cb_data) {
    (void)cb_data;
    
    // Get VPI handles for debug interface - determine testbench name dynamically
    char* tb_name = NULL;
    vpiHandle test_handle = NULL;
    
    // Expected testbench names
    const char* testbench_names[] = {
        "cadr_tb",
        "cosim_lashup_debuggee_tb",
        NULL
    };
    
    // Try to find the testbench by iterating through modules

    test_handle = find_testbench_handle(testbench_names, &tb_name);
    
    if (!test_handle || !tb_name) {
        vpi_printf("No testbench found, terminating simulation\n");
        vpi_control(vpiFinish, 1);
        return 0;
    }
    
    vpi_printf("Debugger is attached to %s\n", tb_name);

    char signal_path[256];
    
    // Set up debuggee_tb debug interface signals
    sprintf(signal_path, "%s.\\-debug in req\\", tb_name);
    debug_req_n_h = get_handle(signal_path);
    vpi_printf("Found signal: %s\n", signal_path);
    
    sprintf(signal_path, "%s.\\debug in ack\\", tb_name);
    debug_ack_h = get_handle(signal_path);
    vpi_printf("Found signal: %s\n", signal_path);
    
    sprintf(signal_path, "%s.\\debug in a0\\", tb_name);
    debug_a0_h = get_handle(signal_path);
    vpi_printf("Found signal: %s\n", signal_path);
    
    sprintf(signal_path, "%s.\\debug in a1\\", tb_name);
    debug_a1_h = get_handle(signal_path);
    vpi_printf("Found signal: %s\n", signal_path);
    
    sprintf(signal_path, "%s.\\debug in wr\\", tb_name);
    debug_wr_h = get_handle(signal_path);
    vpi_printf("Found signal: %s\n", signal_path);
    
    // Get debug data bus handles
    for (int i = 0; i < 16; i++) {
        sprintf(signal_path, "%s.dbd%d", tb_name, i);
        dbd_h[i] = get_handle(signal_path);
        vpi_printf("Found signal: %s\n", signal_path);
    }
    
    // Initialize UDP socket
    init_udp_socket();
    
    // Register synchronization callbacks
    s_cb_data cb_data_s;
    
    register_callback();
    
    return 0;
}

// Cleanup on simulation end
PLI_INT32 end_of_simulation_cb(p_cb_data cb_data) {
    (void)cb_data;
    
    if (sockfd >= 0) {
        close(sockfd);
        sockfd = -1;
        vpi_printf("UDP socket closed\n");
    }
    
    return 0;
}

void register_vpi_callbacks() {

    s_cb_data cb_data;
    vpiHandle cb_handle;
    
    cb_data.reason = cbStartOfSimulation;
    cb_data.cb_rtn = start_of_simulation_cb;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        terminate_simulation_with_error("Failed to register start of simulation callback");
    }
    
    cb_data.reason = cbEndOfSimulation;
    cb_data.cb_rtn = end_of_simulation_cb;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        terminate_simulation_with_error("Failed to register end of simulation callback");
    }
}

void (*vlog_startup_routines[])() = {
    register_vpi_callbacks,
    NULL
};