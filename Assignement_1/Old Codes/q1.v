`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2019 14:41:25
// Design Name: 
// Module Name: swap
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


module swap(
    output reg [7:0] A,B,
    input [7:0] X,Y,
    input clk, swap_loadBar // whaen swap_loadBar is 1 then it swaps else when 0 it l
    );
    always @(posedge clk) begin
    if(!swap_loadBar) begin
        A <= X;
        B <= Y;
    end
    else begin
         B <= #2 A;
         A <= #2 B;
    end
    end
endmodule
