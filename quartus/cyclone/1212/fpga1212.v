module fpga1212(
    input   [3:0]  DIP,
    output reg [3:0] LED,
    input [3:0] PB,
	 input clk,
	 input rst
    );
	 reg flag,wrong;
	 wire o_clk;
	 reg order;
	 reg [3:0] DIPREG;
	divclk dclk(.clk(clk),.rst(reset),.o_clk(o_clk));
	
	reg[2:0] cnt; 
	 always@(posedge o_clk)begin
	 if(DIP==4'b1001)begin
	 	 
		 if(flag==1'b0)begin
			 if(LED==4'b0000 && order==0 )		LED=4'b0001;
				else if(LED==4'b0001 &&order==0)	LED=4'b0010;
				else if(LED==4'b0010 &&order==0) LED=4'b0100;
				else if(LED==4'b0100 &&order==0) LED=4'b1000;
				else if(LED==4'b1000 &&order==0)begin
				order=1;
				end
			 
			 if(LED==4'b0000 && order==1 )		flag=1'b1;
				else if(LED==4'b0001 &&order==1)	LED=4'b0000;
				else if(LED==4'b0010 &&order==1) LED=4'b0001;
				else if(LED==4'b0100 &&order==1) LED=4'b0010;
				else if(LED==4'b1000 &&order==1) LED=4'b0100;
		end
		
		else begin
		LED=PB;
		cnt=3'b000;
		DIPREG = DIP;
		end



	 end
	 
	 else begin
		  flag=1'b0;
		
			 if(DIPREG != DIP) begin
			 DIPREG = DIP;
			 cnt=3'b000;
			order=0;
			 end
			 else begin
			 	if(cnt==3'b000) LED=4'b1111;
			 else if(cnt==3'b001)LED=4'b0000;
			 else if(cnt==3'b010)LED=4'b1111;
			 else if(cnt==3'b011)LED=4'b0000;
			 else if(cnt==3'b100)LED=4'b1111;
			 else if(cnt==3'b101)LED=4'b0000;
			 else if(cnt==3'b111) cnt=cnt-1;
			 cnt=cnt+1;
			 end
			
			 
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

