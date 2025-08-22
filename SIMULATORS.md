
# Simulators

Some notes about HDL simulators: ghdl and nvc.

# GHDL

## VPI

### vpi_put_value

- vpiTransportDelay flag not supported

# NVC

- all identifiers are converted to canonical upper-case form by default

## VHPI

- normal build causes error because there is no VHPI library to find the symbols like vhpi_printf. Such errors are disabled at the moment.