module pilli(
	input [3:0]btn,
	input clk,
	output reg [7:0]led
);
reg [26:0] cnt;
integer i;
always@(posedge clk)
begin
	if(cnt==27'd50000000)begin
		cnt<=0;
	end
		for(i=1;i<7;i=i+1)begin
			led[i]<=1'b0;
		end
		for(i=0;i<7;i=i+1)begin
			if(cnt==27d'500000)
			begin
				led[i]<=~led[i];
				led[i+1]<=~led[i+1];
			end
			else
				cnt=cnt+1;
		end
	
end
endmodule