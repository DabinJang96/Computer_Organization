`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 
	clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 30 ns for global reset to finish
        //		---- I type ---
		#0
		InstrIn = 32'b011000_00001_00001_1111111111111111; // I type, NOT r1 with FFFFFFFF => r1 = FFFFFFF5
		
		#30
		InstrIn = 32'b011001_00010_00010_0000000010101010; // I type, MOVE r2 with 000000AA => r2 = 00000014
		
		#30
		InstrIn = 32'b011011_00011_00011_1010101010101010; // I type OR R3 with FFFFAAAA => r3 = FFFFAABE
		
		#30
        InstrIn = 32'b011011_00100_00100_0000000000000010; // I type, OR r4 with 00000002 => r4 = 0000002A
        
        #30
        InstrIn = 32'b011100_00101_00101_0000000011111111; // I type, AND r5 with 000000FF => r5 = 00000032
        
        #30
        InstrIn = 32'b011110_00110_00110_0000000000111100; // I type, SUB r6 with 0000003C => r6 = 00000000
		
		#30
		InstrIn = 32'b011101_00001_00001_0000000000001010; // I type, ADD r1 with 0000000A => r1 = FFFFFFFF
		
		#30
        InstrIn = 32'b011111_00100_00100_1111111111111111; // I type, SLT r4 with FFFFFFFF => r4 = 00000000
        
        //		---- R type ---
		
        #30
        InstrIn = 32'b010000_00010_00001_00011_00000000000; // R type, NOT r1 with r3, r2 => 00000000
        
        #30
        InstrIn = 32'b010001_00110_00011_00100_00000000000; // R type MOVE r3 with r4, r6 => FFFFAABE
        
        #30
        InstrIn = 32'b010111_00001_00100_00101_00000000000; // R type OR r4 with r5, r1 => 00000001
        
        #30
        InstrIn = 32'b010100_00101_00101_00011_00000000000; // R type AND r5 with r3, r5 => 00000032
        
        #30
        InstrIn = 32'b010101_00011_00001_00010_00000000000; // R type, ADD r1(0000000A) with r2(00000002) => r3 = 00000001
        
        #30
        InstrIn = 32'b010110_00100_00001_00010_00000000000; // R type, SUB r1(0000000A) with r2(00000002) => r4 = 00000001
        
        #30
        InstrIn = 32'b010111_00110_00011_00001_00000000000; // R type, SLT r3 with r1 => r6 = 00000000
		
        // End Test
  
	end
      
endmodule

