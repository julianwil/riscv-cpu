# riscv-cpu
An RV32I CPU Implemented in SystemVerilog. This project is being developed from the RV32I specification with an emphasis on understanding CPU datapath design, instruction decoding, and RTL verification.

## Status
As of 9/4/2026, all arithmetic instructions (register-to-register and immediate) are implemented and verified to work through a testbench.

### Implemented
- Register-to-register arithmetic and logical instructions
- Immediate arithmetic and logical instructions
- ALU
- Register file
- Instruction decoding
- Testbench-based verification

### In Progress
- Branch instructions
- Jump instructions
- Load/store instructions
- Remaining RV32I instructions

## Simulation
This project is currently being tested using Icarus Verilog on Ubuntu 24.04 LTS.
