`timescale 1ns / 1ps
 
module barrelshifter(
    output reg [7:0] data_out,  //Data Output (8bits)
    input [7:0] data_in,    //Data Input (8bits)
    input [2:0] shift      //Shift control
    );
    always @(*)
            begin
                data_out = shift[0] ? {data_in[0],data_in[7:1]} : data_in;
                data_out = shift[1] ? {data_out[1:0],data_out[7:2]}: data_out;
                data_out = shift[2] ? {data_out[3:0],data_out[7:4]} : data_out;
            end
    endmodule