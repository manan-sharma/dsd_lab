`timescale 1ns / 1ps
//Testbench for divisibility by 3 check 
module testBench_q1();
reg in, clk, rst;
wire REM;

remainder3 rem( .in(in), .REM(REM), .clk(clk), .rst(rst));

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
in = 1'b1; #250;
$finish;
end

always begin
clk = #50 ~clk;
end 
endmodule
