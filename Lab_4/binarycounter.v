`timescale 1ns / 1ps
module binarycounter(
        input [3:0] data_in,
        output reg [3:0] A_count,
        input clk,
        input clear,
        input load,
        input count
        );
        
        always @(posedge clk, negedge clear)
        begin
        if(clear==0)
            A_count<=4'b0000;
        else        
            case({load,count})
            2'b10: A_count<=data_in;
            2'b11: A_count<=data_in;
            2'b01: A_count<=A_count+1;
            2'b00: A_count<=A_count;
            endcase
        end
endmodule
