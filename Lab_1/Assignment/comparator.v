`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2019 15:11:14
// Design Name: 
// Module Name: mux2to1
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


module comaprator(
    input [1:0]A,
    input [1:0]B,
    output AGTB,
    output ALTB,
    output AEQB
    );
    wire a,b,c,d;
    xor xo1(a,A[0],B[0]);
    xor xo2(b,A[1],B[1]);
    nor nr1(AEQB,a,b);
    
    wire a1not,a0not,e,f,g;
    not n1(a1not,A[1]);
    and a1(e,a1not,B[1]);
    or o1(f,a1not,B[1]);
    not n2(a0not,A[0]);
    and a2(g,a0not,B[0],f);
    or o2(ALTB,e,g);
    
    wire b1not,b0not,x,y,z;
    not n3(b1not,B[1]);
    and a3(x,b1not,A[1]);
    not n4(b0not,B[0]);
    and a4(y,A[0],b1not,b0not);    
    and a5(z,A[0],A[1],b0not);
    or o3(AGTB,x,z,y);
        
endmodule
