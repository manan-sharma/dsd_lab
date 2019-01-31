`timescale 1ns / 1ps

module TFF(Q,T,Clk,rst);
    output Q;
    input T,Clk,rst;
    wire DT;
    assign DT = Q ^ T;
    DFF TF1(Q,DT,Clk,rst);
endmodule
