`timescale 1ns / 1ps

module barrelshifter(
    output reg [7:0] data_out,  //Data Output (8bits)
    input [7:0] data_in,    //Data Input (8bits)
    input [2:0] shift,      //Shift control
    input clk,               //Clock
    input clear             //Active low clear pin, used to initially set the output to zero
    );
    reg[2:0] a;
    always @(posedge clk, negedge clear)
    begin
        if(clear==0)
            begin
            data_out<=8'b00000000;
            a <= 2'b10;
            end
        else
            begin
                if(a==2)
                    begin
                    data_out <= shift[0] ? {data_in[0],data_in[7:1]} : data_in;
                    a<=2'b01;
                    end
                else if(a==1)
                    begin
                    data_out <= shift[1] ? {data_out[1:0],data_out[7:2]}: data_out;
                    a<=2'b00;
                    end
                else if(a==0)
                    begin
                    data_out <= shift[2] ? {data_out[3:0],data_out[7:4]} : data_out;
                    a<=2'b11;
                    end
                else
                    data_out<=data_out;
            end
    end
endmodule