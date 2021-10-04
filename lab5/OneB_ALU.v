`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:50:38 PM
// Design Name: 
// Module Name: ALU
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


module OneB_ALU(result, c_out, a, b, c_in, ALUOp);

input a;
input b;
input c_in;
input [2:0] ALUOp;

output result;
output c_out;

wire mov_out, not_out, add_out, sub_out, or_out, and_out;
wire c_out_add, c_out_sub, not_b;
wire add_sub_slc;

assign add_sub_slc = (ALUOp == 3'b101);
not not_1(not_b, b);


//calls each module
MOV mov(mov_out, a);
NOT Not(not_out, a);
AND And(and_out,a,b);
OR Or (or_out, a, b);

FA_str adder(c_out_add, add_out, a, b, c_in);
FA_str subtracter(c_out_sub, sub_out, a, not_b, c_in); // uses the same full adder, but with a negate b => b' + 1

Adder_MUX cout_mux(c_out, c_out_add, c_out_sub, add_sub_slc); // outputs a cout for adder
Three_Eight_MUX main_mux(result, mov_out, not_out, add_out, sub_out, or_out, and_out, ALUOp); // selects which output to use. 



endmodule