`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 11:00:43 PM
// Design Name: 
// Module Name: Three_Eight_MUX
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


module Three_Eight_MUX(out_1, mov_out, not_out, add_out, sub_out, or_out, and_out, slct);

input mov_out; 
input not_out;
input add_out;
input sub_out;
input or_out;
input and_out;

input [2:0]slct;
output reg out_1;

always@(*)
begin
case(slct)

3'b000: out_1 = mov_out;  
3'b001: out_1 = not_out;
3'b011: out_1 = and_out;
3'b100: out_1 = or_out;
3'b101: out_1 = sub_out;
3'b110: out_1 = add_out;
default: out_1 = 0;

endcase
end


endmodule
