#include <vpi_user.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <errno.h>

#include "cosim.h"

#define BUFFER_SIZE 256
#define UDP_PORT 12345

#include <stdarg.h>
#define VPI_PRINTF(...) vpi_printf("cosim_lashup_debugger: " __VA_ARGS__)

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
    VPI_PRINTF("CRITICAL ERROR: %s\n", error_msg);
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
                    VPI_PRINTF("Debug ACK received\n");
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

        VPI_PRINTF("UDP server listening on dynamically assigned port %d\n", actual_port);

    } else {

        VPI_PRINTF("UDP server listening on port %d\n", UDP_PORT);

    }
}

// Testbench configurations
struct {
    const char* name;
    const char* debug_prefix;
} testbench_configs[] = {
    {"cadr_tb", ""},  // Debug signals are at top level in cadr_tb
    {"cosim_lashup_debuggee_tb", ""},
    {NULL, NULL}
};

// Helper function to search module names and return testbench config index (-1 if not found)
static int find_testbench_index() {

    vpiHandle iter = vpi_iterate(vpiModule, NULL);

    if (!iter) {
        VPI_PRINTF("No modules found in design\n");
        return -1;
    }
    
    vpiHandle mod;

    while ((mod = vpi_scan(iter)) != NULL) {

        char* mod_name = vpi_get_str(vpiName, mod);
        
        // Check if this matches any of our expected testbench names
        for (int i = 0; testbench_configs[i].name != NULL; i++) {

            if (mod_name && strcmp(mod_name, testbench_configs[i].name) == 0) {
                VPI_PRINTF("Found matching testbench: %s\n", mod_name);
                return i;
            }

        }
    }

    return -1;
}

// Initialize VPI handles and UDP socket
PLI_INT32 start_of_simulation_cb(p_cb_data cb_data) {
    
    (void)cb_data;
    
    // Find the testbench configuration
    int tb_index = find_testbench_index();
    
    if (tb_index < 0) {
        VPI_PRINTF("Debugger is not attached.\n");
        return 0;
    }

    const char* tb_name = testbench_configs[tb_index].name;
    const char* debug_path_prefix = testbench_configs[tb_index].debug_prefix;

    char signal_path[256];
    
    // Set up debug interface signals
    sprintf(signal_path, "%s.%s\\-debug in req\\", tb_name, debug_path_prefix);
    debug_req_n_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.%s\\debug in ack\\", tb_name, debug_path_prefix);
    debug_ack_h = get_handle(signal_path);
        
    sprintf(signal_path, "%s.%s\\debug in a0\\", tb_name, debug_path_prefix);
    debug_a0_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.%s\\debug in a1\\", tb_name, debug_path_prefix);
    debug_a1_h = get_handle(signal_path);
    
    sprintf(signal_path, "%s.%s\\debug in wr\\", tb_name, debug_path_prefix);
    debug_wr_h = get_handle(signal_path);
    
    // Get debug data bus handles
    for (int i = 0; i < 16; i++) {
        sprintf(signal_path, "%s.dbd%d", tb_name, i);
        dbd_h[i] = get_handle(signal_path);
    }

    VPI_PRINTF("Debugger is attached to %s\n", tb_name);

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
        VPI_PRINTF("UDP socket closed\n");
    }
    
    return 0;
}

// State machine functions
void process_udp_commands(p_cb_data cb_data) {
    
    if (sockfd < 0) {
        VPI_PRINTF("ERROR: Cannot process UDP commands - socket not initialized\n");
        return;
    }
    
    char buffer[BUFFER_SIZE];
    ssize_t n = recvfrom(sockfd, buffer, BUFFER_SIZE-1, 0, 
                        (struct sockaddr *)&cliaddr, &cliaddr_len);
    
    if (n > 0) {

        // simulation time in nanoseconds
        const uint64_t sim_time_ns = (((uint64_t)cb_data->time->high << 32) | (uint64_t)cb_data->time->low) / 1000000;

        buffer[n] = '\0';

        VPI_PRINTF("Received UDP command: %s @ %lluns\n", buffer, sim_time_ns);
        
        char cmd;
        int addr, data;
        
        if (sscanf(buffer, "%c %x %x", &cmd, &addr, &data) == 3 && cmd == 'W') {
            // Write command
            VPI_PRINTF("Processing write command: addr=0x%X, data=0x%X\n", addr, data);
            
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
            VPI_PRINTF("Processing read command: addr=0x%X\n", addr);
            
            // Set address
            write_scalar(debug_a1_h, (addr >> 1) & 1);
            write_scalar(debug_a0_h, addr & 1);
            write_scalar(debug_wr_h, 0);
            
            // Set data bus to high impedance for VHDL to drive
            for (int i = 0; i < 16; i++) {
                s_vpi_value value_s;
                value_s.format = vpiStringVal;
                value_s.value.str = "z";
                vpi_put_value(dbd_h[i], &value_s, NULL, vpiNoDelay);
            }
            
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
        VPI_PRINTF("Read complete, data=0x%X\n", read_data);
    } else {
        sprintf(pending_response, "0");
        VPI_PRINTF("Write complete\n");
    }
    
    debug_state = DEBUG_SENDING_UDP;
}

void send_udp_response(p_cb_data cb_data) {

    // simulation time in nanoseconds
    const uint64_t sim_time_ns = (((uint64_t)cb_data->time->high << 32) | (uint64_t)cb_data->time->low) / 1000000;

    if (sockfd < 0) {
        VPI_PRINTF("ERROR: Cannot send UDP response - socket not initialized\n");
    } else {
        sendto(sockfd, pending_response, strlen(pending_response), 0,
               (struct sockaddr *)&cliaddr, cliaddr_len);
        VPI_PRINTF("Sent UDP response: %s @ %luns\n", pending_response, sim_time_ns);
    }
    
    // Deassert debug request to complete handshake
    write_scalar(debug_req_n_h, 1);
    
    debug_state = DEBUG_IDLE;
}

void cosim_lashup_debugger_startup() {

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
        cosim_finish_simulation("Failed to register start of simulation callback");
    } else {
        VPI_PRINTF("Start of simulation callback registered successfully\n");
    }
    
    cb_data.reason = cbEndOfSimulation;
    cb_data.cb_rtn = end_of_simulation_cb;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        cosim_finish_simulation("Failed to register end of simulation callback");
    } else {
        VPI_PRINTF("End of simulation callback registered successfully\n");
    }
}
