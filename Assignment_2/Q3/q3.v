`timescale 1ns / 1ps

module nonrestoring8bit(
    input [15:0] divident,
    input [7:0] divisor,
    output reg [7:0] quotient,
    output reg [7:0] rem,
    input clk, 
    output reg done,
    input rst
    );
    reg msbpartial;
    reg [16:0] neg_divisor;
    reg [3:0] counter;
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
        if(counter == 9)
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
            //{msbpartial,remainder} = (temp[16]) ?  {msbpartial,remainder} : temp;
            counter = counter - 1;
            //done = (counter == 0) ? 1 : 0;
            if(counter==0)
                begin
                    done=1;
                    remainder = (msbpartial) ? (remainder - neg_divisor):remainder;
                    rem = remainder[15:8];
                end
            else
                done=0;
            end
         else 
             begin 
             quotient = quotient;
             rem = rem; 
             end   
        end
    end
endmodule
