`timescale 1ns / 1ps

//this code shifts left. beware!!!!
module displaynumber(
    input clk,
    output [7:0] anode,
    output [6:0] cathode
    );
    reg[31:0] disp;
    reg[25:0] counter;
    reg slowclk1;
    initial begin
        counter=0;
        slowclk1=1;
        disp={4'b0010,4'b0100,4'b0110,4'b100,4'b0110,4'b0100,4'b0010,4'b0001};
    end
    always @(posedge clk)
    begin
        if (counter == 50000000)
            begin
            counter<=0;
            slowclk1<=!slowclk1;
            end
        else
            counter<=counter+1;
    end
    always @(posedge slowclk1)
    begin
        disp <= {disp[3:0],disp[31:4]};
    end
    multiplexdisplay m1(clk,anode,cathode,disp[31:28],disp[27:24],disp[23:20],disp[19:16],disp[15:12],disp[11:8],disp[7:4],disp[3:0]);
    //multiplexdisplay m1(clk,anode,cathode,1,2,3,4,5,6,7,9);
endmodule
