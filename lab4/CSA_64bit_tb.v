`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 09:57:18 PM
// Design Name: 
// Module Name: CSA_64bit_tb
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


module CSA_64bit_tb;
    
    reg [63:0] a, b;
    reg c_in;
    reg clk;
    
    wire c_out;
    wire [63:0] sum;
    wire error_flag;
	wire c_out_verify;
	wire [63:0] sum_verify;
	
	CSA_64bit uut (
	
	    .c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	Verification_64bit_RCA Verification (
	
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	
	// Assign Error Flag
	assign error_flag = ((c_out != c_out_verify) || (sum != sum_verify));

	// Derfine clk signal for both Verfication and Input signal generation	
	always #5 clk = ~clk;

	// Verification logic
	always@(posedge clk)
		begin
		if (error_flag == 1'b1)
			begin
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
			end
		end
		
	initial begin
		// Initialize Inputs
		
		clk = 1'b0;
		a = 1'b0;
		b = 1'b1;
		c_in = 1'b0;

		// Wait 100 ns for global reset to finish
		
        #200
		a = 64'hffffffffffffffff;
		b = 1'b1;
		c_in = 1'b1;
		
		#100
		a = 500000;
		b = 10;
		c_in = 1;
		
		#100
		a = 500000;
		b = 20;
		c_in = 0;
		
	end
		
endmodule
