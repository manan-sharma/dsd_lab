`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2019 15:25:57
// Design Name: 
// Module Name: mux2to1_procedural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2to1_procedural(
    output out,
    output outbar,
    input a,
    input b,
    input sel
    );
    reg out, outbar;
    always @ (a or b or sel)
    begin
        if (sel) out = a;
        //else out = b;
        outbar = ~out;
    end
endmodule
