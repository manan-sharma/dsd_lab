`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2019 15:05:49
// Design Name: 
// Module Name: counter_up_down
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


module counter_up_down(
    output reg [3:0] out,
    input [3:0] in,
    input enable, count, clearBar, up_downBar, clk
    );
    always @(posedge clk, negedge clearBar)begin
    if(clearBar == 0) out<= 4'b0000;
    else begin
       case({enable,up_downBar})
       2'b00: out <= out-5;
       2'b01: out <= out+3;
       2'b10: out <= in;
       2'b11: out <= in;
       default: ;
       endcase
       end
    end
endmodule
