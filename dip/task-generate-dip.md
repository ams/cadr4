Create a dip_X entity in dip/dip_X.vhd file for each component given in dip/dip.vhd. The corresponding entity name is given in the comment next to the component declaration. These are defined under ttl folder. Pay attention to comments in dip/dip.vhd and in files ttl/*.vhd to figure out the pin numbers and port names. The dip_X entity's port definition MUST match to its component decleration in dip/dip.vhd.

Do not overwrite any existing dip/dip_X.vhd. If the task is resumed, only work on the components that has no dip/dip_X.vhd file.

For dip_5600_tb, use roms/mskg4_*.hex files as data to load to the ROM.

For dip_74s472, use roms/prom1_*.hex files as data to load to the ROM. 