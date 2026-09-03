
#include <stdio.h>
#include <vpi_user.h>

#define VPI_PRINTF(...) vpi_printf("cosim_assert_boot: " __VA_ARGS__)

static void terminate_simulation_with_error(const char* error_msg) {
    VPI_PRINTF("CRITICAL ERROR: %s\n", error_msg);
    vpi_control(vpiFinish, 1);
}

static PLI_INT32 time_precision;
static double ticks_per_ns;

// 10 raised to an integer power without libm: the shared library must not
// have undefined symbols on Linux (ghdl --vpi-link does not add -lm)
static double power_of_ten(int exponent)
{
    double result = 1.0;
    for (int i = 0; i < exponent; i++) result *= 10.0;
    for (int i = 0; i > exponent; i--) result /= 10.0;
    return result;
}


// one tick is 10^time_precision seconds, so one ns is 10^(-9 - precision) ticks
static void initialize_simulation_defaults()
{
    time_precision = vpi_get(vpiTimePrecision, NULL);
    ticks_per_ns = power_of_ten(-9 - time_precision);
}

static uint64_t ticks_from_ns(double ns) {
    return (uint64_t) (ns * ticks_per_ns + 0.5);
}

static void setup_s_vpi_time_ns(double ns, s_vpi_time* t)
{
    uint64_t d = ticks_from_ns(ns);
    t->low  = (uint32_t)(d & 0xFFFFFFFFu);
    t->high = (uint32_t)(d >> 32);
}

static PLI_INT32 start_of_simulation_cb(p_cb_data cb_data) 
{
    (void)cb_data;

    initialize_simulation_defaults();

    vpiHandle boot_h = vpi_handle_by_name("cadr_tb.\\-lm boot\\", NULL);

    if (boot_h) 
    {
        VPI_PRINTF("scheduling a pulse to -lm boot\n");    

        s_vpi_value value_s;
        value_s.format = vpiIntVal;
        s_vpi_time time_s;
        time_s.type = vpiSimTime;

        value_s.value.integer = 1;
        setup_s_vpi_time_ns(0.0, &time_s);
        vpi_put_value(boot_h, &value_s, &time_s, vpiTransportDelay);

        value_s.value.integer = 0;
        setup_s_vpi_time_ns(10.0, &time_s);
        vpi_put_value(boot_h, &value_s, &time_s, vpiTransportDelay);

        value_s.value.integer = 1;
        setup_s_vpi_time_ns(20.0, &time_s);
        vpi_put_value(boot_h, &value_s, &time_s, vpiTransportDelay);
    }

    return 0;
}

void cosim_assert_boot_startup() 
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
    }
}