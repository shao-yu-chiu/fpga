`timescale 1ns / 1ps
module fpga1212(
    input [3:0] P,
	 input clk,
	 input [3:0]dip,
	 output reg [3:0] Led

    );
	reg [26:0] cnt;
	parameter state1=0;
	parameter state2=0;
	
	always@(posedge clk )
	begin
	
	Led[0]=P[0];
	Led[1]=P[1];
	Led[2]=P[2];
	Led[3]=P[3];
	
	if(cnt==27'd48000000)
	begin
		cnt<=0;
	end
	else if(dip[0]==1 && dip[1]==0 && dip[2]==0 && dip[3]==1 & state1==0)
	begin
		state2=0;
		if(cnt<27'd5000000)
		begin
			Led[0]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd10000000)
		begin
			Led[0]=1'b0;
			Led[1]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd15000000)
		begin
			Led[1]=1'b0;
			Led[2]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd20000000)
		begin
			Led[2]=1'b0;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd25000000)
		begin
			Led[3]=1'b0;
			Led[2]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd30000000)
		begin
			Led[2]=1'b0;
			Led[1]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd35000000)
		begin
			Led[1]=1'b0;
			Led[0]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd40000000)
		begin
			Led[0]=1'b0;
			cnt<=cnt+1;
		end
		else if(cnt==27'd40000000)
		begin
			state1=1;
		end
	end
	
	else
	begin
		state1=0;
		cnt<=cnt+1;
		if(cnt<27'd8000000 && state2==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd16000000 && state2==0)
		begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		end
		else if(cnt<27'd24000000 && state2==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd32000000 && state2==0)
		begin 
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		end
		else if(cnt<27'd40000000 && state2==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd48000000 && state2==0)
		begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		else if(cnt==27'd48000000)
		begin
		state2=1;
		end
		end
	end
end
endmodule
