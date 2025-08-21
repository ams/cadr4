
#include <stdio.h>

#include <vpi_user.h>

// these methods can only call vpi_register_systf and vpi_register_cb
// also vpi_register_cb can be called only with:
// cbStartOfSimulation
// cbEndOfSimulation
// cbEndOfCompile
// cbUnresolvedSystf
// cbError
// cbPLIError

extern void cosim_test_startup();
extern void cosim_assert_boot_startup();
extern void cosim_lashup_debugger_startup();

void (*vlog_startup_routines[])() = {
    cosim_test_startup,
    cosim_assert_boot_startup,
    cosim_lashup_debugger_startup,
    NULL
};