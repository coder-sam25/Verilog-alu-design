**Verilog 6-bit Arithmetic Logic Unit (ALU)**

A behavioral RTL implementation of a 6-bit Arithmetic Logic Unit (ALU) written in Verilog.
The ALU performs arithmetic, logical, and shift operations on two 6-bit operands and produces status flags commonly used in processor datapaths.

**Overview**

An Arithmetic Logic Unit (ALU) is the core computational block of a processor responsible for executing arithmetic and logical operations.

This project implements a 6-bit ALU capable of performing operations such as addition, subtraction, bitwise logic, and shift operations. The module also generates status flags including sign, carry, zero, and overflow, which are essential for control logic in CPU architectures.

**Design Methodology**

The ALU was designed using a standard Register Transfer Level (RTL) design approach in Verilog.

The development flow followed these steps:

**1) Functional specification**
Define supported operations, datapath width (6-bit), and required status flags.

**2) RTL design**
Implement the ALU using behavioral modeling with a combinational always @(*) block and opcode-based operation selection.

**3) Flag generation logic**
Implement carry, overflow, sign, and zero detection logic for arithmetic and shift operations.

**4) Simulation and verification**
Validate functionality using a dedicated testbench that applies different operand values and opcodes.

**Verification**

Functional verification was performed using a Verilog testbench that applies multiple input combinations to validate all supported ALU operations.

1. The verification checks:

2. Correct arithmetic results for addition and subtraction

3. Correct bitwise logic operations

4. Proper shift behavior

5. Accurate generation of status flags

Simulation waveforms confirm correct behavior of:

1. input operands A and B

2. operation selector opcode

3. output result X

4. status flags

Simulation tools used:
1. Vivado for schematic
2. EDA palyground for waveform

