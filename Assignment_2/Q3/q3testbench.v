`timescale 1ns / 1ps

module q3testbench();
reg [15:0] divident;
reg [7:0] divisor;
wire [7:0] quotient;
wire [7:0] rem;
reg clk;
wire done;
reg rst;

nonrestoring8bit res(.divident(divident), .divisor(divisor), .quotient(quotient), .rem(rem), .clk(clk), .done(done), .rst(rst));

initial begin
clk = 0;
rst=0;#100;
rst=1;
divisor = 4;
divident = 15;#1100;

rst=0;#100;
rst=1;
divisor = 2;
divident = 16;#1100;

rst=0;#100;
rst=1;
divisor = 10;
divident = 110;#1100;

rst=0;#100;
rst=1;
divisor = 1;
divident = 15;#1100;
$finish;
end

always begin
clk = #50 ~clk;
end
endmodule
