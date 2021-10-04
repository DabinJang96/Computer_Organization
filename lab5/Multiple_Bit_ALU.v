`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 07:36:26 AM
// Design Name: 
// Module Name: Multiple_Bit_ALU
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


module Multiple_Bit_ALU(result, c_out, a, b, c_in, ALUOp);

    parameter WIDTH = 32;
    
    input [WIDTH-1:0] a;
    input [WIDTH-1:0] b;
    input c_in;
    input [2:0] ALUOp;
    
    
    output [WIDTH-1:0] result;
    output c_out;

    wire [WIDTH:0] carry;
    wire c_change;

    assign carry[0] = c_change; //This is required so that subtraction can work properly.

    assign c_change = ALUOp[0] ? 1'b1 : 1'b0;
   
genvar i;
generate
	for(i = 0; i < WIDTH; i = i + 1) 
		begin: alu
		OneB_ALU alu(result[i], carry[i+1], a[i], b[i], carry[i], ALUOp[2:0]);
		end
endgenerate

    assign c_out = carry[WIDTH];

endmodule 