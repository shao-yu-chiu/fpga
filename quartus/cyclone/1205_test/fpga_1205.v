`timescale 1ns / 1ps
module fpga_1205(
    input p,
	 input rst,
	 input clk,
	 output reg [1:0] Led

    );
	reg [30:0] cnt;
	
	always@(posedge clk)
	begin
	if(cnt==30'd200000000)
		cnt<=0;
	else if(p==1)
			begin
			cnt<=0;
			if(cnt<30'd50000000)begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			cnt<=cnt+1;
			end
			else if(cnt<30'd100000000)begin
			Led[0]=1'b1;
			Led[1]=1'b0;
			cnt<=cnt+1;
			end	
			else if(cnt<30'd150000000)begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			cnt<=cnt+1;
			end	
			else if(cnt<30'd200000000)begin
			Led[0]=1'b0;
			Led[1]=1'b1;
			cnt<=cnt+1;
			end	
			end
	else if(p==0)
			begin
			cnt<=0;
			if(cnt<30'd50000000)begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			cnt<=cnt+1;
			end
			else if(cnt<30'd100000000)begin
			Led[0]=1'b0;
			Led[1]=1'b1;
			cnt<=cnt+1;
			end	
			else if(cnt<30'd150000000)begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			cnt<=cnt+1;
			end	
			else if(cnt<30'd200000000)begin
			Led[0]=1'b1;
			Led[1]=1'b0;
			cnt<=cnt+1;
			end	
			end
	if(rst==0)	
	begin
	Led[0]=1'b1;
	Led[1]=1'b1;
	cnt<=0;
	end
	end

endmodule

