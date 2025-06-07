
I would like to create wrappers for ttl entities so the ttl entities can be instantiated and port mapped using pin numbers instead of port names.

The component declaration of the wrappers are given in dip/dip.vhd file. Do not modify the dip/dip.vhd file. Do not modify anything under ttl directory.

Create a dip_X entity in dip/dip_X.vhd file for each component given in dip/dip.vhd. The corresponding ttl entity name is given in the comment next to the component declaration. Pay attention to comments in dip/dip.vhd and in ttl entities to figure out the pin numbers and port names. The dip_X entity's port definition MUST match to its component decleration in dip/dip.vhd.

Also create a dip/dip_X_tb.vhd to verify if wrapper is connected properly. Instantiate a wrapper and actual component and see if their outputs match.

Do not overwrite existing dip/dip_X.vhd, if the task is resumed, only work on the components that has no dip/dip_X.vhd file.

Run testbench to see if your changes are correct.

For dip_5600_tb, use roms/mskg4_*.hex files as data to load to the ROM.

For dip_74s472, use roms/prom1_*.hex files as data to load to the ROM.