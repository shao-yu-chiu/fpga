`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:09 10/31/2022 
// Design Name: 
// Module Name:    lab_1024_bit 
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
module lab_1024_bit(
    input A,
    input B,
    input C,
    input D,
    input S0,
	 input S1,
    output W,
    output X,
    output Y,
    output Z
    );
	 
	 reg W;
	 reg X;
	 reg Y;
	 reg Z;
	 
	always  @ (S0 or S1 or W or X or Y or Z)
	begin
		if(S1 == 1'b0 && S0 == 1'b0)
		begin
			W=A;
			X=C;
			Y=B;
			Z=D;
		end
		else if(S1 == 1'b0 && S0 == 1'b1)
		begin
			W=B;
			X=D;
			Y=A;
			Z=C;
		end
		else if(S1 == 1'b1 && S0 == 1'b0)
		begin
			W=C;
			X=A;
			Y=D;
			Z=B;
		end
		else if(S1 == 1'b1 && S0 == 1'b1)
		begin
			W=D;
			X=B;
			Y=C;
			Z=A;
		end
	end
endmodule
