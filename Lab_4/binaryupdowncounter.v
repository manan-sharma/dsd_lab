`timescale 1ns / 1ps
module binaryupdowncounter(
        input [3:0] data_in,
        output reg [3:0] A_count,
        input clk,
        input clear,
        input load,
        input count,
        input updown
        );
        //up=0 down =1
        always @(posedge clk, negedge clear)
        begin
        if(clear==0)
            A_count<=4'b0000;
        else        
            case({updown,load,count})
            3'b010: A_count<=data_in;
            3'b011: A_count<=data_in;
            3'b001: A_count<=A_count+1;
            3'b000: A_count<=A_count;
            3'b110: A_count<=data_in;
            3'b111: A_count<=data_in;
            3'b101: A_count<=A_count-1;
            3'b100: A_count<=A_count;
            endcase
        end
endmodule
