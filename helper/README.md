
# helper

This folder contains helper components. helper components are required for cadr_tb to run. 

- helper_boot.vhd.partial: added to cadr_boot_tb during autogeneration to trigger booting

- helper_bus_interface_cable.vhd: connects CADR (cadr, icmem) to CADR1 (busint)

- helper_bus_monitor.vhd: combines scalar signals to vector (bus) signals to simplify signal monitoring, it has no functional effect.

- helper_deassert_halt.vhd: deasserts -halt, this is required for CADR to start.

- helper_stop_if_prom_fails.vhd: stops simulation when PC reaches #o313.