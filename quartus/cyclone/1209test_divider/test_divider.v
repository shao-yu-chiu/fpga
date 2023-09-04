module test_divider(clk,rst_n,A,K2,K1);
	 input clk,rst_n,A;
	 output reg K2,K1;
	 
	 reg [3:0] state,next_state;
	
    //这里定义状态，采用独热码
	parameter IDLE = 4'b1000,
	          START = 4'b0100,
		  STOP = 4'b0010,
		  CLEAR = 4'b0001;
    //这里实现时序逻辑中的状态转移
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) state <= IDLE;
        else state <= next_state;
    end
    //这里实现组合逻辑中的状态更新以及组合输出
	always@(A)
        case(state)
            IDLE:
                if(A) begin
                    next_state = START;
                    K1 = 1;
                end
                else begin
                    next_state = IDLE;
                    K2 = 1;
                    K1 = 1;
                end
            START:
                if(!A) next_state = STOP;
                else next_state = START;
            STOP:
                if(A) begin
                    next_state = CLEAR;
                    K2 = 0;
                end
                else begin
                    next_state = STOP;
                    K2 = 1;
                    K1 = 1;
                end
            CLEAR:
                if(!A) begin
                    next_state = IDLE;
                    K2 = 1;
                    K1 = 0;
                end
                else begin
                    next_state = CLEAR;
                    K2 = 1;
                    K1 = 1;
                end
            default: next_state = IDLE;
        endcase
				

 
endmodule
