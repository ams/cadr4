#include <math.h>
#include <stdio.h>
#include <vpi_user.h>

extern void cosim_util_startup();
extern void cosim_diagnostic_display_startup();

extern void cosim_test_startup();
extern void cosim_assert_boot_startup();
extern void cosim_lashup_debugger_startup();

void (*vlog_startup_routines[])() = {
    cosim_util_startup,
    cosim_diagnostic_display_startup,
    //cosim_test_startup,
    //cosim_assert_boot_startup,
    //cosim_lashup_debugger_startup,
    NULL
};

#define VPI_PRINTF(...) vpi_printf("cosim_util: " __VA_ARGS__)

static PLI_INT32 time_precision;
static double nanoseconds_per_tick;

void cosim_util_startup()
{
    time_precision = vpi_get(vpiTimePrecision, NULL);
    //VPI_PRINTF("time precision: %d\n", time_precision);

    nanoseconds_per_tick = pow(10.0, time_precision + 9);
    //VPI_PRINTF("nanoseconds per tick: %e\n", nanoseconds_per_tick);
}

double cosim_s_vpi_time_to_ns(s_vpi_time* time) 
{
    const uint64_t ticks = ((uint64_t)time->high << 32) | time->low;
    return ticks * nanoseconds_per_tick;
}