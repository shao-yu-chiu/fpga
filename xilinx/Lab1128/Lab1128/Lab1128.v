`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:19 12/05/2022 
// Design Name: 
// Module Name:    Lab1128 
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
module Lab1128(
    input p,
	 input rst,
	 input clk,
	 output reg [1:0] Led

    );
	 
	parameter state=2'b00, state_next=2'b00;
	reg [27:0] cnt;

	always@(posedge clk)
	begin
	if(p)
	begin
		if(state!=2'b11)
		begin
		state_next<=state+1;
		state<=state_next;
		Led<=state;
		cnt<=0;
		while(cnt<100000)
		begin 
		cnt<=cnt+1;
		end
		end
		
		else
		begin
		state<=1;
		cnt<=0;
		while(cnt<100000)
		begin 
		cnt<=cnt+1;
		end
		end
	end
	
	
	end

endmodule

