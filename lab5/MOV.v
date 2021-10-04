`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:34:27 PM
// Design Name: 
// Module Name: MOV
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


module MOV(b, a);

parameter N = 32;

input [N-1:0] a;
output [N-1:0] b;

assign b = a;

endmodule
