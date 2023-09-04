`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:55 10/17/2022 
// Design Name: 
// Module Name:    logic_example 
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
module logic_example(
    input X,
    input Y,
    input Z,
    output F
    );

	wire F;
	assign F=(X&~Y)|(Y|Z);
	
endmodule
