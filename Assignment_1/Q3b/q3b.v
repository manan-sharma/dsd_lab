`timescale 1ns / 1ps
//Q3b Barrel Shifter using Stage wise Rotation
//It rotates in stages, wherein Nth stage right rotates by 2^N.
module barrelshifter(
    output reg [7:0] data_out,  //Data Output (8bits)
    input [7:0] data_in,    //Data Input (8bits)
    input [2:0] shift      //Shift control
    );
    always @(*)
            begin
            data_out = shift[0] ? {data_in[0],data_in[7:1]} : data_in;	
	    //Loads a right rotated by 1  version of input if LSB of shift is 1, else loads in the input directly

            data_out = shift[1] ? {data_out[1:0],data_out[7:2]}: data_out; 
	    //Right rotates by 2 if middle bit of shift is 1, else retains the previous value

            data_out = shift[2] ? {data_out[3:0],data_out[7:4]} : data_out;
	    //Right rotates by 4 if MSB of shift is 1, else retains previous output
            end
    endmodule