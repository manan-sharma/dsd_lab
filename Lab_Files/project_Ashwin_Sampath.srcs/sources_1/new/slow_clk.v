`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 10:21:08
// Design Name: 
// Module Name: slow_clk
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


module slow_clk(
    input clk,
    output reg s_clk
    );
    
    reg [16:0] count;
    initial
    begin
    s_clk <= 1;
    count <= 0;
    end
    
    always@(posedge clk)
    begin
        count <= count + 1;
        if(count==50000) 
        begin
        s_clk <= ~s_clk;
        count = 0;
        end
        else    s_clk <= s_clk;
    end
    
endmodule
