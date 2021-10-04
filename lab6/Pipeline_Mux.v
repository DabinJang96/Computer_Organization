`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 05:33:12 PM
// Design Name: 
// Module Name: Pipeline_Mux
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


module Pipeline_Mux(Result, S2_ReadData2, S2_Immediate, S2_Data);

input [31:0] S2_ReadData2;
input [15:0] S2_Immediate;
input S2_Data;

output reg [31:0] Result;

wire [31:0] Imm_Extension;
assign Imm_Extension = {{16{S2_Immediate[15]}}, S2_Immediate};

always @ (S2_ReadData2 or S2_Immediate or S2_Data) 
begin
	if(S2_Data)
	begin
    Result <= Imm_Extension;
  	end
    else
  	Result <= S2_ReadData2;
end
endmodule

