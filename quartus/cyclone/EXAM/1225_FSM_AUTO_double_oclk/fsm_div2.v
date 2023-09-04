module fsm_div2(
    input PB1,
	 input PB2,
	 input clk,
	 input rst,
	 output reg [1:0] LED
    );
	 reg start1=0;
	 reg start2=0;
	 reg[30:0] cnt;
	 reg [3:0]temp=0;

	 always@(posedge clk)begin
 
	 if(rst==0)
	 begin
	 cnt=0;
	 LED=2'b11;
	 start1=0;
	 start2=0;
	 //temp_oct=0; 
	 end
	 if(PB1==0) 
	 begin
	 start1=1;
	 start2=0;
	 temp=0;
	 cnt=0;
	 end
	 else if(PB2==0) 
	 begin
	 start2=1;
	 start1=0;
	 temp=0;
	 cnt=0;
	 end
	 if(start1==1)
	 begin
	 	 
		 if(cnt==30'd50000000 &&temp==0)
		 begin
		 LED<=2'b00;
		 temp=temp+1;
		 cnt=0;
		 end
		 if(cnt==30'd50000000 &&temp==1)
		 begin
		 LED<=2'b10;
		 temp=temp+1;
		 cnt=0;
		 end
		 else if(cnt==30'd50000000 &&temp==2)
		 begin
		 LED<=2'b01;
		 temp=temp+1;
		 cnt=0;
		 end
		 else if(cnt==30'd50000000 &&temp==3)
		 begin
		 LED<=2'b11;
		 temp=0;
		 cnt=0;
		 end	
		 cnt=cnt+1;
	 end
	 else if(start2==1)
	 begin
		 if(cnt==30'd25000000 &&temp==0)
		 begin
		 LED=2'b00;
		 temp=temp+1;
		 cnt=0;
		 end
		 else if(cnt==30'd25000000 && temp==1)
		 begin
		 LED=2'b01;
		 temp=temp+1;
		 cnt=0;
		 end
		 else if(cnt==30'd25000000 && temp==2)
		 begin
		 LED=2'b10;
		 temp=temp+1;
		 cnt=0;
		 end
		 else if(cnt==30'd25000000 && temp==3)
		 begin
		 LED=2'b11;
		 temp=0;
		 cnt=0;
		 end	
		 cnt=cnt+1;
	 end
	end

endmodule
