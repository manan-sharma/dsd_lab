`timescale 1ns / 1ps
//Q3a (using case statement and shifting right within a single clock cycle)
module barrelshifter(
    output reg [7:0] data_out,  //Data Output (8bits)
    input [7:0] data_in,    //Data Input (8bits)
    input [2:0] shift,      //Shift control
    input clk,               //Clock
    input clear             //Active low clear pin, used to initially set the output to zero
    );
    
    always @(posedge clk, negedge clear)
    begin
        if (clear==0)
            data_out<=8'b00000000;
        else
        case(shift)
        3'b000: data_out <= data_in;
        3'b001: data_out <= {data_in[0],data_in[7:1]};
        3'b010: data_out <= {data_in[1:0],data_in[7:2]};
        3'b011: data_out <= {data_in[2:0],data_in[7:3]};
        3'b100: data_out <= {data_in[3:0],data_in[7:4]};
        3'b101: data_out <= {data_in[4:0],data_in[7:5]};
        3'b110: data_out <= {data_in[5:0],data_in[7:6]};
        3'b111: data_out <= {data_in[6:0],data_in[7]};
        endcase
    end
endmodule
