`timescale 1ns / 1ps
// Q5 Up Down Counter
// Counts up by 3 when enable=0 and up_downBar=1
// Counts down by 5 when enable=0 and up_downBar=0
// Count value is retained when enable=1
// clearbar is fed as asynchronous clear
module counter_up_down(
    output reg [3:0] out,			//Output of the counter
    input enable, clearBar, up_downBar, clk
    );
    always @(posedge clk, negedge clearBar)
    begin
    if(clearBar == 0) out<= 4'b0000;		//To clear the output
    else begin
       case({enable,up_downBar})
       2'b00: out <= out-5;	//Down Count
       2'b01: out <= out+3;	//Up Count
       default: out <= out;	//Retain value
       endcase
       end
    end
endmodule
