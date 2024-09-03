`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vending_machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: When Rs 10 notes are inserted consecutively
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vending_machine_tb;

  // Inputs
  reg clk;
  reg [1:0] cash;
  reg rst;

  // Outputs
  wire dispense;
  wire [1:0] retChange;

  // Instantiate the Unit Under Test (UUT)
  vending_machine uut (
    .clk(clk),
    .rst(rst),
    .cash(cash),
    .dispense(dispense),
    .retChange(retChange)
  );

  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, vending_machine_tb);
    
    // Initialize inputs
    rst = 1;
    clk = 0;
    cash = 2'b00;

    #10 rst = 0;
    cash = 2'b01; // Insert Rs. 10
    #10 cash = 2'b01; // Insert Rs. 10 again
    #10 cash = 2'b01; // Insert Rs. 10 again
    #20 $finish;
  end

  always #5 clk = ~clk;

endmodule
