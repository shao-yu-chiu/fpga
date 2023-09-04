module test_divider(
    input [3:0] P,
	 input clk,
	 output reg [3:0]L

    );
reg  [26:0] cnt;
	always@(posedge clk )
	begin
	if(cnt==27'd50000000)
		cnt<=0;
	else if(P[0]==1'b0 && P[3]==1'b0)
			begin
			cnt<=0;
			if(cnt<27'd25000000)begin
			L[2]<=1'b1;
			L[1]<=1'b1;
			L[0]<=1'b1;
			L[3]<=1'b1;
			cnt<=cnt+1;
			end
			else if(cnt<27'd50000000)begin
			L[2]<=1'b1;
			L[1]<=1'b1;
			L[0]<=1'b0;
			L[3]<=1'b0;
			cnt<=cnt+1;
			end	
			end
	else begin
		cnt<=cnt+1;
		
		L[0]=P[0];
		L[1]=P[1];
		L[2]=P[2];
		L[3]=P[3];
		
	end
	end

endmodule




	
