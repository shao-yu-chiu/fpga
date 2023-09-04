`timescale 1ns / 1ps
module fpga1212(
    input [3:0] P,
	 input clk,
	 input [3:0]dip,
	 output reg [3:0] Led

    );
	reg [26:0] cnt;
	parameter state;
	
	always@(posedge clk )
	begin
	
	if(cnt==27'd54000000)
	begin
		cnt<=0;
	end
	else if(dip[0]==1 && dip[1]==0 && dip[2]==0 && dip[3]==1 )
	begin
		
		//Led[0]=1'b0;
		//Led[1]=1'b0;
		//Led[2]=1'b0;
		//Led[3]=1'b0;
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
	end
	
	else  
	begin
		cnt<=cnt+1;
		if(cnt<27'd8000000 && state==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd16000000 && state==0)
		begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		end
		else if(cnt<27'd24000000 && state==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd32000000 && state==0)
		begin 
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		end
		else if(cnt<27'd40000000 && state==0)
		begin
			Led[0]=1'b1;
			Led[1]=1'b1;
			Led[2]=1'b1;
			Led[3]=1'b1;
			cnt<=cnt+1;
		end
		else if(cnt<27'd48000000 && state==0)
		begin
			Led[0]=1'b0;
			Led[1]=1'b0;
			Led[2]=1'b0;
			Led[3]=1'b0;
			cnt<=cnt+1;
		end
	end
end
endmodule
