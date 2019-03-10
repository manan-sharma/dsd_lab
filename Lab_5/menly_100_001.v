`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2019 10:50:08
// Design Name: 
// Module Name: menly_100_001
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


module menly_100_001(
    output A,B, // A for 100 B for 001
    input clk,rst,x
    );
    localparam [2:0] reset = 0, got1 = 1, got10 = 2, got0 = 3, got00 = 4;
    reg [2:0] current;
    always@(posedge clk, negedge rst) begin
    if(!rst) current <= reset;
    else case(current)
         reset: if(x==1'b1) current <= got1 ;
                else current <= got0 ;
         got1:  if(x==1'b1) current <= got1 ;
                else current <= got10 ;
         got10: if(x==1'b1) current <= got1 ;
                else current <= got00 ;
         got0:  if(x==1'b1) current <= got1 ;
                else current <= got00 ;
         got00: if(x==1'b1) current <= got1 ;
                else current <= got00 ;
         default: current <= reset ;
         endcase
     end
     assign A = (current==got10 && x==1'b0) ? 1'b1 : 1'b0;
     assign B = (current==got00 && x==1'b1) ? 1'b1 : 1'b0;       
endmodule
