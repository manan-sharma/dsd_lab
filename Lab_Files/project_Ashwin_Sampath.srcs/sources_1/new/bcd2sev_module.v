`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 11:27:28
// Design Name: 
// Module Name: bcd2sev_module
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


module bcd2sev_module(
    output reg [7:0] out,
    input [3:0] bcd
    );
    
    always@(*)
    begin
        case(bcd)
            4'b0000: out <= ~8'h3f;
            4'b0001: out <= ~8'h06;
            4'b0010: out <= ~8'h5b;
            4'b0011: out <= ~8'h4f;
            4'b0100: out <= ~8'h66;
            4'b0101: out <= ~8'h6d;
            4'b0110: out <= ~8'h7d;
            4'b0111: out <= ~8'h07;
            4'b1000: out <= ~8'h7f;                
            4'b1001: out <= ~8'h6f;
            4'b1010: out <= ~8'h77;
            4'b1011: out <= ~8'h7c;                
            4'b1100: out <= ~8'h39;
            4'b1101: out <= ~8'h5e;
            4'b1110: out <= ~8'h79;
            4'b1111: out <= ~8'h71;
        endcase
    end
endmodule
