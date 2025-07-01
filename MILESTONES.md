# Milestones

## DONE - Start executing instructions from the boot PROM - Early 06.2025

Main obstacles were:

- deciding on initialization / default state of components
- ALU
- dip-ttl miswirings
- spent too much time with set idea, it was not needed
- TPWP signal according to schematics is generated in a way passing the current cycle, which was causing problems, so it is modified.

## DONE - Execute the whole boot PROM until we hit either disk or virtual memory access - 01.07.2025

Hit this one:

```
00312 0000025064010030:	 ((MD-START-WRITE) SETM MD)
```

## Spy interface to debug the CADR

## AXI <-> CADR bus interface (XBUS / Unibus)

