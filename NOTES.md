
# Power On Reset

- when VCC applied, -BOOT1 and -BOOT2 are not asserted and -POWER RESET is initially asserted.

- -POWER RESET assertion is used to assert -CLOCK RESET A and -CLOCK RESET B. 

- -CLOCK RESET B asserted sets the SR latch in clock1 to generate -TPR0 pulse. The period of this is TPREND (160ns for speed10=00) + TPW60 (60ns) is 220ns. The pulse with is controlled with -TPR40 signal, so 40ns.

- -CLOCK RESET B assertes resets the SR latch in clock2 to start generating TPCLK. TPCLK is set with -TPR0 and reset with -TPREND.

- -CLOCK RESET A clears some registers (BOOT.TRAP, RUN, SRUN, SPEEDXX etc.)

- After X ns, -POWER RESET is de-asserted which de-asserts -CLOCK RESET A/B. This completes the reset.

- In the hardware, it looks like the length of -POWER RESET assertion is due to the propagation delay of two inverters (olord2_1a20). Since we are not using propagation delays, I have modified here in cadr_olord2_suds, and removed these inverters. Instead, olord2_1a19 (ic16_dummy) generates this -POWER RESET signal (initially asserted, after 20ns deasserted).

- -BOOT1 and -BOOT2 not asserted, makes -BOOT not asserted, this pauses booting.

# Booting

There are two main ways to boot CADR, from IOB (keyboard, chaos etc.) or SPY (PROG.BOOT in mode register). It looks like IOB asserts -BOOT, but I did not understand how this happens because olord2_1a17 also drives this high always. The signal on IOB is called -BOOT* (why *, dont know). Because I did not understand how this works, I have disconnected -BOOT1 from olord2_1a19 (ic16_dummy), so it became an input to olord2 not an output. I use -BOOT1 signal to initiate boot (imitiating the IOB boot request).