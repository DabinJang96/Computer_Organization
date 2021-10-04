`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 11:23:45 PM
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb();

    parameter WIDTH = 32;
    //inputs
	reg clk;
	reg [WIDTH-1:0] a;
	reg [WIDTH-1:0] b;
	reg c_in;
	reg [2:0] ALUOp;
	

    //outputs
	wire [WIDTH-1:0] Reg;
	wire [WIDTH-1:0] Reg_v;
	wire error_flag;
	wire c_out, c_out_v;
	wire overflow;
	wire zero;
	
	
	// Instantiate the Unit Under Test (UUT)
	
	 TOP uut (
		.Reg(Reg),
        .c_out(c_out),
		.clk(clk),
		.zero(zero),
		.overflow(overflow), 
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.ALUOp(ALUOp)
	);
	
	Verification uut2 (
	   .result_v(Reg_v),
	   .c_out_v(c_out_v),
	   .clk(clk),
	   .a(a),
	   .b(b),
	   .ALUOp(ALUOp)
	);
	   
	
	// Assign Error_flag
	assign error_flag = (Reg != Reg_v || c_out != c_out_v);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
	
	
always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		//MOV: 000, NOT: 001, AND: 011, OR: 100, SUB: 101, ADD:110
		
		clk = 0;
		a = 1;
		b = 0;
		c_in = 0;
		ALUOp = 0;

		
	   //MOV Test
		#100; // 100 ns for reset. 
        a = 12349876;
		b = 98765432;
		c_in = 1;
		ALUOp = 3'b000;
		
		#100;
		a = 0;
		b = 12341234;
		c_in = 0;
		ALUOp = 3'b000;
		
		//NOT Test
		#100;
        a = 1;
		b = 1;
		c_in = 0;
		ALUOp = 3'b001;
		
		#100;
		a = 98768520;
		b = 74109630;
		c_in = 0;
		ALUOp = 3'b001;
		
		//AND Test
		#100;
		a = 0;
		b = 1;
		c_in = 1;
		ALUOp = 3'b011;
		
		#100;
		a = 15978462;
		b = 93854821;
		c_in = 1;
		ALUOp = 3'b011;
		
		//OR Test
		#100;
		a = 1;
		b = 0;
		c_in = 0;
		ALUOp = 3'b100;
		
		#100;
		a = 45621397;
		b = 64587912;
		c_in = 1;
		ALUOp = 3'b100;
		
		//SUB Test
		//Same Value
		#100;
		a = 12345678;
		b = 12345678;
		c_in = 1;
		ALUOp = 3'b101;
		
		// 0 - 1
		#100;
		a = 0;
		b = 1;
		c_in = 1;
		ALUOp = 3'b101;
		
		// 1 - 0
		#100;
		a = 1;
		b = 0;
		c_in = 1;
		ALUOp = 3'b101;
		
		// Random - 0
		#100;
		a = 98765432;
		b = 0;
		c_in = 0;
		ALUOp = 3'b101;
		
		//Random - Random
		#100;
		a = 98765432;
		b = 12345678;
		c_in = 0;
		ALUOp = 3'b101;
		
		//Add Test 
		#100;
		a = 32'hffffffff;
		b = 1;
		c_in = 0;
		ALUOp = 3'b110;
		
		#100;
		a = 32'hfffffff1;
		b = 1;
		c_in = 0;
		ALUOp = 3'b110;
		
		#100;
		a = 0;
		b = 1;
		c_in = 0;
		ALUOp = 3'b110;
		
		#100;
		a = 32'hfffffffA;
		b = 10;
		c_in = 0;
		ALUOp =3'b110;
		
	end
      
endmodule
