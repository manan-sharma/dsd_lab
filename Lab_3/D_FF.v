`timescale 1ns / 1ps
module D_FF(Q,D,Clk);
    output Q;
    input D,Clk;
    reg Q;
    always @(posedge Clk)
        Q<=D;
endmodule
