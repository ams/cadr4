
# System Tests

| Test   | Description                 | Relevant Pages |
| ------ | --------------------------- | -------------- |
| port   | Power on Reset              | olord2 |
| clkgen | Clock Generation            | olord2, clock1, clock2, clockd |
| boot   | Start Boot                  | olord2, clock1, clock2, clockd, olord1 |
| pc0    | Load IR   from PROM PC=0    | olord2, clock1, clock2, clockd, olord1, trap, npc, pctl, prom0, prom1, ireg |
| prom   | Tests Prom Contents         | prom0, prom1 |
| cadr   | Complete CADR Run           | all pages |