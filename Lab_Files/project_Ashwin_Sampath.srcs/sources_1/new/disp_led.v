`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 11:33:56
// Design Name: 
// Module Name: disp_led
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


module disp_led(
    input clk,
    input [3:0] a7, a6, a5, a4, a3, a2, a1, a0,
    output reg [7:0] out, out_sel
    );
    
    wire [7:0] b7, b6, b5, b4, b3, b2, b1, b0;
    bcd2sev_module M0(b0, a0);
    bcd2sev_module M1(b1, a1);
    bcd2sev_module M2(b2, a2);
    bcd2sev_module M3(b3, a3);
    bcd2sev_module M4(b4, a4);
    bcd2sev_module M5(b5, a5);
    bcd2sev_module M6(b6, a6);
    bcd2sev_module M7(b7, a7);
    
    reg [2:0] count;
    slow_clk(clk, slow_clk);
    always@(posedge slow_clk)
    begin
    
    case(count)
     
     3'h0: 
     begin
         out <= b0;
         out_sel <= ~8'h1;

     end
     
     3'h1: 
     begin
         out_sel <= ~8'h2;
         out <= b1;
     end
     
     3'h2: 
     begin
         out_sel <= ~8'h4;
         out <= b2;
     end

     3'h3: 
     begin
         out_sel <= ~8'h8;
         out <= b3;
     end

     3'h4: 
     begin
         out_sel <= ~8'h10;
         out <= b4;
     end
     
     3'h5: 
     begin
         out_sel <= ~8'h20;
         out<=b5;
     end
     
     3'h6: 
     begin
         out_sel <= ~8'h40;
         out <= b6;
     end
     
     3'h7: 
     begin
         out_sel <= ~8'h80;
         out <= b7;
     end
     
     endcase
 end

endmodule
