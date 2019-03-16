`timescale 1ns / 1ps

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
in = 1'b1; #250;
$finish;
end

always begin
clk = #50 ~clk;
end 
endmodule
