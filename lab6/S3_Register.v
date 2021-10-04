`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:54:45 PM
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(

    input [31:0] ALUOp_Out,
    input S2_WriteEnable,
    input [4:0] S2_WriteSelect,
    input clk,
    input rst,
   
    output reg  [31:0] S3_ALUOp_Out,
    output reg S3_WriteEnable,
    output reg [4:0] S3_WriteSelect
    );
    
    always @ (posedge clk)
    begin
        if (rst)
        begin
            S3_WriteSelect <= 5'b0;
            S3_WriteEnable <= 1'b0;
            S3_ALUOp_Out <= 32'b0;
        end
        else
            S3_WriteSelect <= S2_WriteSelect;
            S3_WriteEnable <= S2_WriteEnable;
            S3_ALUOp_Out <= ALUOp_Out;
     end
endmodule
