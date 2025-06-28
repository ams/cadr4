
# dip

This folder contains dip components.

The <PART> component in the schematic is represented by dip_<PART> entity.

A dip component is directly referenced from CADR schematics (CADR suds file). A dip component is a wrapper for ttl components. cadr components use dip components with the pin numbers (of DIP package of the corresponding IC), and the dip component maps the pin numbers to corresponding ttl component's port names. cadr components never use ttl components directly.

The main reason for having dip components is to make the wiring given in schematics explicit. It also makes debugging much easier.

The drw files might have different bodies representing the same ICs. The aliases in the dip.vhd represents these (e.g. 74s02o). These are the same ICs, same IC packages, only the body in drw file is shown differently, hence they are named different.