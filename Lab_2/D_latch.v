`timescale 1ns / 1ps

module D_latch(output Q,input D,input enable);
reg Q;
always @ (enable or D)
    if(enable) Q<=D;
endmodule
