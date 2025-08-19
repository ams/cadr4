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

// Debug transaction state machine
typedef enum {
    DEBUG_IDLE = 0,
    DEBUG_WAITING_ACK = 1,
    DEBUG_READING_RESPONSE = 2,
    DEBUG_SENDING_UDP = 3
} debug_state_t;

static debug_state_t debug_state = DEBUG_IDLE;

// VPI handles for debug interface
static vpiHandle debug_req_n_h, debug_ack_h, debug_a0_h, debug_a1_h, debug_wr_h;
static vpiHandle dbd_h[16];

// Forward declarations
static void register_rw_callback();
void process_udp_commands(p_cb_data cb_data);
void read_debug_response();
void check_for_ack();
void send_udp_response(p_cb_data cb_data);

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

PLI_INT32 main_callback(p_cb_data cb_data) {
    while (1) {
        debug_state_t old_state = debug_state;
        
        switch (debug_state) {
            case DEBUG_IDLE:
                process_udp_commands(cb_data);
                break;
                
            case DEBUG_WAITING_ACK:
                if (read_scalar(debug_ack_h) == 1) {
                    debug_state = DEBUG_READING_RESPONSE;
                }
                break;
                
            case DEBUG_READING_RESPONSE:
                read_debug_response();
                break;
                
            case DEBUG_SENDING_UDP:
                send_udp_response(cb_data);
                break;
        }
        
        // Special case: IDLE→WAITING_ACK needs a pause for VHDL to see signal changes
        if (old_state == DEBUG_IDLE && debug_state == DEBUG_WAITING_ACK) {
            break; // Wait for next callback to let VHDL respond
        }
        
        // For all other cases: if no state change, wait for next callback
        if (debug_state == old_state) {
            break;
        }
        
        // State changed and it's safe to continue - loop again
    }
    
    // Re-register callback for next cycle
    register_rw_callback();
    return 0;
}

// Helper function to register read-write callback
static void register_rw_callback() {
    s_cb_data cb_data;
    s_vpi_time time_s;    
    time_s.type = vpiSimTime;
    time_s.high = 0;
    time_s.low = 0;
    time_s.real = 0.0;
    
    cb_data.reason = cbReadWriteSynch;
    cb_data.cb_rtn = main_callback;
    cb_data.obj = NULL;
    cb_data.time = &time_s;
    cb_data.value = NULL;
    cb_data.user_data = NULL;
    
    vpiHandle cb_handle = vpi_register_cb(&cb_data);
    if (!cb_handle) {
        terminate_simulation_with_error("Failed to register read-write callback");
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

    char signal_path[256];
    
    // Set up debuggee_tb debug interface signals
    sprintf(signal_path, "%s.\\-debug in req\\", tb_name);
    debug_req_n_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.\\debug in ack\\", tb_name);
    debug_ack_h = get_handle(signal_path);
        
    sprintf(signal_path, "%s.\\debug in a0\\", tb_name);
    debug_a0_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.\\debug in a1\\", tb_name);
    debug_a1_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.\\debug in wr\\", tb_name);
    debug_wr_h = get_handle(signal_path);
    
    // Get debug data bus handles
    for (int i = 0; i < 16; i++) {
        sprintf(signal_path, "%s.dbd%d", tb_name, i);
        dbd_h[i] = get_handle(signal_path);
        
    }

    vpi_printf("Debugger is attached to %s\n", tb_name);

    // Initialize UDP socket
    init_udp_socket();
    
    // Register main callback (read-write for signal control)
    register_rw_callback();
    
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
    } else {
        vpi_printf("Start of simulation callback registered successfully\n");
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
    } else {
        vpi_printf("End of simulation callback registered successfully\n");
    }
}

