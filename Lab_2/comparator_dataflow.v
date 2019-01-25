`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2019 15:02:19
// Design Name: 
// Module Name: comparator_dataflow
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


module comparator_dataflow(
    input [3:0] A,
    input [3:0] B,
    output ALTB,
    output AEQB,
    output AGTB
    );
    assign AEQB = (A==B);
    assign ALTB = (A<B);
    assign AGTB = (A>B);
endmodule
