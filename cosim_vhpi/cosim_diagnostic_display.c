#include <assert.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vhpi_user.h>

#include "cosim.h"

#define VHPI_PRINTF(...) vhpi_printf("cosim_diagnostic_display: " __VA_ARGS__)

static vhpiHandleT display_signal_handles[5][5] = {NULL};
static int prev_values[5][5];
static bool initialized = false;

// Convert 3-bit binary to octal character
static char to_octal_char(int b2, int b1, int b0) {
    assert (b0 == 0 || b0 == 1);
    assert (b1 == 0 || b1 == 1);
    assert (b2 == 0 || b2 == 1);
    return '0' + (b2 * 4 + b1 * 2 + b0);
}

static void display_callback(const vhpiCbDataT* cb_data);

static void register_display_callback() 
{
    vhpiCbDataT cb_data;
    
    cb_data.reason = vhpiCbRepNextTimeStep;
    cb_data.cb_rtn = display_callback;
    cb_data.user_data = NULL;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;

    vhpiHandleT cb_handle = vhpi_register_cb(&cb_data, vhpiReturnCb);

    if (!cb_handle) {
        cosim_finish_simulation("failed to register display callback");
    }

    vhpi_release_handle(cb_handle);
}

// Monitor callback function
static void display_callback(const struct vhpiCbDataS* cb_data) 
{
    struct vhpiValueS val;
    int current_values[5][5];
    bool changed = false;
    bool has_metavalues = false;
        
    // Read current values for all signals
    val.format = vhpiLogicVal;
    for  (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (display_signal_handles[i][j] != NULL) {
                int ret = vhpi_get_value(display_signal_handles[i][j], &val);
                assert (ret == 0);
                if (val.value.enumv == vhpi0) {
                    current_values[i][j] = 0;
                } else if (val.value.enumv == vhpi1) {
                    current_values[i][j] = 1;
                } else {
                    current_values[i][j] = -1;
                    if (j > 0) has_metavalues = true;
                }
                if (!initialized || (current_values[i][j] != prev_values[i][j])) {
                    changed = true;
                }
            }
        }
    }
    
    if (changed) {
        if (has_metavalues) 
        {
            printf("-----");
        }
        else
        {
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
        }
        
        // Display status flags (signals 20-24)
        if (current_values[4][0] == 1)       printf(" PROMENABLE ");
        else if (current_values[4][0] == -1) printf(" ---------- ");
        else                                 printf("            ");
        
        if (current_values[3][0] == 1)       printf("IPE ");
        else if (current_values[3][0] == -1) printf("--- ");
        else                                 printf("    ");
        
        if (current_values[2][0] == 1)       printf("DPE ");
        else if (current_values[2][0] == -1) printf("--- ");
        else                                 printf("    ");
        
        if (current_values[1][0] == 1)       printf("TILT0 ");
        else if (current_values[1][0] == -1) printf("----- ");
        else                                 printf("      ");
        
        if (current_values[0][0] == 1)       printf("TILT1 ");
        else if (current_values[0][0] == -1) printf("----- ");
        else                                 printf("      ");
        
        printf("%*.0lf ns", 7, cosim_current_time_ns());

        printf("\n");
        
        // Update previous values
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                prev_values[i][j] = current_values[i][j];
            }
        }
        
        initialized = true;
    }

    return;
}

static void start_of_simulation(const vhpiCbDataT* cb_data) 
{
    char* pctl_names[] = {
        "pctl_1f16",
        "pctl_1f17",
        "pctl_1f18",
        "pctl_1f19",
        "pctl_1f20" 
    };

    char* til309_signals_names[] = {"p14", "p17", "p12", "p6", "p7"};

    vhpiHandleT top_module_handle = vhpi_handle_by_name("cadr_boot_tb", NULL);

    assert (top_module_handle != NULL);
    if (top_module_handle == NULL) { return; }

    vhpiHandleT pctl_handle = vhpi_handle_by_name("icmem_pctl_inst", 
        top_module_handle);

    vhpi_release_handle(top_module_handle);

    assert (pctl_handle != NULL);
    if (pctl_handle == NULL) { return; }

    vhpiHandleT display_handles[5] = {NULL};

    for (int i = 0; i < 5; i++) {
        display_handles[i] = vhpi_handle_by_name(pctl_names[i], pctl_handle);
        assert (display_handles[i] != NULL);
        if (display_handles[i] == NULL) { return; }
    }    

    vhpi_release_handle(pctl_handle);

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            display_signal_handles[i][j] = vhpi_handle_by_name(
                til309_signals_names[j], display_handles[i]);
            assert (display_signal_handles[i][j] != NULL);
        }
        vhpi_release_handle(display_handles[i]);
    }
    
    register_display_callback();
}

static void end_of_simulation(const vhpiCbDataT* cb_data)
{
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (display_signal_handles[i][j] != NULL) 
            {
                vhpi_release_handle(display_signal_handles[i][j]);
            }
        }
    }
}

void cosim_diagnostic_display_startup() 
{
    vhpiCbDataT cb_data;
    vhpiHandleT cb_handle;
    
    cb_data.reason = vhpiCbStartOfSimulation;
    cb_data.cb_rtn = start_of_simulation;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vhpi_register_cb(&cb_data, vhpiReturnCb);

    if (!cb_handle) {
        cosim_finish_simulation("failed to register start of simulation callback");
    }

    vhpi_release_handle(cb_handle);

    cb_data.reason = vhpiCbEndOfSimulation;
    cb_data.cb_rtn = end_of_simulation;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vhpi_register_cb(&cb_data, vhpiReturnCb);

    if (!cb_handle) {
        cosim_finish_simulation("failed to register end of simulation callback");
    }

    vhpi_release_handle(cb_handle);
}