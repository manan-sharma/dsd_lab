`timescale 1ns / 1ps
module BCD_Adder(
    output C,
    output [3:0] Y1,
    output [3:0] Y0,
    input [3:0] A1,
    input [3:0] A0,
    input [3:0] B1,
    input [3:0] B0
    );
    wire[4:0] s0,s1; 
    wire carry;
    
    assign s0 = A0 + B0;
    assign {carry,Y0} = (s0>9) ? (s0+6) : s0;
    assign s1 = A1 + B1 + carry;
    assign {C,Y1} = (s1>9) ? (s1+6) : s1;    
endmodule
