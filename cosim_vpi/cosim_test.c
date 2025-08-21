
#include <stdio.h>
#include <vpi_user.h>

#define VPI_PRINTF(...) vpi_printf("cosim_test: " __VA_ARGS__)

static void terminate_simulation_with_error(const char* error_msg) {
    VPI_PRINTF("CRITICAL ERROR: %s\n", error_msg);
    vpi_control(vpiFinish, 1);
}

static PLI_INT32 start_of_simulation_cb(p_cb_data cb_data) 
{
    (void)cb_data;
    VPI_PRINTF("start of simulation callback\n");
    return 0;
}

static PLI_INT32 end_of_simulation_cb(p_cb_data cb_data) 
{
    (void)cb_data;
    VPI_PRINTF("end of simulation callback\n");
    return 0;
}

void cosim_test_startup() 
{
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
        terminate_simulation_with_error("failed to register start of simulation callback");
    } else {
        VPI_PRINTF("start of simulation callback registered successfully\n");
    }
    
    cb_data.reason = cbEndOfSimulation;
    cb_data.cb_rtn = end_of_simulation_cb;
    cb_data.obj = NULL;
    cb_data.time = NULL;
    cb_data.value = NULL;
    cb_data.user_data = NULL;

    cb_handle = vpi_register_cb(&cb_data);

    if (!cb_handle) {
        terminate_simulation_with_error("failed to register end of simulation callback");
    } else {
        VPI_PRINTF("end of simulation callback registered successfully\n");
    }
}