// State machine functions
void process_udp_commands(p_cb_data cb_data) {
    
    if (sockfd < 0) {
        vpi_printf("ERROR: Cannot process UDP commands - socket not initialized\n");
        return;
    }
    
    char buffer[BUFFER_SIZE];
    ssize_t n = recvfrom(sockfd, buffer, BUFFER_SIZE-1, 0, 
                        (struct sockaddr *)&cliaddr, &cliaddr_len);
    
    if (n > 0) {

        // simulation time in nanoseconds
        const uint64_t sim_time_ns = (((uint64_t)cb_data->time->high << 32) | (uint64_t)cb_data->time->low) / 1000000;

        buffer[n] = '\0';

        vpi_printf("Received UDP command: %s @ %lluns\n", buffer, sim_time_ns);
        
        char cmd;
        int addr, data;
        
        if (sscanf(buffer, "%c %x %x", &cmd, &addr, &data) == 3 && cmd == 'W') {
            // Write command
            vpi_printf("Processing write command: addr=0x%X, data=0x%X\n", addr, data);
            
            // Set address
            write_scalar(debug_a1_h, (addr >> 1) & 1);
            write_scalar(debug_a0_h, addr & 1);
            write_scalar(debug_wr_h, 1);
            
            // Set data on bus
            for (int i = 0; i < 16; i++) {
                write_scalar(dbd_h[i], (data >> i) & 1);
            }
            
            // Assert request and transition to waiting state
            write_scalar(debug_req_n_h, 0);
            debug_state = DEBUG_WAITING_ACK;
            
        } else if (sscanf(buffer, "%c %x", &cmd, &addr) == 2 && cmd == 'R') {
            // Read command  
            vpi_printf("Processing read command: addr=0x%X\n", addr);
            
            // Set address
            write_scalar(debug_a1_h, (addr >> 1) & 1);
            write_scalar(debug_a0_h, addr & 1);
            write_scalar(debug_wr_h, 0);
            
            // Assert request
            write_scalar(debug_req_n_h, 0);
            debug_state = DEBUG_WAITING_ACK;
            
        } else {
            // Error
            sprintf(pending_response, "1 Unknown command");
            debug_state = DEBUG_SENDING_UDP;
        }
    }
}

void check_for_ack() {
    int req_value = read_scalar(debug_req_n_h);
    int ack_value = read_scalar(debug_ack_h);
    int a0_value = read_scalar(debug_a0_h);
    int a1_value = read_scalar(debug_a1_h);
    int wr_value = read_scalar(debug_wr_h);
    if (ack_value) {
        vpi_printf("Debug ACK received\n");
        debug_state = DEBUG_READING_RESPONSE;
    }
}

void read_debug_response() {

    int is_read_op = !read_scalar(debug_wr_h);
    
    if (is_read_op) {
        // Read data from bus
        int read_data = 0;
        for (int i = 0; i < 16; i++) {
            s_vpi_value value_s;
            value_s.format = vpiIntVal;
            vpi_get_value(dbd_h[i], &value_s);
            if (value_s.value.integer == 1) {
                read_data |= (1 << i);
            }
        }
        sprintf(pending_response, "0 %X", read_data);
        vpi_printf("Read complete, data=0x%X\n", read_data);
    } else {
        sprintf(pending_response, "0");
        vpi_printf("Write complete\n");
    }
    
    debug_state = DEBUG_SENDING_UDP;
}

void send_udp_response(p_cb_data cb_data) {

    // simulation time in nanoseconds
    const uint64_t sim_time_ns = (((uint64_t)cb_data->time->high << 32) | (uint64_t)cb_data->time->low) / 1000000;

    if (sockfd < 0) {
        vpi_printf("ERROR: Cannot send UDP response - socket not initialized\n");
    } else {
        sendto(sockfd, pending_response, strlen(pending_response), 0,
               (struct sockaddr *)&cliaddr, cliaddr_len);
        vpi_printf("Sent UDP response: %s @ %luns\n", pending_response, sim_time_ns);
    }
    
    // Deassert debug request to complete handshake
    write_scalar(debug_req_n_h, 1);
    
    debug_state = DEBUG_IDLE;
}

void (*vlog_startup_routines[])() = {
    register_vpi_callbacks,
    NULL
};