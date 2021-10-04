`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 09:31:10 AM
// Design Name: 
// Module Name: RCA_4bit
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


module RCA_4bit(c_out, sum, a, b, c_in);
    
    input [3:0]a;
    input [3:0]b;
    input c_in;
    output c_out;
    output [3:0]sum;
    wire fa1_cout, fa2_cout, fa3_cout;
    
    FA_str FA1(fa1_cout, sum[0], a[0], b[0], c_in);
    FA_str FA2(fa2_cout, sum[1], a[1], b[1], fa1_cout);
    FA_str FA3(fa3_cout, sum[2], a[2], b[2], fa2_cout);
    FA_str FA4(c_out, sum[3], a[3], b[3], fa3_cout);
    
endmodule
