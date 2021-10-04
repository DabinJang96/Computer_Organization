`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:17:27 PM
// Design Name: 
// Module Name: Register
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

module Register(reg_out, clk, reg_in);

	parameter WIDTH = 32;

    output [WIDTH-1:0] reg_out;
    input clk;
    input [WIDTH-1:0] reg_in;
	reg [WIDTH-1:0] Reg;

	assign reg_out = Reg; // puts value into register

	always@(posedge clk) // runs the clock.
		begin
		Reg <= reg_in;
		end

endmodule