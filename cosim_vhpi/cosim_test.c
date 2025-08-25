
#include <stdio.h>
#include <vhpi_user.h>

#include "cosim.h"

#define VHPI_PRINTF(...) vhpi_printf("cosim_test: " __VA_ARGS__)

static void start_of_simulation(const struct vhpiCbDataS* cb_data) 
{
    (void)cb_data;
    VHPI_PRINTF("start of simulation callback\n");
}

static void end_of_simulation(const struct vhpiCbDataS* cb_data) 
{
    (void)cb_data;
    VHPI_PRINTF("end of simulation callback\n");
}

void cosim_test_startup() 
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
        VHPI_PRINTF("failed to register start of simulation callback");
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
        VHPI_PRINTF("failed to register end of simulation callback");
    }

    vhpi_release_handle(cb_handle);
}