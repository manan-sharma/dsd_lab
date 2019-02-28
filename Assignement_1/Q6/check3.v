`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2019 03:11:54
// Design Name: 
// Module Name: check3
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


module check3(
    input [1:0] v1, v2, v3, 
    input turn,
        output out
    );
    wire isP1, isP2, isP3;
    wire isB1, isB2, isB3;
    
    boxValue bv1(v1,turn, isP1, isB1);
    boxValue bv2(v2,turn, isP2, isB2);
    boxValue bv3(v3,turn, isP3, isB3);
    
    assign out = (isB1 & isP2 & isP3) | (isP1 & isB2 & isP3) | (isP1 & isP2 & isB3);
endmodule
