`timescale 1ns / 1ps
//Moore machine implementation for divisbility by 3 check.
module remainder3(
    input in,		//input
    output REM,
    input clk,
    input rst		//active high reset
    );
    localparam [1:0] start=2'b00, s0=2'b01, s1=2'b10, s2=2'b11;
    reg [1:0] current;
    always @(posedge clk, posedge rst)begin
    if(rst) begin		//reset condition
    current<=start;
    end
    else
        case(current)		//FSM starts
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
    assign REM = (current==s0)? 1'b1 : 1'b0;
endmodule
