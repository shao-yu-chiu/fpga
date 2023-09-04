`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:19:58 10/17/2022
// Design Name:   logic_example
// Module Name:   C:/Users/User/Desktop/109360142/lab4_verilog/logic_example_test.v
// Project Name:  lab4_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: logic_example
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module logic_example_test;

	// Inputs
	reg X;
	reg Y;
	reg Z;

	// Outputs
	wire F;

	// Instantiate the Unit Under Test (UUT)
	logic_example uut (
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		Z = 0;

		// Wait 100 ns for global reset to finish
		#4000; 
		$finish;
        
		// Add stimulus here

	end
	always #100 X=~X;
	always #200 Y=~Y;
	always #400 Z=~Z;
      
endmodule

