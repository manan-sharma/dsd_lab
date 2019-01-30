`timescale 1ns / 1ps
//4 bit multiplier using behavioural coding
module arraymul4bitbehav(
    input [3:0] a,
    input [3:0] b,
    output [7:0] d
    );
    assign d = a*b;
endmodule
