`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:41 10/17/2022
// Design Name:   LAB5_1017
// Module Name:   C:/Users/User/Desktop/109360142/lab5_1017_verilog/lab5_1017_test.v
// Project Name:  lab5_1017_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LAB5_1017
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab5_1017_test;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg S0;
	reg S1;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	LAB5_1017 uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.S0(S0), 
		.S1(S1), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		S0 = 0;
		S1 = 0;

		// Wait 100 ns for global reset to finish
	//	#3000;
    //  $finish;  
		// Add stimulus here

	end
   always #100 A=~A;
	always #200 B=~B;
	always #400 C=~C;
	always #800 D=~D;
	always #1000 S0=~S0;
	always #2000 S1=~S1;
	
   
endmodule

