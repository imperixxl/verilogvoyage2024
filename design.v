`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vending_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vending_machine(
    input [1:0] cash, //'01' is Rs. 10 and '10' is Rs. 20
    input clk, rst, 
    output reg dispense,
    output reg [1:0] retChange
 );
   
     parameter s0 = 2'b00;
     parameter s1 = 2'b01;
     parameter s2 = 2'b10;
     
     reg[1:0] cState;
     reg[1:0] nState;
     
     always@ (posedge clk or posedge rst)
     begin
        if(rst == 1)
            begin
                cState = 0;
                nState = 0;
                retChange = 2'b00;
            end
         else
            cState = nState;
      end
      always@(*)
      begin
         case(cState)
            s0: //state zero - machine either holds no cash or holds a partial value of product
            if(cash == 0) // when no cash is inserted
                begin   
                    nState = s0;
                    dispense = 0;
                    retChange = 0;
                end
            else if(cash == 2'b01) //when a 10 rupee note is inserted
                begin
                     nState = s1;
                     dispense = 0;
                     retChange = 2'b00;
                end
            else if(cash == 2'b10) //when a 20 rupee note is inserted
                begin
                    nState = s2;
                    dispense = 0;
                    retChange = 2'b00;
                end
             s1: //state one - machine currently holds Rs 10
             if(cash == 0) //product costs Rs 30 but any extra note was not inserted
                begin
                    nState = s0;
                    dispense = 0;
                    retChange = 2'b01; //returned Rs 10
                end
              else if(cash == 2'b01) //an additional 10 rupee note is inserted
                begin
                    nState = s2; 
                    dispense = 0;
                    retChange = 2'b00; 
                end
              else if(cash == 2'b10) //a 20 rupee note is inserted
                begin
                    nState = s0;
                    dispense = 1;
                    retChange = 2'b00; //the transaction is complete
                end
              s2: //state two - the machine now holds Rs 20                  
              if(cash == 0) //product costs Rs 30 but an extra Rs 10 note was not inserted
                 begin
                    nState = s0;
                    dispense = 0;
                    retChange = 2'b10; //returned Rs 20
                end
              else if(cash == 2'b01)
                begin
                    nState = s0;
                    dispense = 1;
                    retChange = 2'b00; //transaction complee
                end
              else if(cash == 2'b10)
                begin
                    nState = s0;
                    dispense = 1;
                    retChange = 2'b01; //a Rs 10 note was returned
                end
            endcase
          end
endmodule
