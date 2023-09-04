`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:18:10 10/31/2022
// Design Name:   lab_1024_bit
// Module Name:   I:/fpga ppt/109360142/lab_1024_bit/lab_1024_bit_test.v
// Project Name:  lab_1024_bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lab_1024_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab_1024_bit_test;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg S0;
	reg S1;

	// Outputs
	wire W;
	wire X;
	wire Y;
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	lab_1024_bit uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.S0(S0),
		.S1(S1),
		.W(W), 
		.X(X), 
		.Y(Y), 
		.Z(Z)
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
		
        
		// Add stimulus here

	end
		always #100 A=~A;
		always #200 B=~B;
		always #400 C=~C;
		always #800 D=~D;
		always #100 S0=~S0;
		always #200 S1=~S1;
      
endmodule

