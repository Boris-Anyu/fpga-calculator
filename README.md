ECE 320 – Four-Digit FPGA Calculator

Author: Boris Anyu
Course: ECE 320 – FPGA Based Digital Circuit Design
Institution: St. Cloud State University
Platform: Xilinx FPGA / Vivado
Language: Verilog HDL

Overview

This project implements a four-digit calculator using sequential digital logic and Verilog HDL. Developed as part of ECE 320 Digital Logic Design, the project focuses on designing, simulating, and verifying a calculator circuit suitable for FPGA implementation.

The design includes calculator control logic, a top-level module, a testbench, and a circuit schematic. It also incorporates negative-sign functionality for representing negative results.

Features

Four-digit calculator design.

Sequential logic for managing calculator operations and input.

Negative-sign functionality.

Verilog HDL implementation.

Testbench for functional simulation and verification.

Circuit schematic documenting the design.

Vivado project files for FPGA development.

Design Modules

1. four_didgit_calculator.v

Implements the calculator's primary logic, including the internal control and data-handling behavior.

2. calculator_top_level.v

Connects the calculator logic to the external inputs and outputs used by the FPGA design.

3. calculator_TB.v

Provides a simulation testbench for exercising the calculator design and checking its behavior.

Tools and Technologies

Verilog HDL — Hardware description and digital logic implementation.

AMD Xilinx Vivado — FPGA design, synthesis, and simulation.

Git and GitHub — Version control and project documentation.

How to Open the Project

Install AMD Xilinx Vivado.

Clone or download this repository.

Open calculator.xpr in Vivado.

Review the Verilog source files under the project sources.

Open the simulation sources and run the testbench.

Review schematic.pdf for the circuit design.

Learning Objectives

This project demonstrates practical experience with:

Sequential digital circuit design.

Modular Verilog development.

Testbench creation and functional simulation.

Calculator input and output handling.

Negative-number representation.

FPGA project organization and version control.

Author

Boris Anyu
Electrical and Computer Engineering Student
St. Cloud State University

GitHub: @Boris-Anyu

This project was developed for educational purposes as part of ECE 320 Digital Logic Design.
