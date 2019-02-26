`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2019 03:11:54
// Design Name: 
// Module Name: check3
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


module boxValue(
    input[1:0] value, 
    input turn,
    output isPresent, isBlank
    );
    wire isX,isZero;
    
    assign isX = (value[1] & value[0]);
    assign isZero = ~(value[1] | value[0]);
    
    assign isPresent = (turn & isX) | (~turn & isZero);
    assign isBlank = ~(isX | isZero);
endmodule
