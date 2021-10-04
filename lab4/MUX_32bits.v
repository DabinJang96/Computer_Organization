`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 09:42:34 PM
// Design Name: 
// Module Name: MUX_32bits
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


module MUX_32bits(carry, sum, select, a, b, c_out1, c_out2);

    input select;
    input [31:0] a, b;
    input c_out1, c_out2;
    output carry;
    output [31:0] sum;
    
    assign carry = select ? c_out2: c_out1;
    assign sum = select ? b : a;
    
endmodule
