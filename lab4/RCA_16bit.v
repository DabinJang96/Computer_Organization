`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 09:28:29 AM
// Design Name: 
// Module Name: RCA_16bit
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


module RCA_16bit(c_out, sum, a, b, c_in);

    input [15:0]a;
    input [15:0]b;
    input c_in;
    output [15:0]sum;
    output c_out;
    wire co1, co2, co3;
    
    //Get sum of first four bits of two inputs by wiring it to 4 bit ripple carry adder wire carry outs to next RCA 
    RCA_4bit rfb1(co1, sum[3:0], a[3:0], b[3:0], c_in);
    RCA_4bit rfb2(co2, sum[7:4], a[7:4], b[7:4], co1);
    RCA_4bit rfb3(co3, sum[11:8], a[11:8], b[11:8], co2);
    RCA_4bit rfb4(c_out, sum[15:12], a[15:12], b[15:12], co3);    
    
endmodule
