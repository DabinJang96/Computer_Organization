`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 11:00:43 PM
// Design Name: 
// Module Name: Adder_MUX
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


module Adder_MUX(c_out, add_out, sub_out, select);

input add_out, sub_out, select;
output reg c_out;

always @(*)
begin

case(select)

1'b0: c_out = add_out;
1'b1: c_out = sub_out;


default: c_out = 0;

endcase

end
endmodule