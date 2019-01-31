`timescale 1ns / 1ps
// D FF with asynchronous reset

module DFF(inout reg Q, input D, Clk,rst);
    always @(posedge Clk, negedge rst)
    begin
        if(!rst) Q<=1'b0;
        else Q<= D;
    end
endmodule
