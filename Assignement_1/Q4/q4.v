`timescale 1ns / 1ps

module multi(
    output reg [15:0] out,
    output reg done,
    input [7:0] A,B,
    input clk, input_start, clearBar
    );
    reg[15:0] temp;
    reg [7:0] buff;
    always @(posedge clk, negedge clearBar) begin
    if(!clearBar) begin 
    out <= 0;
    temp <= 0;
    buff <= 0;
    end
    else if(input_start==1)begin 
        done <= 0;
        temp <= 0;
        buff <= B;
    end
    else if(input_start==0 && done==0) begin
        temp = temp + A;
        buff = buff - 1;
        if(buff==0)
        begin
        out =  temp;
        done = 1;
        end
        else done = 0;
    end
    else 
        out <= out;
    end
endmodule