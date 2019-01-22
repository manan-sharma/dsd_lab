`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2019 10:37:32
// Design Name: 
// Module Name: ripple_carry
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


module ripple_carry(
    output [3:0]S,
    output Cout,
    input [3:0]A,
    input [3:0]B,
    input Cin
    );
    wire c1,c2,c3;
    fulladder F1(A[0],B[0],Cin,S[0],c1);
    fulladder F2(A[1],B[1],c1,S[1],c2);
    fulladder F3(A[2],B[2],c2,S[2],c3);
    fulladder F4(A[3],B[3],c3,S[3],Cout);
endmodule
