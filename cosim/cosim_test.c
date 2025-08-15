#include <stdio.h>

static const char HDL_LOGIC_CHAR[] = { 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-'};

enum HDL_LOGIC_STATES {
    HDL_U = 0,
    HDL_X = 1,
    HDL_0 = 2,
    HDL_1 = 3,
    HDL_Z = 4,
    HDL_W = 5,
    HDL_L = 6,
    HDL_H = 7,
    HDL_D = 8,
};


void cosim_p(void) {
  printf("Hello from procedure!\n");
}

void cosim_pargs(int x) {
  printf("Hello from procedure(%d)!\n", x);
}

int cosim_f(void) {
  return 3;
}

int cosim_fargs (int x) {
  return x+5;
}

void cosim_get_bus(char* abus, int len) {
    int i = 0;
    for (; i < len-1; i++) {
        abus[i] = HDL_0;
    }
    abus[i] = HDL_1;
}