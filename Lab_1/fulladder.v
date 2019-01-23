`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2019 09:58:18
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    wire a,b,c,d,e;
    xor x2(d,x,y);
    xor x1(s,d,cin);
    and a1(a,x,y);
    and a2(b,cin,x);
    and a3(c,cin,y);
    or o2(e,a,b);
    or o1(cout,e,c);
endmodule
