`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 11:23:45 PM
// Design Name: 
// Module Name: TOP
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


module TOP(Reg, c_out, zero, overflow, clk, a, b, c_in, ALUOp);

parameter WIDTH = 32;

output [WIDTH-1:0] Reg;
output reg c_out;
output reg zero;
output reg overflow;

input clk;
input [WIDTH-1:0] a, b; 
input [2:0] ALUOp;
input c_in;

wire [WIDTH-1:0] result;
wire c_outi;

Multiple_Bit_ALU alu(.result(Reg), .c_out(c_outi), .a(a), .b(b), .c_in(c_in), .ALUOp(ALUOp));// calls the nbit alu
Register register(Reg, clk, result);// stores output of alu in register

always@(*)
begin
if (ALUOp == 3'b101)
    assign c_out = ~c_outi;
else
    assign c_out = c_outi;
    overflow = (c_out > 0) ? 1:0;
if (Reg == 0)
    zero = 1'b1;
else
    zero = 1'b0;
end

endmodule