`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2019 10:17:20
// Design Name: 
// Module Name: fulladder_with_halfadder
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


module fulladder_with_halfadder(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    wire s1,c1,c2;
    halfadder h1(x,y,s1,c1);
    halfadder h2(s1,cin,s,c2);
    or o1(cout,c1,c2);
endmodule
