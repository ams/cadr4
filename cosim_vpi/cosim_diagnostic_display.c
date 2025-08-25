#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vpi_user.h>

#include "cosim.h"

#define VPI_PRINTF(...) vpi_printf("cosim_diagnostic_display: " __VA_ARGS__)

static vpiHandle display_signal_handles[5][5] = {NULL};
static int prev_values[5][5];
static int initialized = 0;
static s_vpi_time last_time;

// Convert 3-bit binary to octal character
static char to_octal_char(int b2, int b1, int b0) {
    return '0' + (b2 * 4 + b1 * 2 + b0);
}

static PLI_INT32 display_callback(p_cb_data cb_data);

static void register_display_callback() 
{
    // Re-register display callback
    s_cb_data cb_data;
    cb_data.reason = cbReadWriteSynch;
    cb_data.cb_rtn = display_callback;
    cb_data.obj = NULL;
    s_vpi_time time_s;
    time_s.type = vpiSimTime;
    time_s.low = 0;
    time_s.high = 0;
    cb_data.time = &time_s;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    vpiHandle cb_handle = vpi_register_cb(&cb_data);
    if (!cb_handle) {
        cosim_finish_simulation("Could not register display_callback");
    }
}

// Monitor callback function
static PLI_INT32 display_callback(p_cb_data cb_data) {

    s_vpi_value val;
    int current_values[5][5];
    int changed = 0;
        
    // Read current values for all signals
    val.format = vpiIntVal;
    for  (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (display_signal_handles[i][j] != NULL) {
                vpi_get_value(display_signal_handles[i][j], &val);
                current_values[i][j] = val.value.integer;
                if (!initialized || (current_values[i][j] != prev_values[i][j])) {
                    changed = 1;
                }
            }
        }
    }
    
    if (changed) {
        printf("%c%c%c%c%c",
               to_octal_char(current_values[4][3], current_values[4][2], 
                current_values[4][1]),
               to_octal_char(current_values[3][3], current_values[3][2], 
                current_values[3][1]),
               to_octal_char(current_values[2][3], current_values[2][2], 
                current_values[2][1]),
               to_octal_char(current_values[1][3], current_values[1][2], 
                current_values[1][1]),
               to_octal_char(current_values[0][3], current_values[0][2], 
                current_values[0][1]));
        
        // Display status flags (signals 20-24)
        if (current_values[4][0]) printf(" PROMENABLE ");
        else                      printf("            ");
        
        if (current_values[3][0]) printf("IPE ");
        else                      printf("    ");
        
        if (current_values[2][0]) printf("DPE ");
        else                      printf("    ");
        
        if (current_values[1][0]) printf("TILT0 ");
        else                      printf("      ");
        
        if (current_values[0][0]) printf("TILT1 ");
        else                      printf("      ");
        
        printf("%*.0lf ns", 7, cosim_s_vpi_time_to_ns(cb_data->time));

        printf("\n");
        
        // Update previous values
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                prev_values[i][j] = current_values[i][j];
            }
        }
        
        initialized = 1;
    }

    register_display_callback();

    return 0;
}

static PLI_INT32 start_of_simulation(p_cb_data cb_data) {    

    char* pctl_names[] = {
        "pctl_1f16",
        "pctl_1f17",
        "pctl_1f18",
        "pctl_1f19",
        "pctl_1f20" 
    };

    char* til309_signals_names[] = {"p14", "p17", "p12", "p6", "p7"};

    vpiHandle top_iter = vpi_iterate(vpiModule, NULL);
    vpiHandle top_module_handle = vpi_scan(top_iter);

    assert (top_module_handle != NULL);
    if (top_module_handle == NULL) { return 1; }

    vpiHandle pctl_handle = vpi_handle_by_name("icmem_pctl_inst", 
        top_module_handle);

    assert (pctl_handle != NULL);
    if (pctl_handle == NULL) { return 1; }

    PLI_INT32 pctl_type = vpi_get(vpiType, pctl_handle);
    assert (pctl_type == vpiModule);
    if (pctl_type != vpiModule) { return 1; }

    vpiHandle display_handles[5] = {NULL};

    for (int i = 0; i < 5; i++) {
        display_handles[i] = vpi_handle_by_name(pctl_names[i], pctl_handle);
        assert (display_handles[i] != NULL);
        if (display_handles[i] == NULL) { return 1; }
        PLI_INT32 display_type = vpi_get(vpiType, display_handles[i]);
        assert (display_type == vpiModule);
        if (display_type != vpiModule) { return 1; }
    }    

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            display_signal_handles[i][j] = vpi_handle_by_name(
                til309_signals_names[j], display_handles[i]);
            assert (display_signal_handles[i][j] != NULL);
            if (display_signal_handles[i][j] == NULL) { return 1; }
            PLI_INT32 display_signal_type = vpi_get(vpiType, 
                display_signal_handles[i][j]);
            assert (display_signal_type == vpiNet);
            if (display_signal_type != vpiNet) { return 1; }
        }
    }
    
    register_display_callback();
    
    return 0;
}

void cosim_diagnostic_display_startup() 
{
    s_cb_data cb_data;
    cb_data.reason = cbStartOfSimulation;
    cb_data.cb_rtn = start_of_simulation;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;
    
    vpiHandle cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        cosim_finish_simulation("Could not register start of simulation callback");
    }
}