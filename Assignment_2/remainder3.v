`timescale 1ns / 1ps
module remainder3(
    input in,
    output out,
    input clk,
    input rst
    );
    localparam [1:0] s0=0, s1=1, s2=2;
    reg [1:0] current;
    always @(posedge clk)
    begin
    if(rst)
        current<=s0;
    else
        case(current)
        s0: if(in==1'b1) current <= s1;
            else current<=s0;
        s1: if(in==1'b1) current <= s0;
            else current <=s2;
        s2: if(in==1'b1) current <=s2;
            else current<=s1;
        default: current <= s0;
        endcase
    end 
    assign out = ((current==s1 && in==1'b1)||(current==s2))? 1'b1 : 1'b0;
endmodule
