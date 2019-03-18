`timescale 1ns / 1ps
//Nonrestoring 8 bit divison
module nonrestoring8bit(
    input [7:0] divident,
    input [7:0] divisor,
    output reg [7:0] quotient,
    output reg [7:0] rem,
    input clk, 
    output reg done,		//done becomes 1 when operation is complete
    input rst			//active low reset
    );
    reg msbpartial;	
    reg [16:0] neg_divisor;
    reg [3:0] counter;//counter to keep track of the no of clock cycles elapsed
    reg [15:0] remainder;	
    always @(posedge clk, negedge rst)
    begin
    if (rst==0)
    begin
        done <= 0;
        counter <= 9;   // 8 clocks for ouput and 1 clock to load 
        quotient <= 0;
        msbpartial <= 0;
        rem <= 0;
    end
    else
    begin
        if(counter == 9)	//to load the data initally
        begin
            remainder <= divident;
            neg_divisor <= {(~divisor + 1),8'b00000000};
            counter <= counter -1;
        end
        else if(counter>0) 
            begin
            {msbpartial,remainder} = ({msbpartial,remainder}<<1);
            if(msbpartial == 0)
                {msbpartial,remainder} = ({msbpartial,remainder}) + neg_divisor;
            else
                {msbpartial,remainder} = ({msbpartial,remainder}) - neg_divisor;
            quotient = (quotient<<1);
            if(msbpartial==1) 
                quotient = quotient;
            else 
                quotient = (quotient + 1'b1);
            counter = counter - 1;
            if(counter==0)
                begin
                    done=1;
                    remainder = (msbpartial) ? (remainder - neg_divisor):remainder;
                    rem = remainder[15:8];
                end
            else
                done=0;
            end
         else 	//hold the results
             begin 
             quotient = quotient;
             rem = rem; 
             end   
        end
    end
endmodule
