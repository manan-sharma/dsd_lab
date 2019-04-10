`timescale 1ns / 1ps


module displaynumber(
    input clk,
    output [7:0] anode,
    output [6:0] cathode
    );
    multiplexdisplay m1(clk,anode,cathode,2,4,6,8,6,4,2,1);
endmodule
