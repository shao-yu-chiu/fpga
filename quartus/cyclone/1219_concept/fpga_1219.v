module fpga_1219(
    input   [3:0]  DIP,
    input PB,
	 input clk,
	 input rst,
	 output reg [3:0] LED
    );
	 reg order=0;
	 reg start=0;
	 //reg temp_oct=0;
	 
	 reg[30:0] cnt;
	 reg [3:0]state=4'b0000; 
	 always@(posedge clk)begin
 
	 if(rst==0)
	 begin
	 cnt=0;
	 LED=4'b1111;
	 order=0;
	 state=4'b0000;
	 start=0;
	 //temp_oct=0; 
	 end
	 if(PB==0) start=1;
	 if(start==1)
	 begin
		 if(state==DIP && order==0)
		 begin
		 cnt=0;
		 order=order+1;
		 state=0;
		 end
		 else if(state!=DIP )
		 begin
			cnt=cnt+1;
			if(cnt==30'd50000000 && order==0 && state==0)
			begin
				LED[0]=0;
				state=state+1'b1;
				//temp_oct=temp_oct+1'd1;
				cnt=0;
			end
			
			else if(cnt==30'd50000000 && order==0 && state==1)
			begin
				LED[1]=0;
				state=state+1'b1;
				//temp_oct=temp_oct+1'd1;
				cnt=0;
			end

			else if(cnt==30'd50000000 && order==1 && state==0)
			begin
				LED[2]=0;
				state=state+1'b1;
				//temp_oct=temp_oct+1'd1;
				cnt=0;
			end
			
			else if(cnt==30'd50000000 && order==1 && state==1)
			begin
				LED[3]=0;
				state=state+1'b1;
				//temp_oct=temp_oct+1'd1;
				cnt=0;
			end
			else if(cnt==30'd50000000 && order==0 )
			begin
				state=state+1'b1;
				//temp_oct=temp_oct+1'd1;
				cnt=0;
			end
			
			
		 end
		 
		 
	   end 
	end

endmodule
