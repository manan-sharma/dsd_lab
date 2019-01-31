`timescale 1ns / 1ps
//Serial In Parallel Out 4 bit Shift Register

module SIPO_Shift_Reg(
    inout reg [3:0] out,
    input in,Clk,rst
    );

    DFF d1(out[0],in,Clk,rst);
    DFF d2(out[1],out[0],Clk,rst);
    DFF d3(out[2],out[1],Clk,rst);
    DFF d4(out[3],out[2],Clk,rst);
endmodule
