`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 09:49:04 AM
// Design Name: 
// Module Name: RCA_32bit
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


module RCA_32bit(c_out, sum, a, b, c_in);

    input [31:0] a,b;
    input c_in;
    output c_out;
    output [31:0]sum;
    wire co1;
    
    RCA_16bit rsb1(co1, sum[15:0], a[15:0], b[15:0], c_in);
    RCA_16bit rsb2(c_out, sum[31:16], a[31:16], b[31:16], co1);
    
endmodule
