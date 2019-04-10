`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 11:50:47
// Design Name: 
// Module Name: test
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


module test(
    input clk, 
    output [7:0] out, out_sel
    );
    
    disp_led u0(clk, 4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7, 4'h8, out, out_sel);

endmodule
