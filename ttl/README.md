
# TTL Components

Since all components are TTL, all inputs are initialized to 'H'. This is critical for CADR to work, if changed, many things can break.

All components have a testbench with `_tb` suffix. Run `make ttl-check` to run all testbenches.