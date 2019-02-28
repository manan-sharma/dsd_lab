`timescale 1ns / 1ps
// Q1 : Swap Registers
// Loading and Swapping registers using if - else and non-blocking statements 
module swap(
    output reg [7:0] A,B,
    input [7:0] X,Y,
    input clk, swap_loadBar // whaen swap_loadBar is 1 then it swaps else when 0 it l
    );
    always @(posedge clk) begin
    if(!swap_loadBar) begin
    // if swap_loadBar == 0 then load the registers
        A <= X;
        B <= Y;
    end
    else begin
    // Swap the register values with each other
         B <= #2 A;
         A <= #2 B;
    end
    end
endmodule
