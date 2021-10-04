`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 09:47:29 PM
// Design Name: 
// Module Name: CSA_64bit
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


module CSA_64bit(c_out, sum, a, b, c_in);
   
   input [63:0] a, b;
   input c_in;
   output c_out;
   output [63:0] sum;
   wire c_out1, c_out2, select;
   wire [31:0] sum1, sum2;
   wire c, d;
   assign c = 1'b1;
   assign d = 1'b0;
   
   RCA_32bit csa1(select, sum[31:0], a[31:0], b[31:0], c_in);
   RCA_32bit csa2(c_out1, sum1[31:0], a[63:32], b[63:32], d);
   RCA_32bit csa3(c_out2, sum2[31:0], a[63:32], b[63:32], c);
   MUX_32bits mux(c_out, sum[63:32], select, sum1[31:0], sum2[31:0], c_out1, c_out2);
   
endmodule
