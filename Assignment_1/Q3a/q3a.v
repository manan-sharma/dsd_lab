`timescale 1ns / 1ps
//Q3a - Barrel Shifter using case statement.
//Barrel shifter is a combinational circuit that performs ROR operation.
module barrelshifter(
    output reg [7:0] data_out, //Data Output (8bits)
    input [7:0] data_in,       //Data Input (8bits)
    input [2:0] shift          //Shift control
    );
    
    always @(*) //Combinational Circuit
    begin
        case(shift)//Using case statement to infer a MUX that selects the corresponding bits from input
        3'b000: data_out = data_in; 				//No rotate
        3'b001: data_out = {data_in[0],data_in[7:1]};		//Right Rotate by 1
        3'b010: data_out = {data_in[1:0],data_in[7:2]};		//Right Rotate by 2
        3'b011: data_out = {data_in[2:0],data_in[7:3]};		//Right Rotate by 3
        3'b100: data_out = {data_in[3:0],data_in[7:4]};		//Right Rotate by 4	
        3'b101: data_out = {data_in[4:0],data_in[7:5]};		//Right Rotate by 5
        3'b110: data_out = {data_in[5:0],data_in[7:6]};		//Right Rotate by 6		
        3'b111: data_out = {data_in[6:0],data_in[7]};		//Right Rotate by 7
        endcase
    end
endmodule
