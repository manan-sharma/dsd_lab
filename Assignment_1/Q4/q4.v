`timescale 1ns / 1ps
// Q$ : Sequential Multiplier
// Implementing a sequential multiplier using a temporary register and a buffer
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
    // Clear all registers if clearBar == 0
    out <= 0;
    temp <= 0;
    buff <= 0;
    end
    else if(input_start==1)begin 
    // Signal to start the process. Load B into buffer for decrementing
        done <= 0;
        temp <= 0;
        buff <= B;
    end
    else if(input_start==0 && done==0) begin
        temp = temp + A;   // temp is used as a register to store repeated addtion of A
        buff = buff - 1;   // Decremtn buffer till buffer == 0
        if(buff==0)
        begin
        out =  temp;       // When Buffer is 0 set done = 1 and load the value in temp to output
        done = 1;
        end
        else done = 0;
    end
    else 
        out <= out;     // If input and done are 0. Keep latching the value of output (value of previos answer)
    end
endmodule