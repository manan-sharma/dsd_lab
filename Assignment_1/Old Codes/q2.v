`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2019 14:49:06
// Design Name: 
// Module Name: ALU
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


module ALU(
       output reg [7:0] sum_f1,
       output carry_f2,
       input [7:0] A,B,
       input [2:0] select
    );
    always @(select)begin
        case(select)
        3'b000: sum_f1 = A + B ;
        3'b001: sum_f1 = A - B ;
        3'b010: sum_f1 = A + 2*B ;
        3'b011: sum_f1 = A - 2*B ;
        3'b100: sum_f1 = A[3:0] + B[3:0] ;
        3'b101: sum_f1 = ((A-B)>0) ? A : B ;
        3'b110: sum_f1 = A[7] ? ~A + 1 : A ;
        3'b111: sum_f1 = B ;
        endcase
    end
endmodule
