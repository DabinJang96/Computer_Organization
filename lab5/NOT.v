`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:34:27 PM
// Design Name: 
// Module Name: NOT
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


module NOT(out, in);

parameter WIDTH = 32;

output [WIDTH-1:0] out;
input [WIDTH-1:0] in;

genvar i;
generate
for (i = 0; i < WIDTH; i=i+1)begin
    not ins (out[i], in[i]);
end
endgenerate
endmodule
