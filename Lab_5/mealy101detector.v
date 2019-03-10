`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2019 10:29:24
// Design Name: 
// Module Name: mealy101detector
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


module mealy101detector(
    input x,rst,clk,
    output z
    );
    localparam [1:0] reset = 0, got1 = 1, got10 = 2;
    
    reg [1:0] current;
    
    always@(posedge clk) begin
    if(rst) current <= reset;
    else case(current)
            reset: if(x==1'b1) current <= got1 ;
                   else current <= reset;
            got1: if(x==1'b1) current <= got1 ;
                  else current <= got10;
            got10: if(x==1'b1) current <= got1 ;
                   else current <= reset;
            default: current <= reset;
           endcase
      end
      
      assign z = ( current ==got10 && x==1'b1) ? 1'b1 : 1'b0 ;
endmodule
