# MIPS VHDL Processor

This repository contains a VHDL implementation of a simplified single-cycle MIPS processor. The design includes key components such as the ALU, Control Unit, Instruction Memory, Program Counter, Register File, and Multiplexers, all interconnected to execute a subset of the MIPS instruction set.

## Features

- **Architecture**: Single-cycle MIPS
- **Supported Instructions**:
    - **Arithmetic**: `ADD`, `ADDI`, `SUB`, `SUBI`
    - **Logical**: `AND`, `OR`
    - **Comparison**: `SLT` (Set on Less Than)
    - **Branching**: `BEQ` (Branch on Equal), `BNE` (Branch on Not Equal)
    - **Jump**: `J` (Unconditional Jump)

## Components

The project is modular and consists of the following VHDL entities:

- `alu.vhd`: Arithmetic Logic Unit that performs operations based on control signals.
- `control_unit.vhd`: Decodes instructions and generates control signals for the datapath.
- `instructions_memory.vhd`: A ROM-like memory module containing the program to be executed.
- `registers.vhd`: A 32x32-bit Register File for data storage.
- `pc.vhd`: Program Counter that holds the address of the current instruction.
- `sign_extend.vhd`: Extends 16-bit immediate values to 32 bits.
- `mux.vhd`, `mux_0.vhd`, `mux_1.vhd`: Multiplexers used for routing data within the processor.
- `main.vhd`: The top-level entity that connects all components together.

## Getting Started

### Prerequisites

- Altera Quartus II (Web Edition or Subscription)
- ModelSim (optional, for simulation)

### How to Run

1. Open the project file `MIPS_VHDL.qpf` in Quartus II.
2. Compile the design to ensure there are no errors.
3. Use the Waveform Viewer or ModelSim to simulate the `main` entity.
4. Observe the signals, particularly the program counter (`pc`), registers, and ALU output, to verify the execution of the program.

## Program Execution

The `instructions_memory.vhd` file is pre-loaded with a test program. This program demonstrates various capabilities of the processor, including:
- Immediate arithmetic operations (`ADDI`)
- Branching logic (`BNE`)
- Register arithmetic (`ADD`, `SUBI`)
- Jumps (`J`)

You can modify the `instruction_mem` array in `instructions_memory.vhd` to run different programs by changing the instruction opcodes and operands.

## File Structure

- `MIPS_VHDL.qpf` / `MIPS_VHDL.qsf`: Quartus project files.
- `*.vhd`: VHDL source files for the processor components.
- `*.bsf`: Block Symbol Files for schematic entry in Quartus.
- `main.bdf`: Block Design File (schematic) of the top-level design.
