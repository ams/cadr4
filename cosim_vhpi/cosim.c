#include <stdio.h>

#include <vhpi_user.h>

extern void cosim_test_startup();
//extern void cosim_assert_boot_startup();

void (*vhpi_startup_routines_array[])() = {
    cosim_test_startup,
    //cosim_assert_boot_startup,
    NULL
};