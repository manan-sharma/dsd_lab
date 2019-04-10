`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 11:15:40
// Design Name: 
// Module Name: bcd_counter_impl
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


module bcd_counter_impl(
   output reg [3:0] out1,out0,
   output reg [7:0] out, out_sel,
   input clk, clear, load, count,
   input [3:0] in1, in0
 
    );
    slow_clk(clk, slow_clock);
    always@(posedge slow_clk or negedge clear)
    bcd
        
always@(posedge slow_clock)
            begin
            
            count <= count + 1;
            
                case(count)
                
                3'h0: 
                begin
                    out_sel <= ~8'h1;
                    out <= ~8'h3f;
                end
                
                3'h1: 
                begin
                    out_sel <= ~8'h2;
                    out <= ~8'h06;
                end
                
                3'h2: 
                begin
                    out_sel <= ~8'h4;
                    out <= ~8'h5b;
                end
        
                3'h3: 
                begin
                    out_sel <= ~8'h8;
                    out <= ~8'h4f;
                end
        
                3'h4: 
                begin
                    out_sel <= ~8'h10;
                    out <= ~8'h66;
                end
                
                3'h5: 
                begin
                    out_sel <= ~8'h20;
                    out <= ~8'h6d;
                end
                
                3'h6: 
                begin
                    out_sel <= ~8'h40;
                    out <= ~8'h7d;
                end
                
                3'h7: 
                begin
                    out_sel <= ~8'h80;
                    out <= ~8'h07;
                end
                
                endcase
            end
endmodule
