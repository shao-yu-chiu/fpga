`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:24 11/21/2022 
// Design Name: 
// Module Name:    Exam 
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
module fpga1127(
    input [3:0]P,
    input clk,
    input rst,
    output reg [3:0]L
    );
	 wire o_clk;
	 reg temp=0;
	 divclk dclk(.clk(clk),.o_clk(o_clk));
	
	always@(o_clk)begin
	if(~P[0]&&~P[3]&&P[1]&&P[2])begin
	//temp=~temp;
	//L[3]<=temp;
	//L[0]<=temp;
	L[3]<=o_clk;
	L[0]<=o_clk;


	L[2]<=1;
	L[1]<=1;
	end
	else begin
	L<=P;
	end
	
	end
	
endmodule

module divclk(
input clk,
input rst, 
output reg o_clk);

parameter N=13500000;
reg [25:0] cnt;

always@(posedge clk or posedge rst) begin

if(rst) begin cnt<=0; end
else if (cnt==(N-1)) begin cnt<=0; end
else begin cnt<=cnt+1'b1;end
end

always@(posedge clk or posedge rst) begin

if(rst) begin o_clk<=0; end
else if (cnt<(N>>1)) begin o_clk<=1'b1; end
else begin o_clk<=1'b0; end
end

endmodule
