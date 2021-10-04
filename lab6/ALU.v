`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 05:39:38 PM
// Design Name: 
// Module Name: ALU
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


module ALU(Result, Mux_Out, S2_ReadData1, S2_ALUOp);

input [31:0] S2_ReadData1;
input [31:0] Mux_Out;
input [2:0] S2_ALUOp;

output reg [31:0] Result;

always @(S2_ALUOp, Mux_Out, S2_ReadData1)
begin
        case(S2_ALUOp)
        3'b000: Result <= ~S2_ReadData1; // Not
        3'b001: Result <= S2_ReadData1; // Mov
        3'b011: Result <= S2_ReadData1 | Mux_Out; // Or
        3'b100: Result <= S2_ReadData1 & Mux_Out; // And
        3'b110: Result <= S2_ReadData1 - Mux_Out; // Sub
        3'b101: Result <= S2_ReadData1 + Mux_Out; // Add
        3'b111: Result <= (($signed(S2_ReadData1) < $signed(Mux_Out)) ? 1:0); // SLT
        endcase
end
endmodule
