`timescale 1ns / 1ps
module 	test_1205(
    input p,
	 input rst,
	 input pplus,
	 input clk,
	 output reg [1:0] Led

    );
	wire o_clk; 
	parameter S0=2'b11;
	parameter S1=2'b10;
	parameter S2=2'b01;
	parameter S3=2'b00;
	
	reg [1:0] curr_state;
	reg [1:0] next_state;
	
	divclk div(.clk(clk),.o_clk(o_clk));
	always@(posedge o_clk or negedge rst)
	begin
	if(rst==0)	
	begin
	next_state<=S0;
	end
	else if(pplus==0)
	begin
	N=N/2;
	end
	else 
	begin
		if(p==1)
				begin
				case(curr_state)
				S0:next_state<=S1;
				S1:next_state<=S2;
				S2:next_state<=S3;
				S3:next_state<=S0;
				endcase
				end
		else if(p==0)
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

