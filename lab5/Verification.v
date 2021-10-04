`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 07:54:29 AM
// Design Name: 
// Module Name: Verification
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

module Verification(result_v, c_out_v, clk, a, b, ALUOp);

	parameter W = 32;
	
	input [2:0] ALUOp;
	input clk;
	input [W-1:0] a, b;
	
	output reg[W-1:0] result_v;
	output reg c_out_v;
	
    always @(*)
    begin
        case(ALUOp)
            default: c_out_v = 0;
            3'b000: {c_out_v, result_v} = a; 
            3'b001: {c_out_v, result_v} = ~a;
            3'b011: {c_out_v, result_v} = a&b;
            3'b100: {c_out_v, result_v} = a|b;
            3'b101: {c_out_v, result_v} = a + (~b +1); 
            3'b110: {c_out_v, result_v} = a + b;
        endcase
    end
endmodule
