`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:46 11/28/2022 
// Design Name: 
// Module Name:    fpga1121 
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
module fpga1121(
    input [3:0] P,
	 input clk,
	 output reg [3:0] Led

    );
		reg [26:0] cnt;
	always@(posedge clk )
	begin
	if(cnt==27'd50000000)
		cnt<=0;
	else if(P[0]==1'b1 && P[3]==1'b1)
			begin
			cnt<=0;
			if(cnt<27'd25000000)begin
			Led[2]=1'b0;
			Led[1]=1'b0;
			Led[0]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
			end
			else if(cnt<27'd50000000)begin
			Led[2]=1'b0;
			Led[1]=1'b0;
			Led[0]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
			end	
			end
	else begin
		cnt<=cnt+1;
		
		Led[0]=P[0];
		Led[1]=P[1];
		Led[2]=P[2];
		Led[3]=P[3];
		
	end
	end

endmodule




	

