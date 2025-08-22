#include <stdio.h>
#include <vhpi_user.h>

#define VHPI_PRINTF(...) vhpi_printf("cosim_test: " __VA_ARGS__)

static void terminate_simulation_with_error(const char* error_msg) {
    VHPI_PRINTF("CRITICAL ERROR: %s\n", error_msg);
    vhpi_control(vhpiFinish, 1);
}

static void start_of_simulation_cb(const vhpiCbDataT *cb_data) 
{
    (void)cb_data;
    VHPI_PRINTF("start of simulation callback\n");
}

static void end_of_simulation_cb(const vhpiCbDataT *cb_data) 
{
    (void)cb_data;
    VHPI_PRINTF("end of simulation callback\n");
}

void cosim_test_startup() 
{
    VHPI_PRINTF("cosim_test_startup\n");
}
