`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 02:37:52 PM
// Design Name: 
// Module Name: forwardunit
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


module forwardunit(forwardA, forwardB, EXMEM_Rd, MEMWB_Rd, IDEX_Rs, IDEX_Rt, EXMEM_RegWrite, EXMEM_MemWrite, MEMWB_RegWrite);
    
    // input
    input [4:0] EXMEM_Rd;
    input [4:0] MEMWB_Rd;
    input [4:0] IDEX_Rs;
    input [4:0] IDEX_Rt;
    
    input EXMEM_RegWrite;
    input EXMEM_MemWrite;
    input MEMWB_RegWrite;
    
    // output
    output reg [1:0] forwardA;
    output reg [1:0] forwardB;
    
    always@(*)
    begin
    forwardA = 2'b00;
    forwardB = 2'b00;
    
    if (EXMEM_RegWrite && (EXMEM_Rd != 0) && EXMEM_Rd == IDEX_Rs) // One Ahead
        begin
            forwardA = 2'b10;
        end
    else if (MEMWB_RegWrite && (MEMWB_Rd != 0) && MEMWB_Rd == IDEX_Rs) // Two Ahead
        begin
            forwardA = 2'b01;
        end
        else begin
            forwardA = 2'b00;
        end
        
    if (EXMEM_RegWrite && (EXMEM_Rd != 0) && (EXMEM_Rd == IDEX_Rt)) // One Ahead
        begin
            forwardB = 2'b10;
        end
    else if (MEMWB_RegWrite && (MEMWB_Rd != 0) && MEMWB_Rd == IDEX_Rt) // Two Ahead
        begin
            forwardB = 2'b01;
        end
    else
        begin
            forwardB = 2'b00;
        end
    end
endmodule
