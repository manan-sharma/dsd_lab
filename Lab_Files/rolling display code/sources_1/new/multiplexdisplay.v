`timescale 1ns / 1ps

module multiplexdisplay(
    input clk,
    output reg [7:0] anode,
    output reg [6:0] cathode,
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [3:0] in5,
    input [3:0] in6,
    input [3:0] in7
    );
    reg slowclk;
    reg [18:0] counter;
    reg [3:0] display;
    initial begin
     counter = 0;
     slowclk = 1;
     anode = 8'b11111110;
     display = 0;
    end
    always @(posedge clk)
    begin
        if(counter == 50000)
            begin
                counter <= 0;
                slowclk <= !slowclk; 
            end
        else 
            counter <=  counter + 1;
    end
    always @(posedge slowclk)
    begin
        
        case (anode)
        8'b11111110: display <=in1;
        8'b11111101: display <=in2;
        8'b11111011: display <=in3;
        8'b11110111: display <=in4;
        8'b11101111: display <=in5;
        8'b11011111: display <=in6;
        8'b10111111: display <=in7;
        8'b01111111: display <=in0;
        default: display <= 8;
        endcase
        anode <= {anode[6:0],anode[7]};
        //if(display == 7) display <= 0;
        //else display <= display+1;
        
    end
    always@(*)
    case(display)
        4'b0000: cathode = ~(7'b1111110);
        4'b0001: cathode = ~(7'b0110000);
        4'b0010: cathode = ~(7'b1101101);
        4'b0011: cathode = ~(7'b1111001);
        4'b0100: cathode = ~(7'b0110011);
        4'b0101: cathode = ~(7'b1011011);
        4'b0110: cathode = ~(7'b1011111);
        4'b0111: cathode = ~(7'b1110000);
        4'b1000: cathode = ~(7'b1111111);
        4'b1001: cathode = ~(7'b1111011);
        4'b1010: cathode = ~(7'b1110111);
        4'b1011: cathode = ~(7'b0011111);
        4'b1100: cathode = ~(7'b1001110);
        4'b1101: cathode = ~(7'b0111101);
        4'b1110: cathode = ~(7'b1001111);
        4'b1111: cathode = ~(7'b1000111);
        default: cathode = ~(7'b0000000);
     endcase   

endmodule
