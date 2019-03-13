`timescale 1ns / 1ps
module remainder3(
    input in,
    output out,
    input clk,
    input rst
    );
    localparam [1:0] start=2'b00, s0=2'b01, s1=2'b10, s2=2'b11;
    reg [1:0] current;
    always @(posedge clk, posedge rst)begin
    if(rst) begin
    current<=start;
    end
    else
        case(current)
        start: if(in==1'b1) current <= s1;
                else current <= s0;
        s0: if(in==1'b1) current <= s1;
            else current<=s0;
        s1: if(in==1'b1) current <= s0;
            else current <=s2;
        s2: if(in==1'b1) current <=s2;
            else current<=s1;
        default: current <= s0;
        endcase
    end 
    assign out = ((current==s1 && in==1'b1)||(current==s2)||(current==s0 && in==1'b0))? 1'b1 : 1'b0;
endmodule
