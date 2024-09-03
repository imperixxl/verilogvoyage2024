# Vending Machine Verilog Module

## Project Overview

This project implements a vending machine using Verilog. The module is designed to handle cash inputs and provide the corresponding output based on the amount of money inserted. The vending machine accepts Rs. 10 and Rs. 20 notes and dispenses an item when the total inserted amount equals or exceeds Rs. 30.


## Logic Diagram
![image](https://github.com/user-attachments/assets/d431a29f-e4ec-4c9f-b0ff-68ce9f70b29a)

## Files

### 1. `vending_machine.v`
This is the main module of the vending machine, which includes the following features:
- **Inputs**:
  - `cash`: A 2-bit input representing the amount inserted. `01` corresponds to Rs. 10, and `10` corresponds to Rs. 20.
  - `clk`: Clock signal for synchronization.
  - `rst`: Reset signal to initialize the state.
- **Outputs**:
  - `dispense`: A signal that becomes high when the item is dispensed.
  - `retChange`: A 2-bit output representing the amount of change returned.

The module uses a state machine to manage the different states of the vending machine, ensuring that the correct change is returned, and the item is dispensed when the conditions are met.

### 2. `vending_machine_tb.v`
This is the testbench module used to simulate and verify the behavior of the `vending_machine` module. The testbench initializes the inputs, applies different test scenarios, and monitors the outputs. The testbench includes:
- **Initialization**: The reset signal is asserted and then de-asserted to start the simulation.
- **Simulation Scenarios**:
  - Inserting Rs. 10 three times to simulate a transaction.
  - Monitoring the `dispense` and `retChange` outputs to verify correct operation.

## Where and how to Run the Simulation

1. Ensure you have a Verilog simulator installed (I used Xilinx Vivado in my case).
2. Compile the `vending_machine.v` and `vending_machine_tb.v` files using the simulator.
3. Run the simulation using the compiled files.
4. View the output waveforms using a waveform viewer to observe the functionality.


## A Glimpse of my results (have an unxepected early spike of around 5ns in the output) 
![image](https://github.com/user-attachments/assets/7575305b-aaac-486d-b062-cd10082dfa57)



