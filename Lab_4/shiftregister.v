`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2019 09:16:00
// Design Name: 
// Module Name: shiftregister
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


module shiftregister(
    input [3:0] in,
    output reg [3:0] out,
    input [1:0] s,
    input clk,
    input clearb,
    input shiftr,
    input shiftl
    );
    
    
    always @(posedge clk, negedge clearb)
    begin
    
    if(clearb==0)
        out <= 2'b00;
    else        
        case(s)
        2'b00: out <= out;
        2'b01:
            out <= {shiftr,out[3],out[2],out[1]};
        2'b10:
            out <= {out[2],out[1],out[0],shiftl};
        2'b11:
            out <= in;
        endcase
    end
endmodule
