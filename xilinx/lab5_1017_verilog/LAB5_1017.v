`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:24 10/17/2022 
// Design Name: 
// Module Name:    LAB5_1017 
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
module LAB5_1017(
    input A,
    input B,
    input C,
    input D,
    input S0,
    input S1,
    output Y
    );
	wire Y;
	assign Y=(~S1&(((~S0)&A)|(S0&B)))|(S1&(((~S0)&C)|(S0&D)));

endmodule
