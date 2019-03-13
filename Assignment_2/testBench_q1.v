`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2019 04:55:13
// Design Name: 
// Module Name: testBench_q1
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


module testBench_q1();
reg in, clk, rst;
wire out;

remainder3 rem( .in(in), .out(out), .clk(clk), .rst(rst));

initial begin
clk = 1'b1;
rst = 1'b1; #100
rst =1'b0; in = 1'b0; #50;
in = 1'b0; #50;
in = 1'b1; #50;


in = 1'b0; rst = 1'b1; #100;
rst = 1'b0;
in = 1'b0; #100;
in = 1'b0; #100;
in = 1'b1; #150;
$finish;
end

always begin
clk = #50 ~clk;
end 
endmodule
