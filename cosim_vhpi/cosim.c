#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <vhpi_user.h>

#include "cosim.h"

extern void cosim_util_startup();
extern void cosim_diagnostic_display_startup();

void (*vhpi_startup_routines[])() = {
    cosim_util_startup,
    cosim_diagnostic_display_startup,
    NULL
};

#define VHPI_PRINTF(...) vhpi_printf("cosim: " __VA_ARGS__)

static int time_precision;
static double nanoseconds_per_tick;

void cosim_util_startup()
{
    vhpiPhysT res = vhpi_get_phys(vhpiResolutionLimitP, NULL);

    if (res.high == vhpiNS.high && res.low == vhpiNS.low) {
        time_precision = -9;
    } else if (res.high == vhpiPS.high && res.low == vhpiPS.low) {
        time_precision = -12;
    } else if (res.high == vhpiFS.high && res.low == vhpiFS.low) {
        time_precision = -15;
    } else {
        VHPI_PRINTF("Unsupported resolution limit: %d.%u\n", 
            res.high, res.low);
        cosim_finish_simulation("Unsupported resolution limit");
    }

    nanoseconds_per_tick = pow(10.0, time_precision + 9);
}

double cosim_current_time_ns()
{    
    vhpiTimeT time;
    vhpi_get_time(&time, NULL);

    const int64_t ticks = ((int64_t)time.high << 32) | time.low;
    return ticks * nanoseconds_per_tick;
}

void cosim_finish_simulation(const char* error_msg)
{
    if (error_msg != NULL) VHPI_PRINTF("ERROR: %s\n", error_msg);
    vhpi_control(vhpiFinish);
}