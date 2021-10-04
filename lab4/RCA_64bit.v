`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 09:54:22 AM
// Design Name: 
// Module Name: RCA_64bit
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


module RCA_64bit(c_out, sum, a, b, c_in);
    
    input [63:0] a, b;
    input c_in;
    output [63:0]sum;
    output c_out;
    
    wire co1, co2, co3;
    
    RCA_16bit rtb1(co1, sum[15:0], a[15:0], b[15:0], c_in);
    RCA_16bit rtb2(co2, sum[31:16], a[31:16], b[31:16], co1);
    RCA_16bit rtb3(co3, sum[47:32], a[47:32], b[47:32], co2);
    RCA_16bit rtb4(c_out, sum[63:48], a[63:48], b[63:48], co3);
    
endmodule
