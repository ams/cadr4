
# dip

This folder contains dip components, meaning their port maps are pin numbers.

The <PART> component in the schematic is represented by a dip_<PART> component.

A dip component is directly referenced from CADR schematics (CADR suds file). A dip component is only a wrapper for ttl components. cadr components use dip components with the pin numbers (of DIP package of the corresponding IC), and the dip component maps the pin numbers to corresponding ttl component's port names. cadr components never use ttl components directly.

The main reason for having dip components is to make the wiring given in schematics explicit. It also makes debugging much easier.

## Duplicates / Aliases

Rather than using aliases, following components are duplicated, their port maps and architectures are the same:

- dip_74s74 and dip_74ls74
- dip_74s240 and dip_74ls240
- dip_74s288 and dip_5610
- dip_74s374 and dip_74ls374