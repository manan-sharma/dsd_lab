`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2019 05:16:07
// Design Name: 
// Module Name: multi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multi(
    output reg [15:0] out,
    output reg done,
    input [7:0] A,B,
    input clk, input_start
    );
    reg[15:0] temp;
    reg [7:0] buff;
    always @(posedge clk) begin
    if(input_start==1)begin 
        done = 0;
        temp = 0;
        buff = B;
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
        out = out;
    end
endmodule
