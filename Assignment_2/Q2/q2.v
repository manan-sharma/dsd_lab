`timescale 1ns / 1ps

module restoring8bit(
    input [15:0] divident,
    input [7:0] divisor,
    output reg [7:0] quotient,
    output reg [7:0] rem,
    input clk, 
    output reg done,
    input rst
    );
    reg [15:0] remainder;
    reg msbpartial;
    reg [16:0] neg_divisor, temp;
    reg [3:0] counter;
    
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
        else if(counter!=0) 
            begin
            {msbpartial,remainder} = ({msbpartial,remainder}<<1);
            temp = ({msbpartial,remainder}) + neg_divisor;
            quotient = (quotient<<1);
            if(temp[16]==1) 
                quotient = quotient;
            else 
                quotient = (quotient + 1'b1);
            {msbpartial,remainder} = (temp[16]) ?  {msbpartial,remainder} : temp;
            counter = counter - 1;
            if (counter==0)
                begin
                done=1;
                rem = remainder[15:8];
                end
            else
                done=0;
            end
         else 
             begin 
             quotient = quotient;
             remainder = remainder; 
             end   
        end
    end
endmodule
