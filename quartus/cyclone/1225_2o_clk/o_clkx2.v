`timescale 1ns / 1ps
module 	o_clkx2(
    input p1,
	 input p2,
	 input rst,
	 input clk,
	 output reg [1:0] Led

    );
	wire o_clk2;  
	wire o_clk1; 
	parameter S0=2'b11;
	parameter S1=2'b10;
	parameter S2=2'b01;
	parameter S3=2'b00;
	
	reg [1:0] curr_state;
	reg [1:0] next_state;
	reg start1=0;
	reg start2=0;
	divclk1 div1(.clk(clk),.o_clk1(o_clk1));
	always@(posedge o_clk1 or negedge rst)
	begin
	if(rst==0)	
	begin
	next_state<=S0;
	end
	else 
	begin
		if(p1==0)
		begin
			start1=1;
			start2=0;
		end
		if(start1==1)
				begin
				case(curr_state)
				S0:next_state<=S1;
				S1:next_state<=S2;
				S2:next_state<=S3;
				S3:next_state<=S0;
				endcase
				end
	end
	end
	always@(posedge o_clk2 or negedge rst)
	begin
	if(rst==0)	
	begin
	next_state<=S0;
	end
	else 
	begin
		if(p2==0)
		begin
			start2=1;
			start1=0;
		end
		if(start2==1)
				begin
				case(curr_state)
				S0:next_state<=S3;
				S3:next_state<=S2;
				S2:next_state<=S1;
				S1:next_state<=S0;
				endcase			
				end
	end
	end
	always@(*)
	begin
	curr_state<=next_state;
	Led<=curr_state;
	end
	
endmodule

module divclk(
input clk,
input rst, 
output reg o_clk1,
output reg o_clk2
);

parameter N=13500000;
parameter N1=27000000;
reg [25:0] cnt;

always@(posedge clk or posedge rst) begin

if(rst) begin cnt<=0; end
else if (cnt==(N-1)) begin cnt<=0; end
else begin cnt<=cnt+1'b1;end

if(rst) begin cnt<=0; end
else if (cnt==(N1-1)) begin cnt<=0; end
else begin cnt<=cnt+1'b1;end
end

always@(posedge clk or posedge rst) begin

if(rst) begin o_clk1<=0; end
else if (cnt<(N>>1)) begin o_clk1<=1'b1; end
else begin o_clk1<=1'b0; end
end


always@(posedge clk or posedge rst) begin

if(rst) begin o_clk2<=0; end
else if (cnt<(N1)) begin o_clk2<=1'b1; end
else begin o_clk2<=1'b0; end
end

endmodule

