module fpga1219(
	input [3:0]DIP,
	input rst,
	input pb,
	input clk,
	output reg [3:0]LED
    );
	reg temp=0; 
	reg [3:0] cnt;
	reg start=0;
	wire o_clk;
	divclk dclk(.clk(clk),.o_clk(o_clk),.rst(rst));
	
	always@(posedge o_clk) begin
		if(rst==0) begin
		cnt=4'b0000;
		LED=4'b1111;
		start=0;
		end
		else if(pb==0)
		begin
		start=1;
		temp=0;
		end
		
		if(cnt==4'b0000)
				begin
					LED[0]=0;
				end
				
		if(start)
		begin
			if(cnt!=DIP )//&& temp==0
			begin
				if(cnt==4'b0000)
				begin
					LED[0]=0;
				end
				
				else if(cnt==4'b0001)
				begin
					LED[1]=0;
				end
				else if(cnt==DIP)
				begin
					cnt=0;
					temp=temp+1;
				end
				
			cnt=cnt+1'b1;	
			end
			else if(cnt==DIP && temp==0)
			begin
			cnt=0;
			temp=1;
			end
			else if(cnt!=DIP && temp==1)
			begin
				if(cnt==4'b0001)
				begin
					LED[2]=0;
				end
				
				else if(cnt==4'b0010)
				begin
					LED[3]=0;
				end
				else if(cnt==DIP)
				begin
					cnt=0;
					temp=temp+1;
				end
			cnt=cnt+1'b1;	
			end
			else if(cnt==DIP && temp==1)
			begin
			temp=2;
			end
		end
	end
endmodule

module divclk(
input clk,
input rst, 
output reg o_clk);

parameter N=27000000;
reg [27:0] cnt;

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
