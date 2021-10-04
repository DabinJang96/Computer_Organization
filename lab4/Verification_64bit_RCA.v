`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 10:02:24 AM
// Design Name: 
// Module Name: Verification_64bit_RCA
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


module Verification_64bit_RCA(c_out, sum, a, b, c_in);
    
    input [63:0] a, b;
    input c_in;
    output c_out;
    output [63:0] sum;
    
    assign {c_out, sum} = a + b + c_in;
    
endmodule
