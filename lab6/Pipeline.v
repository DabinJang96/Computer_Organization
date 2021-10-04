`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );


	// The naming format for wire: Source_Destination_portname
	
	// Stage 1-> Reg file wires
	wire [4:0] S1_Reg_ReadSelect1;
	wire [4:0] S1_Reg_ReadSelect2;
	
	// Stage 1 -> Stage 2 wires
	wire [4:0] S1_S2_WriteSelect;
	wire S1_S2_WriteEnable;
	wire [15:0] S1_Immediate;
	wire S1_Data;
	wire [2:0] S1_ALUOp;
	
	// Reg file -> Stage 2 wires 
	wire [31:0] Reg_S2_ReadData1;
	wire [31:0] Reg_S2_ReadData2;
	
	// Stage 2 -> Stage 3
	wire [4:0] S2_Reg_WriteSelect;
	wire S2_Reg_WriteEnable;
	
	// Stage 2 -> MUX
	wire [15:0] S2_Immediate;
	wire S2_Data;
	wire [31:0] S2_MUX_Readdata2;
	
	// Stage 2 -> ALU 
	wire [31:0] S2_ALU_Readdata1;
	wire [2:0] S2_ALUOp;
	wire [31:0] MUX_ALU_Out;
	
	// ALU -> Stage 3
	wire [31:0] ALU_S3_Out;
	
	// Stage 3 -> Final Output
	//wire [31:0] S3_Final_out;
	
	
	// Stage 3 -> Reg File 
	wire [4:0] S3_WriteSelect;
	wire S3_WriteEnable;
	wire [31:0] S3_ALU_Reg_Out;
	

	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S1_Immediate(S1_Immediate),
		.S1_Data(S1_Data),
		.S1_ALUOp(S1_ALUOp)
   );


	nbit_register_file Register_File (
		.Write_Data(S3_ALU_Reg_Out),								
		.Read_Data_1(Reg_S2_ReadData1),
		.Read_Data_2(Reg_S2_ReadData2),
		.Read_Sel_1(S1_Reg_ReadSelect1),
		.Read_Sel_2(S1_Reg_ReadSelect2),
		.WriteSelect(S3_WriteSelect),
		.WriteEnable(S3_WriteEnable),
		.rst(rst),
		.clk(clk)
	);
		
	
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.S2_ReadData1(S2_ALU_Readdata1),
		.S2_ReadData2(S2_MUX_Readdata2),
		.S2_Immediate(S2_Immediate),
		.S2_Data(S2_Data),
		.S2_ALUOp(S2_ALUOp),
		.S2_WriteSelect(S2_Reg_WriteSelect),
		.S2_WriteEnable(S2_Reg_WriteEnable),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.Immediate(S1_Immediate),
		.ALUOp(S1_ALUOp),
		.Data(S1_Data)
   );
   
   Pipeline_Mux Mux(
        .Result(MUX_ALU_Out),
        .S2_ReadData2(S2_MUX_Readdata2),
        .S2_Immediate(S2_Immediate),
        .S2_Data(S2_Data)
   );
   
   ALU Main_ALU(
        .S2_ReadData1(S2_ALU_Readdata1),
        .Mux_Out(MUX_ALU_Out),
        .S2_ALUOp(S2_ALUOp),
        .Result(ALU_S3_Out)
  );
  
    S3_Register S3_Reg(
        .S3_ALUOp_Out(S3_ALU_Reg_Out),
        .S3_WriteEnable(S3_WriteEnable),
        .S3_WriteSelect(S3_WriteSelect),
        .ALUOp_Out(ALU_S3_Out),
        .S2_WriteEnable(S2_Reg_WriteEnable),
        .S2_WriteSelect(S2_Reg_WriteSelect),
        .clk(clk),
        .rst(rst)
   );
   
   assign Out = S3_ALU_Reg_Out;
   
endmodule
